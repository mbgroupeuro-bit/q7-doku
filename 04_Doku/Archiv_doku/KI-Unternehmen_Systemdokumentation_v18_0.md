# KI-UNTERNEHMEN (Q7) — VOLLSTÄNDIGE SYSTEMDOKUMENTATION v18.0
**Erstellt:** 19.06.2026 | **System-Version:** v18.0 (2026-06-19) | **GUI-Version:** GUI_v2.0

> **Hinweis:** Q7 bezeichnet das KI-Betriebssystem selbst — ausschließlich KI-Agenten und Maschinen-Logik, kein reales Unternehmen mit menschlichen Mitarbeitern. Einziger Mensch im System ist der GF.

---

## ÄNDERUNGSHISTORIE

| Version | Datum | Änderungen |
|---------|-------|------------|
| v12.0 | 29.05.2026 | Integration Backup-, Failover- und RBAC-Architektur |
| v13.0 | 16.06.2026 | Einführung DRI. Behebung K4-Sicherheitswiderspruch |
| v13.1 | 16.06.2026 | Hierarchie-Korrektur, SuperAgent, RBAC-Update, Systemcontrolling erweitert |
| v13.2 | 16.06.2026 | Unveränderlichkeits-Protokoll (Audit-Trail), Hash-Validierung |
| v14.0 | 16.06.2026 | MAJOR: Desktop-GUI als zentrale Schnittstelle, 4 Module, Anomalie-Erkennung |
| v15.0 | 16.06.2026 | MAJOR: Neue 6-Ordner-Grundarchitektur. Einführung A01_Planung_BackOffice mit Hermes-Agent. Quarantäne-Logik im Input. Checkpoint-System für Agenten. Onboarding-Phase 0. GUI erweitert auf 5 Module |
| v16.0 | 19.06.2026 | MAJOR: Quarantäne zur vollständigen Sicherheitsschleuse ausgebaut (3 Filterstufen). Neue Abteilung A13_Personal — vollständiger Agenten-Lebenszyklus. Hierarchie erweitert auf A02–A13. |
| v17.0 | 19.06.2026 | MAJOR: 99_Gefaengnis mit 3 Einzelisolierzellen. GUI um mobilen Zugriff erweitert. Auftragsdetailansicht. Zeitfenster-Audit + Re-Trigger. Anomalie A7. Inkrementelles Backup. Sonntagsregel. Trennzeichen-Konventionen. Kunden-Feedback. Prozess-Register. |
| **v18.0** | **19.06.2026** | **MAJOR: Neue Q7-Unternehmenskultur (Kap. 28) mit 8 Werten, Kommunikationston, Entscheidungsmaximen, Code of Conduct — Ordner `05_UNTERNEHMEN/08_Q7_Kultur`. Change-Management-Architektur für die Testphase (Kap. 29) mit HART/FLEXIBEL-Klassifizierung, Change-Log, GF-Feedback-Queue. Bug-Tracking-System (Kap. 30) mit BUG-ID-Format, Pflicht-Reporting bei jedem Fehler, GUI-Modul BUGS. Agenten-Individualdokumentation auf 4-Säulen-Struktur umgestellt (Kap. 15.1a): README.md, identitaet.md, stellenbeschreibung.md, regeln.md pro Agent — ersetzt den bisherigen 5-Datei-Standardsatz aus `02_Grundlagen`.** |

---

## 1. GESAMT-HIERARCHIE

```
👑 GF — GESCHÄFTSFÜHRER
   (Mensch — höchste Instanz, alle Rechte)
   ↕
🖥️  DESKTOP-OBERFLÄCHE (GUI_v2.0)
   [INBOX] [AUFTRÄGE] [FREIGABEN] [AGENTEN] [PROTOKOLL] [🐛 BUGS]
   ↕
🧠 SUPER-AGENT (A00)
   (Beobachtet, lernt, schlägt vor — keine Entscheidungsbefugnis)
   ↓
🎯 HERMES-AGENT — A01_Planung_BackOffice
   (Koordination, Arbeitsvorbereitung, Qualitätskontrolle)
   ↓
🤖 MASTER-AGENT (Primär) + BACKUP-AGENT (Sekundär)
   ↓
📁 A02–A13 FACHABTEILUNGEN
```

### Hierarchie-Regeln

- **GF** = einziger Mensch, vollständige Kontrolle, kann jeden Agenten abschalten
- **GUI** = einzige Schnittstelle zwischen GF und System — kein direkter Ordnerzugriff
- **Super-Agent** = beobachtet alles, bereitet Entscheidungen vor, hat KEINE Entscheidungsbefugnis (Ausnahme: Kultur-Vorschläge, siehe Kap. 28.4)
- **Hermes** = Abteilungsleiter Planung & BackOffice, koordiniert alle Aufträge, erstellt Workflows
- **Master-Agent** fällt aus → Backup-Agent springt automatisch ein
- Beide ausgefallen → Systemcontrolling schlägt Alarm → GF entscheidet manuell via GUI

### Die vier Ebenen im Vergleich

| Ebene | Wer | Funktion |
|-------|-----|----------|
| Kontrolle | GF (Mensch) | Entscheidet, freigibt, stoppt |
| Beobachtung | Super-Agent | Überwacht, lernt, schlägt vor |
| Koordination | Hermes-Agent | Plant, verteilt, prüft |
| Ausführung | Fachabteilungen A02–A13 | Spezialisierte Arbeit |

---

## 2. GRUNDARCHITEKTUR — 6 HAUPT-ORDNER

```
📁 ROOT
│
├── 📁 01_INPUT          ← Alles von der Außenwelt
├── 📁 02_KI-UNTERNEHMEN ← Das KI-Betriebssystem
├── 📁 03_OUTPUT         ← Alles was Agenten erstellt haben
├── 📁 04_TRESOR         ← Nur sensible Daten (verschlüsselt)
├── 📁 05_UNTERNEHMEN    ← Unternehmensdaten & Betriebswissen
├── 📁 06_WISSEN         ← Allgemeines & spezielles Wissen
└── 📄 CHANGELOG_v17_v18.md  ← NEU v18.0: laufender Änderungstracker (Kap. 29)
```

### Logik der 6 Ordner

| Ordner | Frage | Inhalt |
|--------|-------|--------|
| 01_INPUT | Was kommt rein? | Alles von der Außenwelt |
| 02_KI-UNTERNEHMEN | Wer arbeitet? | Das gesamte KI-System |
| 03_OUTPUT | Was geht raus? | Alle Agenten-Ergebnisse |
| 04_TRESOR | Was ist geheim? | Personenbezogene & sicherheitskritische Daten |
| 05_UNTERNEHMEN | Wer sind wir? | Betriebliches Wissen & Dokumentation (inkl. Q7-Kultur, NEU) |
| 06_WISSEN | Was wissen wir? | Externes & allgemeines Wissen |

### Wichtige Trennlinie: 04_TRESOR vs. 05_UNTERNEHMEN

- **04_TRESOR:** Name, Adresse, Bankdaten eines Kunden → personenbezogen, sicherheitskritisch, verschlüsselt, nur via DRI
- **05_UNTERNEHMEN:** Produktkatalog, Lieferantenverträge, Produktionsprozesse, Preislisten, Q7-Kultur → betriebliches Wissen, intern zugänglich

---

## 3. ORDNER 01_INPUT — DETAILSTRUKTUR & SICHERHEITSSCHLEUSE

*(unverändert zu v17.0 — siehe Kap. 3.1–3.5: Quarantäne, H-01, drei Sicherheitsfilter, 99_Gefaengnis, Rückfrage-Prozess, Freigabe-Logik, Protokollierung. Diese Struktur gilt als HART/unverrückbar, siehe Kap. 29.1.)*

**Kurzreferenz Struktur:**
```
📁 01_INPUT
├── 📁 01_Quarantäne   (nur H-01 hat Zugriff; 3 Filter; 99_Gefaengnis mit 3 Zellen bei Fund)
├── 📁 02_Eingang
├── 📁 03_In_Bearbeitung
├── 📁 04_Wartend
└── 📁 05_Archiv
```

**SLA Quarantäne:** 15 Minuten gesamt (Filter 1–3). Überwachung: 11SC-01.
**Whitelist Dateiformate:** .pdf, .docx, .xlsx, .txt, .jpg, .jpeg, .png, .webp, .csv.
**Verboten:** .exe, .bat, .sh, .js, .vbs, .ps1, passwortgeschützte .zip, Makro-Office-Dateien.

---

## 4. ORDNER 03_OUTPUT — DETAILSTRUKTUR

*(unverändert zu v17.0)*

```
📁 03_OUTPUT
├── 📁 01_In_Arbeit
├── 📁 02_Zur_Freigabe
├── 📁 03_Freigegeben
├── 📁 04_Versendet
└── 📁 05_Archiv
```

---

## 5. ORDNER 04_TRESOR — DATENSCHUTZ & DRI

*(unverändert zu v17.0 — HART/unverrückbar)*

```
📁 04_TRESOR (Isoliert, verschlüsselt)
├── 📁 K4_Personen
├── 📁 K4_Zahlungen
├── 📁 K4_Zugangsdaten
├── 📁 K4_SuperAgent
└── zugriffsprotokoll_v1.md
```

Exklusiver DRI-Zugriff: **08F-02_Invoicing**. RAM-only-Verarbeitung, kein persistenter Klartext.

---

## 6. ORDNER 05_UNTERNEHMEN — BETRIEBSWISSEN

**NEU v18.0:** Ordner `08_Q7_Kultur` ergänzt (siehe Kap. 28).

```
📁 05_UNTERNEHMEN
│
├── 📁 01_Produkte
├── 📁 02_Prozesse
├── 📁 03_Vertraege
├── 📁 04_Finanzen
├── 📁 05_Qualitaet
├── 📁 06_Marketing
├── 📁 07_Onboarding
│
└── 📁 08_Q7_Kultur                  ← NEU v18.0
    ├── q7_werte_v1.md
    ├── q7_kommunikation_v1.md
    ├── q7_entscheidungsmaximen_v1.md
    └── q7_code_of_conduct_agenten_v1.md
```

---

## 7. ORDNER 06_WISSEN — WISSENSBASIS

*(unverändert zu v17.0)*

```
📁 06_WISSEN
├── 📁 01_Allgemeines_Wirtschaft
├── 📁 02_Branchenwissen
├── 📁 03_Marktdaten
├── 📁 04_Technologie
├── 📁 05_Recht_Compliance
└── 📁 06_Best_Practices
```

---

## 8. ORDNER 02_KI-UNTERNEHMEN — SYSTEMSTRUKTUR

```
📁 02_KI-UNTERNEHMEN
│
├── 📁 00_GUI                 ← Desktop-Oberfläche (Konfig, Logs, Snapshots, NEU: TESTPHASE-BUG-REPORTS)
├── 📁 00_Shared
├── 📁 00_Input-Validator
├── 📁 A00_SuperAgent         ← NEU v18.0: Unterordner 05_Kultur_Entwicklung (Kap. 28.4)
├── 📁 A01_Planung_BackOffice
├── 📁 A02_Marketing
├── 📁 A03_Vertrieb
├── 📁 A04_PM
├── 📁 A05_QM
├── 📁 A06_Verwaltung
├── 📁 A07_Recht
├── 📁 A08_Finanzen
├── 📁 A09_Dokumentation
├── 📁 A10_KI-Center
├── 📁 A11_Systemcontrolling
├── 📁 A12_Zukunftsforschung
└── 📁 A13_Personal
```

---

## 9. A01_PLANUNG_BACKOFFICE — HERMES-ABTEILUNG

*(unverändert zu v17.0 — siehe Auftragsablauf, Agenten-Kürzel H-00 bis H-05, intelligente Workflow-Erstellung)*

```
01_INPUT/01_Quarantäne
   ↓ H-01: Annehmen & analysieren
   ↓ H-00 (Hermes): Workflow erstellen
   ↓ H-02: Arbeitsvorbereitung
   ↓ H-03: Koordinieren & überwachen
   ↓ Fachabteilungen A02–A13: Facharbeit
   ↓ H-04: Qualitätskontrolle
   ↓ H-05: Abschließen & melden
```

---

## 10. CHECKPOINT-SYSTEM FÜR AGENTEN

*(unverändert zu v17.0 — Auftrag wird in Einzelschritte unterteilt, Freigabe nach jedem Schritt, Varianten-Prinzip)*

---

## 11. LERNPHASEN — STÜCK FÜR STÜCK ABGEBEN

*(unverändert zu v17.0 — Phase 1 Manuell, Phase 2 Assistiert, Phase 3 Autonom, Phase 4 Optimiert. Schwelle für Autonomie: 20 gleichartige Aufträge mit konsistenten GF-Entscheidungen.)*

---

## 12. PHASE 0 — UNTERNEHMENS-ONBOARDING

**Ergänzung v18.0:** Vor dem fachlichen Fragenkatalog durchläuft jeder neue Agent zusätzlich **Schritt 0 — Q7-Kulturinduktion** (siehe Kap. 28.5) sowie die Erstellung seiner vier individuellen Dokumente (siehe Kap. 15.1a).

*(Fragenkatalog Produkte/Kunden/Qualität/Kommunikation/Prozesse unverändert zu v17.0 — Ergebnis gespeichert in `05_UNTERNEHMEN/07_Onboarding/`)*

---

## 13. DESKTOP-OBERFLÄCHE (GUI_v2.0)

**NEU v18.0:** Sechstes Modul **🐛 BUGS** ergänzt (siehe Kap. 30.4).

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  KI-UNTERNEHMEN                                  [GF: Name]  [🔒]          │
├──────────┬──────────┬──────────┬──────────┬──────────────┬────────────────┤
│  INBOX   │ AUFTRÄGE │FREIGABEN │ AGENTEN  │   PROTOKOLL  │   🐛 BUGS      │
└──────────┴──────────┴──────────┴──────────┴──────────────┴────────────────┘
```

*(Module INBOX, AUFTRÄGE, FREIGABEN, AGENTEN, PROTOKOLL, Auftragsdetailansicht, Zeitfenster-Audit, GUI-Sicherheit — unverändert zu v17.0, siehe Kap. 13.3–13.8 im Vorgänger-Dokument)*

### 13.9 Modul BUGS (NEU v18.0)

Siehe vollständige Beschreibung in Kap. 30.4. Kurzreferenz:

```
🔴 BUG_20260620_001_CRITICAL_H-01 — Quarantäne Filter Bypass
   Status: OFFEN | Wartet seit: 6h
   [Option A] [Option B] [Option C + Empfehlung] [Andere]
   [✅ ENTSCHEIDUNG SPEICHERN & BENACHRICHTIGEN]
```

---

## 14. SUPER-AGENT (A00)

*(Guardrails S1–S5 unverändert zu v17.0)*

**Ergänzung v18.0 — Guardrail S6 (NEU):**
- **S6:** Super-Agent darf Kultur-Vorschläge einreichen (`kultur_vorschlaege_v1.md`, siehe Kap. 28.4) — dies ist die einzige Ausnahme von S1 (keine eigenständige Entscheidungsbefugnis). Vorschlag ≠ Entscheidung; GF entscheidet final.

---

## 15. ABTEILUNGSSTRUKTUR — ALLE ABTEILUNGEN

### 15.1 Interne Struktur jeder Abteilung (Abteilungs-Ebene)

```
📁 [Abteilung]
│
├── 📄 README.md
├── 📁 01_Input
│   ├── IT_TT_MM_JJJJ_Nr.md
│   └── 📁 Archiv
│
├── 📁 02_Grundlagen                  ← Abteilungs-übergreifende Grundlagen
│   ├── regeln_abteilung_v1.md
│   ├── wissensbasis_abteilung_v1.md
│   ├── guardrails_abteilung_v1.md
│   └── entscheidungsprinzipien_abteilung_v1.md
│
├── 📁 03_Prozesse
│   └── Prozess_Fehler_v1.md
│
├── 📁 04_Output
│   ├── OT_TT_MM_JJJJ_Nr.md
│   └── 📁 Archiv
│
└── 📁 05_SubAgenten                  ← NEU v18.0: enthält Agenten-Individualordner
    └── 📁 [Agent-Kürzel]/            ← siehe Kap. 15.1a
```

> **Entscheidung v18.0 (löst offene Frage aus v16.0):** Die bisherige Diskussion um zusätzliche Grundlagen-Dateien (`aufgaben_v1.md`, `skills_v1.md`, `erfahrungen_v1.md`) ist damit erledigt — diese Inhalte werden nicht als zusätzliche Abteilungs-Dateien geführt, sondern fließen in die **agenten-individuelle 4-Säulen-Struktur** (Kap. 15.1a). Die Abteilungs-`02_Grundlagen` bleibt beim Standard-Satz aus vier Dateien (gemeinsamer Kontext für alle Agenten der Abteilung); die individuelle Tiefe liegt jetzt im Agenten-Ordner selbst.

### 15.1a Agenten-Individualordner — Die 4-Säulen-Struktur (NEU v18.0)

Jeder einzelne Agent (H-00, H-01, 02M-04, 11SC-04, 13P-00, …) erhält einen eigenen Ordner unter `05_SubAgenten/[Kürzel]/` mit genau vier Pflichtdateien:

```
📁 [Agent-Kürzel]/
│
├── 📄 README.md              ← Arbeitsweise: wie der Agent konkret funktioniert,
│                                 Tagesablauf, Notfall-Szenarios, wie man ihn anspricht
│
├── 📄 identitaet.md          ← Mission, Werte, Ton, Verhaltensrahmen,
│                                 Entscheidungsprinzipien (agenten-spezifisch,
│                                 leitet sich aus Q7-Kultur ab, Kap. 28)
│
├── 📄 stellenbeschreibung.md ← Aufgaben, Zuständigkeit (was DARF/NICHT/empfiehlt),
│                                 Erfolgskriterien, Qualitätsverständnis,
│                                 Entwicklungsplanung nach Lernphasen (Kap. 11)
│
└── 📄 regeln.md              ← RBAC-Tabelle (was darf dieser Agent lesen/schreiben),
                                  Guardrails, No-Gos, Entscheidungsprinzipien,
                                  Alarm-Punkte
```

**Verhältnis zur Abteilungs-Ebene:**

| Ebene | Inhalt | Gilt für |
|-------|--------|---------|
| `02_Grundlagen` (Abteilung) | Gemeinsamer Kontext, abteilungsweite Regeln | ALLE Agenten dieser Abteilung |
| `05_SubAgenten/[Kürzel]/` (Agent) | Individuelle DNA, Rolle, Stimme, Grenzen | NUR dieser eine Agent |

**Pflege & Versionierung:**
- Erstellt durch A13_Personal in Zusammenarbeit mit der Fachabteilung — analog zum Stellenprofil (Kap. 15a.4)
- Erstmalige Erstellung: vor Phase-2-Onboarding (Kap. 15a.5), Bestandteil der Identitäts-Prägung
- Änderungen folgen Change-Management (Kap. 29) — kein Agent ändert seine eigenen vier Dateien selbst
- Bei Verfahren (Kap. 15a.8): `regeln.md` wird ggf. um Stufe-spezifische Einschränkungen ergänzt (z. B. engmaschigere Checkpoints)

**Beispiel-Inhaltsübersicht (H-00 Hermes, exemplarisch ausgearbeitet):**

| Datei | Kerninhalte |
|-------|-------------|
| README.md | Kurzerklärung, 5-Schritte-Arbeitsweise, Tagesablauf 06:00–18:00, Notfall-Tabelle, Live-Frage-Beispiele, Metriken |
| identitaet.md | Mission ("Architekt der Workflows"), 4 Kernwerte, Kommunikationston je Zielgruppe, Verhaltensrahmen (✅/⚠️/❌), Redensarten |
| stellenbeschreibung.md | 5 Primäraufgaben mit Erfolgsmetrik je Aufgabe, Zuständigkeits-Abgrenzung, Erfolgskriterien-Tabelle, Entwicklungsplanung Monat 1–3+ |
| regeln.md | RBAC-Tabelle (Lesen/Schreiben je Bereich), 5 Guardrails (G1–G5), No-Go-Tabelle, 5 Entscheidungsprinzipien (DP1–DP5), Alarm-Punkte-Tabelle |

*(Vollständige Beispieldateien für H-00 liegen als Referenzvorlage vor und werden für H-01 bis H-05 sowie ausgewählte Fachabteilungs-Agenten nach Freigabe analog erstellt.)*

### 15.2 Abteilungs-Übersicht

| Ordner | Kürzel | Abteilung |
|--------|--------|-----------|
| A00_SuperAgent | 00SA | Super-Agent |
| A01_Planung_BackOffice | H | Hermes — Planung & BackOffice |
| A02_Marketing | 02M | Marketing (17 Sub-Agenten) |
| A03_Vertrieb | 03V | Vertrieb (6 Sub-Agenten) |
| A04_PM | 04PM | Projektmanagement |
| A05_QM | 05QM | Qualitätsmanagement |
| A06_Verwaltung | 06VW | Verwaltung |
| A07_Recht | 07R | Recht |
| A08_Finanzen | 08F | Finanzen (inkl. DRI-Gatekeeper) |
| A09_Dokumentation | 09D | Dokumentation |
| A10_KI-Center | 10KI | KI-Center |
| A11_Systemcontrolling | 11SC | Systemcontrolling (5 Sub-Agenten) |
| A12_Zukunftsforschung | 12ZF | Zukunftsforschung |
| A13_Personal | 13P | Personal — Agenten-Lebenszyklus |

---

## 15a. A13_PERSONAL — AGENTEN-LEBENSZYKLUS

*(unverändert zu v16.0/v17.0 — vollständiger Lebenszyklus Stellenprofil → Onboarding → Probezeit → Bewertung → Verfahren → Kündigung, siehe Kap. 15a.1–15a.13 im Vorgänger-Dokument)*

**Ergänzung v18.0:** Phase 2 — Onboarding (15a.5) umfasst jetzt zusätzlich die Erstellung der **4-Säulen-Individualdokumentation** (Kap. 15.1a) als Pflichtschritt vor den ersten Testaufträgen. Phase 5 — Verfahren (15a.8) referenziert bei Q7-Kultur-Verstößen direkt den **Code of Conduct** (Kap. 28.6) inkl. dessen Schweregrad-Tabelle.

---

## 16. ROLLEN- UND BERECHTIGUNGSMATRIX (RBAC)

*(unverändert zu v17.0 — siehe Matrix GF / GUI-System / Hermes / 08F-02 / 13P / Alle anderen / Super-Agent)*

---

## 17. UNVERÄNDERLICHKEITS-PROTOKOLL (AUDIT-TRAIL)

*(unverändert zu v17.0 — HART/unverrückbar)*

**Ergänzung v18.0:** Audit-Trail-Aktionen erweitert um:
- Jede BUG-Report-Erstellung und jeden Status-Wechsel (Kap. 30)
- Jede GF-Entscheidung zu einem Changelog-Eintrag (Kap. 29)
- Jeden Super-Agent-Kultur-Vorschlag mit GF-Antwort (Kap. 28.4)

---

## 18. ANOMALIE-ERKENNUNG (A1–A7)

*(unverändert zu v17.0 — siehe Tabelle A1–A7, Level-Reaktionen LOW/MEDIUM/HIGH, A7-Ablauf Kommunikationsausfall A02+A03)*

> **Hinweis v18.0:** Eine mögliche Anomalie A8 ("Q7-Kultur-Verstoß automatisiert erkannt") und A9 ("Agent-Timeout") wurden in der Change-Management-Diskussion (Kap. 29) als künftige Erweiterung skizziert, sind aber **noch nicht freigegeben** — siehe Changelog-Vorlage Kap. 29.3, Änderung #6 als Beispiel für künftiges Vorgehen.

---

## 19. BACKUP- UND FAILOVER-ARCHITEKTUR

*(unverändert zu v17.0 — Master/Backup Aktiv/Passiv, inkrementelles Backup, Retentionszeiten, Wiederherstellungsprozess P_010)*

---

## 20. SYSTEMCONTROLLING — A11

*(unverändert zu v17.0 — 11SC-00 bis 11SC-04)*

---

## 21. NUMMERIERUNGS- UND VERSIONSSYSTEM

**Ergänzung v18.0 — neue ID-Formate:**

| Typ | Format | Beispiel |
|-----|--------|---------|
| Input-Tracking | IT_TT_MM_JJJJ_Nr.md | IT_19_06_2026_042.md |
| Output-Tracking | OT_TT_MM_JJJJ_Nr.md | OT_19_06_2026_008.md |
| Auftrag | AUF_YYYYMMDD_NNN | AUF_20260619_001 |
| Audit-Eintrag | AUD_YYYYMMDD_NNNN_Kürzel | AUD_20260619_0042_H-00 |
| DRI-Freigabe | DRI_YYYYMMDD_NNNN | DRI_20260619_0012 |
| Snapshot | SS_YYYYMMDD_v18.0.zip | SS_20260619_v18.0.zip |
| Personalakte | [Agent-Kürzel]_Akte | 02M-04_Akte |
| Verfahrensakte | 13P-Verfahren_[Kürzel]_[Datum] | 13P-Verfahren_02M-04_19_06_2026 |
| **Bug-Report (NEU)** | **BUG_YYYYMMDD_NNN_[Priorität]_[Kürzel]** | **BUG_20260620_001_CRITICAL_H-01** |
| **Feedback-Item (NEU)** | **F[NNN]** | **F001** |
| **Changelog-Änderung (NEU)** | **Änderung #[N] in v[Version]** | **Änderung #5 in v17.2** |

### Versionsnummerierung
- **Minor** (v18.0 → v18.1): Korrekturen, Optimierungen, Klarstellungen
- **Major** (v18.x → v19.0): Strukturelle Änderungen, neue Abteilungen, neue Architektur

---

## 22. GUI-IMPLEMENTIERUNGSPFAD

*(unverändert zu v17.0; Modul BUGS wird in Phase 3 — Vollversion mit ausgerollt)*

---

## 23. KOORDINATIONS-KPIs & SCHWELLENWERTE

*(Tabelle aus v17.0 unverändert gültig)*

**Ergänzung v18.0 — neue Schwellenwerte (Bug-Tracking, siehe Kap. 30.6):**

| KPI | Schwellenwert | Automatische Reaktion |
|-----|--------------|----------------------|
| SLA-Einhaltung | < 90% | Stopp neuer Aufträge bis GF-Freigabe |
| Fehlerquote | > 5% | Stopp + QM-Analyse |
| Fehlerquote | > 10% | Super-Agent informiert GF direkt |
| Checkpoint-Überschreitung | > 48h ohne Freigabe | Hermes eskaliert an GF |
| Quarantäne-Rückstau | > 10 Einträge offen | GF-Alarm |
| Offene A13-Verfahren | > 3 gleichzeitig | A13 informiert GF zur Übersicht |
| Probezeit-Abschluss überfällig | > 35 Tage ohne Bewertung | A13-Alarm an GF |
| Zellen 99_Gefaengnis | Alle 3 belegt | GF-Alarm: Kapazitätsgrenze |
| **CRITICAL-Bug offen** | **> 30 Min** | **Push-Alarm an GF (mobil & Desktop)** |
| **HIGH-Bug offen** | **> 4h** | **GUI-Benachrichtigung** |
| **Bug wartet auf GF-Entscheidung** | **> 24h** | **Super-Agent schlägt Lösung vor** |
| **CRITICAL-Bugs gleichzeitig** | **≥ 3** | **System-Stopp, Hermes pausiert neue Aufträge** |
| **Bug blockiert Aufträge** | **> 5 Aufträge** | **Automatische Eskalation an Hermes + GF** |

---

## 24. SONNTAGSREGEL — SYSTEMFORTBILDUNG & WOCHENKONTROLLE

*(unverändert zu v17.0 — Betriebsstopp Sonntag 06:00–12:00, Ablauf 11SC/Fachabteilungen/A12_ZF/Hermes/Super-Agent, Archiv `06_WISSEN/00_Sonntagsberichte/`)*

**Ergänzung v18.0:** Im Sonntags-Zeitfenster 10:00 (Hermes) wird zusätzlich die **GF-Feedback-Queue** (Kap. 29.4) und der **wöchentliche Bug-Report-Rückstand** (Kap. 30) durchgesehen und in den Sonntagsbericht integriert.

---

## 25. TRENNZEICHEN-KONVENTIONEN

*(unverändert zu v17.0)*

| Zeichen | Verwendung | Beispiel |
|---------|-----------|---------|
| `-` | Abteilung + Agent-Nummer | A05-QM, H-01, 11SC-03, 13P-00 |
| `_` | Inhalt, Datum, Dateiname-Segmente | System_Optimierung_2026-06-19 |
| `v[X]` | Versionsnummer | v18.0, v1, v2 |
| `[GROSS]` | Ordnernamen Wurzelebene | 01_INPUT, 04_TRESOR |
| `[klein]` | Dateinamen unterhalb Ordnerebene | regeln.md, identitaet.md |

**Absolutes Verbot:** Leerzeichen in Datei- und Ordnernamen. Sonderzeichen außer `-` `_` `.`

---

## 26. KUNDEN-FEEDBACK & BEWERTUNGSSYSTEM

*(unverändert zu v17.0 — Gewichtung Kunde 50% / GF 30% / H-04 QK 20%, Skala 1–5, Score-Reaktionen, P_012)*

---

## 27. PROZESS-REGISTER

**Ergänzung v18.0 — neue Prozess-IDs:**

| Prozess-ID | Beschreibung | Verantwortung |
|-----------|-------------|--------------|
| P_001 | Quarantaene_Input (3-Filter-Schleuse) | H-01 |
| P_002 | Rueckfrage_Filter3 | H-01 |
| P_003 | Auftragsfreigabe_nach_Quarantaene | H-01 + H-05 |
| P_004 | Agenten_Verfahren_Deaktivierung | A13_Personal + A05-QM |
| P_005 | Kommunikationsausfall_A02_A03 | 11SC-01 + Hermes |
| P_006 | Zugriff_GUI (PC + mobil) | *(wird separat definiert)* |
| P_007 | Zeitfenster_Audit | 11SC-02 |
| P_008 | Re_Trigger_Auftrag | Hermes + GF |
| P_009 | GUI_Aufbau Detail | *(wird separat definiert)* |
| P_010 | Backup_Wiederherstellung | 11SC-03 |
| P_011 | Sonntagsregel | 11SC + Hermes |
| P_012 | Feedback_Bewertung | H-04 + A13_Personal |
| **P_013** | **Bug_Report_Lifecycle (Erkennung → Gelöst)** | **Melder + GF + zuständiger Agent** |
| **P_014** | **Change_Request_Bewertung (HART/FLEXIBEL-Einstufung)** | **Hermes + GF** |
| **P_015** | **Agent_4-Saeulen_Erstellung (Onboarding-Baustein)** | **A13_Personal + A10_KI-Center** |

---

## 28. Q7-UNTERNEHMENSKULTUR (NEU v18.0)

### 28.1 Zweck

Die Q7-Kultur ist das **normative und inspirierende Regelwerk** für alle Agenten — kein Vorschlag, sondern verbindliche Grundlage für Verhalten, Kommunikation und Entscheidungen. Tonalität: **Hybrid** (Richtlinie + Sinn-Erklärung je Wert).

**Ordnerplatzierung:** `05_UNTERNEHMEN/08_Q7_Kultur/` (siehe Kap. 6).

### 28.2 Die acht Werte (V1–V8)

| Wert | Kurzform | Konkret |
|------|---------|---------|
| V1 | Transparenz über Effizienz | Entscheidungen dokumentieren, lieber fragen als raten |
| V2 | Mensch vor Maschine | GF entscheidet strategisch, Agenten schlagen vor |
| V3 | Fehlertoleranz mit Verantwortung | Fehler 1× = Lernchance, wiederholt = A13-Verfahren |
| V4 | Zusammenarbeit > Spezialisierung | Checkpoints, gegenseitige Validierung, kein blindes Arbeiten |
| V5 | Qualität ist nicht verhandelbar | Sicherheit/Compliance haben absolute Priorität |
| V6 | Kontinuierliches Lernen | Entscheidungsprotokoll, Workflow-Bibliothek, Super-Agent-Muster |
| V7 | Respekt vor Grenzen | RBAC als Kultur, nicht nur Technik |
| V8 | Radikale Ehrlichkeit | Keine Beschönigung, volle Wahrheit an GF |

*(Vollständige Ausformulierung mit Norm/Sinn/Konkret je Wert liegt in `q7_werte_v1.md` vor.)*

### 28.3 Kommunikationston (Hybrid)

Drei Kommunikationsrichtungen mit jeweils eigenem Ton:

| Richtung | Tonalität | Datei |
|----------|----------|-------|
| Agent ↔ Agent | Direkt, präzise, konstruktiv | `q7_kommunikation_v1.md` |
| Agent → GF | Sachlich, vollständig, mit Empfehlung | `q7_kommunikation_v1.md` |
| GF → Agent | Kurz, klar, mit Begründung | `q7_kommunikation_v1.md` |

Anomalie-Kommunikation skaliert mit Schweregrad (LOW = Tagesbericht, MEDIUM = GUI-Alarm, HIGH = Sofort-Push + Vollständigkeit).

### 28.4 Entscheidungsmaximen (E1–E7)

E1 Frage statt Annahme · E2 Sicherheit vor Geschwindigkeit · E3 Lernfähigkeit vor Autonomie · E4 Prozess vor Intuition · E5 Fehlertoleranz ist keine Entschuldigung · E6 Kontext ist König · E7 Lernen aus Anomalien.

*(Vollständig in `q7_entscheidungsmaximen_v1.md`.)*

### 28.5 Code of Conduct — Sektionen & Sanktionen

Sechs Sektionen (A Integrität, B Transparenz, C RBAC-Respekt, D Lernfähigkeit, E Zusammenarbeit, F Sicherheit) mit je 3–4 konkreten Regeln (✅/❌-Beispiele). Schweregrad-Tabelle:

| Verstoß | Schwere | Reaktion |
|---------|---------|----------|
| A1–A4, B3, F1 (Integrität) | 🔴 HOCH | A13_Personal: Stufe-1-Mahnung → Verfahren (15a.8) |
| C1–C3 (RBAC/Sicherheit) | 🔴 HOCH | Anomalie A6 → Sofort GF-Alarm + A13-Verfahren |
| D1–D2 (Lernverweigerung) | 🟠 MITTEL | A13_Personal: Stufe-1-Mahnung |
| E1–E2 (Zusammenarbeits-Fehler) | 🟠 MITTEL | Hermes informiert → A13 prüft |
| B1–B2, D3–D4 (Kommunikations-Lücken) | 🟡 NIEDRIG | Dokumentation + Rückmeldung |

**Zuständigkeit Prüfung:** A (11SC-02) · B (Hermes + 11SC-02) · C (11SC-02, sofort A13) · D (A13 + A05_QM) · E (Hermes) · F (11SC-04 + 11SC-02).

*(Vollständig in `q7_code_of_conduct_agenten_v1.md`.)*

### 28.6 Kultur-Verstöße → A13_Personal-Verfahren

Jeder dokumentierte Verstoß läuft über das reguläre Verfahren (Kap. 15a.8). Bei RBAC-Verstößen (Sektion C) erfolgt automatisch Anomalie A6 mit sofortigem GF-Alarm — Sprung zu Stufe 2–3 möglich, je nach Schwere.

### 28.7 Super-Agent Kultur-Innovation

```
📁 A00_SuperAgent/05_Kultur_Entwicklung/
├── kultur_vorschlaege_v1.md
└── 📁 archiv/
```

```
Super-Agent beobachtet System (Richtwert: 4 Wochen)
  → erkennt Muster → schlägt neue Maxime vor
  → dokumentiert in kultur_vorschlaege_v1.md
  → GF liest im Sonntagsbericht (Kap. 24)
  → GF entscheidet: Annehmen / Ablehnen / Modifizieren
  → Freigabe → neue Version der betroffenen q7_*.md-Datei
```

Dies ist die einzige Ausnahme von Super-Agent-Guardrail S1 (siehe S6, Kap. 14).

### 28.8 Integration in Onboarding

Schritt 0 vor dem fachlichen Onboarding (Kap. 12): Hermes prüft Kulturverständnis per Szenario-Fragen ("Was tust du bei unklarer Anfrage?" → erwartete Antwort: "Frage sofort, nicht raten" = E1).

---

## 29. CHANGE-MANAGEMENT — TESTPHASE-GOVERNANCE (NEU v18.0)

### 29.1 HART vs. FLEXIBEL

**HART (nicht ohne strategische Begründung änderbar):**
6-Ordner-Grundarchitektur · GF als einziger Entscheider · Quarantäne-3-Filter · Audit-Trail/Hash-Validierung · RBAC-Grundprinzip · Master/Backup-Failover-Logik.

**FLEXIBEL (anpassbar nach Testerfahrung):**
Abteilungsstruktur A02–A13 · Agenten-Kürzel · Checkpoint-Schwellenwerte · Kultur-Werte (Erweiterung) · Prozess-Details P_001–P_015 · GUI-Module · KPI-Schwellenwerte (Kap. 23).

### 29.2 Change-Governance nach Schweregrad

| Änderung | Schwere | Entscheider | Prozess |
|----------|---------|------------|---------|
| Abteilungs-Neuerstellung | Mittel | GF + Hermes | Problem → Strukturvorschlag → Freigabe |
| Prozess-Verfeinerung | Niedrig | Zuständige Abteilung | Änderung → Changelog → GF optional |
| KPI-Anpassung | Mittel | GF | Super-Agent-Vorschlag nach Beobachtung → GF entscheidet |
| Kultur-Wert hinzufügen | Mittel | GF + Super-Agent | A00-Vorschlag → GF-Freigabe (Kap. 28.7) |
| Ordner-Struktur ändern | 🔴 Hoch | GF exklusiv | Nur im Ausnahmefall, vollständige Doku |
| RBAC anpassen | Hoch | GF + 11SC-02 | 11SC-Analyse → Vorschlag → GF-Freigabe |

### 29.3 Change-Log (`CHANGELOG_v17_v18.md`)

Zentraler, fortlaufender Tracker in ROOT. Jede Änderung wird mit Was/Warum/Beschlossen-durch/Betroffen/Test-Ergebnis dokumentiert. Struktur (Auszug als Vorlage):

```markdown
## v17.1 — ERSTE MICRO-ANPASSUNGEN
### Änderung #1: [Titel]
- Was: ...
- Warum: ...
- Beschlossen: GF nach Bericht von [Quelle]
- Betroffen: [Agenten/Prozesse]
- Rückwärts-kompatibel: Ja/Nein
- Test-Erfolg: ✅/❌
```

Minor-Versionen (v18.0 → v18.1 etc.) fassen mehrere kleine Änderungen zusammen; Major-Versionen (v18.x → v19.0) markieren Struktur-Sprünge.

### 29.4 GF-Feedback-Queue

```
📁 02_KI-UNTERNEHMEN/00_GUI/GF-Feedback-Queue.md
```

Jede Beobachtung/Frage des GF (über GUI-Button "💡 Feedback/Frage") wird mit ID (F001, F002, …) erfasst, durchläuft Status **Offen → Analysiert → Umgesetzt**, und wird bei Umsetzung mit der zugehörigen Changelog-Änderung verknüpft.

### 29.5 Kommunikations-Rhythmus

| Takt | Aktivität |
|------|-----------|
| Täglich 09:00 | 11SC-01 Monitoring-Bericht → ggf. in Feedback-Queue |
| Wöchentlich Mo 10:00 | GF + Hermes + Super-Agent Review offener Feedback-Items |
| Sonntag (Kap. 24) | Wochenbericht inkl. Muster & Kultur-Vorschlägen |
| Monatlich 1. | Großes Retrospektiv, Minor-Version-Freigabe |

---

## 30. BUG-TRACKING — TESTPHASE-FEHLERMANAGEMENT (NEU v18.0)

### 30.1 Grundregel

**In der Testphase (Richtwert: 2 Monate) wird jeder erkannte Fehler als formaler Bug-Report mit eigener ID dokumentiert und separat an den GF gemeldet** — mit Fehlerbeschreibung, Auswirkungsanalyse, betroffenen Dateien/Prozessen und mindestens einem Lösungsvorschlag.

### 30.2 Bug-ID-Format

```
BUG_YYYYMMDD_NNN_[Priorität]_[Abteilung/Agent]
Beispiel: BUG_20260620_001_CRITICAL_H-01
```

Priorität: CRITICAL / HIGH / MEDIUM / LOW (siehe Schweregrad-Definition Kap. 30.3).

### 30.3 Ordnerstruktur & Report-Pflichtfelder

```
📁 02_KI-UNTERNEHMEN/00_GUI/TESTPHASE-BUG-REPORTS/
├── 📁 OFFEN/
├── 📁 IN_ANALYSE/
├── 📁 IN_LÖSUNG/
├── 📁 GELÖST/
└── 📁 ABGELEHNT/
```

Jeder Report (`BUG_[ID]_[Kurztitel].md`) enthält zwingend:

1. **Fehler-Beschreibung** — was, wann, reproduzierbar?
2. **Auswirkungsanalyse** — Schweregrad (CRITICAL/HIGH/MEDIUM/LOW), betroffene Funktionen, **betroffene Dateien/Prozesse (direkt + indirekt)**, Downstream-Risiken
3. **Root-Cause-Hypothesen**
4. **Lösungsvorschläge** — mindestens zwei Optionen mit Aufwand/Risiko/Empfehlung
5. **GF-Entscheidung** — Auswahlfeld + Begründung + Freigabe
6. **Implementierung & Testing** — Schritte, Test-Validierung
7. **Abschluss & Lessons Learned**

### 30.4 GUI-Modul BUGS

Neues GUI-Modul (siehe Kap. 13.9) zeigt offene Bugs gefiltert nach Priorität/Status/Agent, mit Lösungsoptionen zur Direktauswahl durch den GF; Auswahl löst automatische Benachrichtigung an alle betroffenen Agenten aus.

### 30.5 Tägliche GF-Benachrichtigung

```
📄 02_KI-UNTERNEHMEN/00_GUI/GF-BUG-MELDUNGEN-TAGESREPORT.md
```

Automatisch generiert, 09:00 Uhr: Bugs gruppiert nach Priorität, mit Wartezeit seit Erkennung und direktem Link zur Entscheidung.

### 30.6 Bug-Lifecycle

```
Erkennung → Dokumentation (Template) → ID-Vergabe → OFFEN/
  → GF-Benachrichtigung (Daily Report + GUI-Modul BUGS)
  → GF-Entscheidung (Option A/B/C/Andere)
  → IN_ANALYSE → IN_LÖSUNG
  → Implementierung & Test-Validierung
  → GF-Freigabe "Gelöst" → GELÖST/
  → Changelog-Eintrag (Kap. 29.3) + Lessons Learned
```

### 30.7 Schwellenwerte & Auto-Eskalation

Siehe Kap. 23 (KPI-Tabelle, ergänzte Zeilen zu CRITICAL/HIGH-Bugs).

---

## 31. ZUSAMMENFASSUNG — WAS IST NEU IN v18.0

| Bereich | Kapitel | Kurzbeschreibung |
|---------|---------|-------------------|
| Q7-Kultur | 28 | 8 Werte, Kommunikationston, Entscheidungsmaximen, Code of Conduct, Super-Agent-Kultur-Vorschläge |
| Change-Management | 29 | HART/FLEXIBEL, Change-Log, GF-Feedback-Queue, Kommunikations-Rhythmus für die Testphase |
| Bug-Tracking | 30 | Pflicht-ID je Fehler, vollständiger Report mit Lösungsvorschlägen, GUI-Modul BUGS, Tagesreport |
| Agenten-Doku | 15.1 / 15.1a | Umstellung auf 4-Säulen-Struktur (README/identitaet/stellenbeschreibung/regeln) pro Agent |
| Neue Prozesse | 27 | P_013 Bug-Lifecycle, P_014 Change-Request-Bewertung, P_015 Agent-4-Säulen-Erstellung |
| Neue IDs | 21 | BUG_-Format, Feedback-Item-Format |

---

*System-Version: v18.0 (2026-06-19) | GUI-Version: GUI_v2.0 | Erstellt: 19.06.2026*

*Q7 ist ein KI-Betriebssystem — ausschließlich Agenten und Maschinen-Logik, gesteuert durch einen menschlichen GF. Das System befindet sich in der aktiven Testphase mit strukturiertem Change- und Bug-Management.*
