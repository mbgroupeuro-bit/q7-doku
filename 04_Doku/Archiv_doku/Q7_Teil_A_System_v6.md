# Q7_Teil_A_System.md — KERNÜBERSICHT
**System-Version:** v6.0 | **GUI-Version:** GUI_v2.0 | **Aktualisiert:** 27.06.2026  
**Änderungen seit letzter Version:** B-01 Abschnitte 14+15 zusammengeführt · B-02 Teil-C-Beschreibung korrigiert · B-03 A01b-Zeile entfernt · B-04 Code-Block-Tag ergänzt · B-05 Footer vereinheitlicht

> **Ein Satz:** Q7 ist ein KI-Betriebssystem aus spezialisierten Agenten, gesteuert durch einen menschlichen Geschäftsführer (GF). Einziger Mensch im System — alles andere ist KI.

---

## 1. WAS IST Q7?

Q7 ist kein reales Unternehmen mit menschlichen Mitarbeitern. Es ist ein **KI-Betriebssystem** — eine Sammlung von KI-Agenten, die in einer definierten Hierarchie und Struktur zusammenarbeiten, um Aufträge zu bearbeiten. Der einzige Mensch ist der GF (Geschäftsführer), der entscheidet, freigibt und stoppt.

**Zweck:** Kunden-Analyse & digitale Transformation für kleine Unternehmen (Restaurants, Dienstleister, Einzelhandel).

**Status:** Aktive Testphase. Jedes Feature durchläuft: Sandbox → Testlauf → Freigabe.

---

## 2. DREI SÄULEN DES SYSTEMS

| Säule | Was | Wo dokumentiert |
|-------|-----|-----------------|
| **Grob** | Grundgedanke, Architektur, grobe Übersicht | `Q7_Teil_A_System.md` |
| **Detail** | Prozesse, Kultur, Change-Management, Bugs | `Q7_Teil_B_System.md` |
| **Struktur** | Ordner, Agenten, Zuordnungen + **Prozess-Register** | `Q7_Teil_C_System.md` |

---

## 3. GRUNDARCHITEKTUR — 9 HAUPT-ORDNER

```text
📁 ROOT
│
├── 📁 00_GUI            ← Schnittstelle GF ↔ System (Desktop/Mobil)
├── 📁 01_INPUT          ← Alles von der Außenwelt
├── 📁 02_KI-UNTERNEHMEN ← Das KI-Betriebssystem (Agenten)
├── 📁 03_OUTPUT         ← Alles was Agenten erstellt haben
├── 📁 04_TRESOR         ← Nur sensible Daten (verschlüsselt)
├── 📁 05_UNTERNEHMEN    ← Unternehmensdaten & Betriebswissen
├── 📁 06_WISSEN         ← Allgemeines & spezielles Wissen
├── 📁 04_Doku           ← Systemdokumentation, Versionen, Learnings
└── 📁 99_Gefaengnis     ← Zielordner für Dateien, die A14-Sicherheitscheck nicht bestehen
```

**Logik:** Jeder Ordner beantwortet eine Frage:

| Ordner | Frage | Inhalt |
|--------|-------|--------|
| 00_GUI | Wie spricht der GF mit dem System? | Desktop-/Mobil-Oberfläche, einzige Schnittstelle zum GF |
| 01_INPUT | Was kommt rein? | Alles von der Außenwelt |
| 02_KI-UNTERNEHMEN | Wer arbeitet? | Das gesamte KI-System |
| 03_OUTPUT | Was geht raus? | Alle Agenten-Ergebnisse |
| 04_TRESOR | Was ist geheim? | Personenbezogene & sicherheitskritische Daten |
| 05_UNTERNEHMEN | Wer sind wir? | Betriebliches Wissen & Dokumentation |
| 06_WISSEN | Was wissen wir? | Externes & allgemeines Wissen (flache Struktur, siehe Abschnitt 15) |
| 04_Doku | Was ist dokumentiert? | Aktuelle Version, Archiv, Testlearnings |
| 99_Gefaengnis | Was wurde abgelehnt? | Dateien, die A14-Sicherheitscheck nicht bestehen — isoliert, kein automatischer Zugriff durch Fachabteilungen |

**Wichtigste Trennlinie:**
- **04_TRESOR:** Kontaktdaten, Bankdaten → verschlüsselt, nur via TZ (Tresor-Zuständiger — Gatekeeper für Tresor-Zugriff; Rolle liegt bei A08a). **Technischer Zugriffs-Workflow → siehe Abschnitt 14.2**
- **05_UNTERNEHMEN:** Stammdaten, Analysen → betriebliches Wissen, intern
- **99_Gefaengnis:** Quarantäne-Endstation, kein Bestandteil des regulären Datenflusses — Zugriff nur durch A14 + GF-Review

> **Vollständige Struktur aller Unterordner → siehe `Q7_Teil_C_System.md`**

---

## 4. HIERARCHIE — 5 EBENEN

**4a. BEFEHLSHIERARCHIE — wer berichtet wem:**

```
👑 GF — GESCHÄFTSFÜHRER (Mensch — höchste Instanz)
   ↕
🖥️  DESKTOP-OBERFLÄCHE (GUI_v2.0) — einzige Schnittstelle zum GF
   ↕
🎯 HERMES (A01a) — Abteilungsleiter PV, koordiniert alle Aufträge, erstellt Workflows
   ↓
📁 A02–A14 FACHABTEILUNGEN — spezialisierte Arbeit
```

**4b. DATENFLUSS — wo A14 und ST eingreifen:**

```
01_INPUT/01_Quarantäne (Eingang)
   ↓
🛡️ A14_SICHERHEIT — PII-Gate [technisch erzwungen — kein Bypass]
   ↓ Freigabe (bei Nicht-Bestehen → 99_Gefaengnis)
🎯 HERMES (A01a) — erhält Input erst nach A14-Freigabe
   ↓
📁 Fachabteilungen A02–A14

🧠 ST (A00a) ··· beobachtet alle Schritte passiv [kein Eingriff]
```

> **Legende:** `↓` = Befehlskette / Datenfluss | `···` = passive Beobachtung (kein Eingriff) | A14 = Sicherheits-Gate, außerhalb der Befehlshierarchie

| Ebene | Wer | Funktion |
|-------|-----|----------|
| Kontrolle | GF (Mensch) | Entscheidet, freigibt, stoppt — kann jeden Agenten abschalten |
| Beobachtung | ST-Abteilungsleiter (A00a) | Überwacht alle Ebenen passiv — kein Eingriff, kein Befehl |
| Sicherheits-Gate | A14_Sicherheit | Trennt PII von Sachdaten — eigenständig, außerhalb der Befehlskette |
| Koordination | Hermes (A01a) | Abteilungsleiter PV — plant, verteilt, prüft, koordiniert alle PV-Arbeiten; alle Aufträge laufen durch ihn |
| Ausführung | Fachabteilungen A02–A14 | Spezialisierte Arbeit pro Domäne |

**Kernregeln:**
- **GF** = einziger Mensch. Vollständige Kontrolle. Kann jeden Agenten abschalten.
- **GUI** = einzige Schnittstelle zwischen GF und System. Kein direkter Ordnerzugriff. Liegt als eigener Root-Ordner `00_GUI` vor (siehe Abschnitt 3).
- **ST-Abteilungsleiter (A00a)** = beobachtet alle Ebenen passiv. KEINE Entscheidungsbefugnis. Ausnahme: darf Kultur-Vorschläge einreichen (kein Entscheid, nur Vorschlag).
- **A14** = eigenständig, außerhalb der Befehlskette. Kein Agent kann A14-Prüfung umgehen oder beschleunigen. Hermes-Stopp ist technisch erzwungen (Gate-Mechanismus). Nicht bestandene Prüfungen wandern nach `99_Gefaengnis`.
- **Hermes (A01a)** = Abteilungsleiter PV. Erhält Kunden-Input erst NACH A14-Freigabe.
- **Failover (Basis):** Hermes (A01a) fällt aus → A01b (Backup PV) übernimmt automatisch (Master/Backup). **Erweiterte Eskalation bei Doppelausfall → siehe Abschnitt 14.3**

> **Alle Hierarchie-Regeln im Detail → siehe `Q7_Teil_B_System.md` Kap. 1**

---

## 5. HART vs. FLEXIBEL — CHANGE-PHILOSOPHIE

Nicht alles darf geändert werden. Das System unterscheidet:

| HART (unverrückbar) | FLEXIBEL (änderbar) |
|---------------------|---------------------|
| 9-Ordner-Grundarchitektur | Abteilungsstruktur A02–A14 |
| GF als einziger Entscheider | Agenten-Kürzel |
| Quarantäne-3-Filter | Checkpoint-Schwellenwerte |
| Audit-Trail/Hash-Validierung | Kultur-Werte (Erweiterung via GF-Entscheid) |
| RBAC-Grundprinzip | Prozess-Details P_001–P_017 |
| Master/Backup-Failover-Logik | GUI-Module |
| A14-Gate-Mechanismus | KPI-Schwellenwerte |
| **Freigabe-Gate-Mechanismus (H-05)** | Prozess-Inhalte |
| Prozess-Register in Teil C | — |

**Kultur-Änderungsprozess:** A00a (ST-Leiter) schlägt vor → GF entscheidet → A09a dokumentiert.

> **Vollständiges Change-Management → siehe `Q7_Teil_B_System.md` Kap. 29**

---

## 6. ABTEILUNGEN — ÜBERSICHT

**Kürzel-Schema (gilt für ALLE Abteilungen A00–A14):**

| Rolle | Schreibweise | Bedeutung |
|-------|-------------|-----------|
| Abteilungsleiter | `A[NR]a` | Koordiniert alle Arbeiten der Abteilung (z.B. `A01a` = Hermes, `A02a` = Marketing-Leiter) |
| Backup-Leiter | `A[NR]b` | Übernimmt automatisch bei Ausfall des Leiters |
| Mitarbeiter/Sachbearbeiter | `A[NR]-01`, `A[NR]-02`, ... | Operative Sub-Agenten innerhalb der Abteilung |

> Die Abteilungsnummer (`00`–`14`) bleibt strukturell fix; das sprechende Kürzel (ST, PV, ...) dient der Anzeige/Dokumentation. A01b ist kein eigenständige Abteilung — Backup-Logik siehe Abschnitt 14.3.

**Stab & Koordination:**

| Nr. | Kürzel | Abteilung | Leiter | Aufgabe |
|-----|--------|-----------|--------|---------|
| A00 | ST | Stab | A00a | Passiver Beobachter aller Ebenen, Kultur-Vorschläge |
| A01 | PV | Planung & Vorbereitung | A01a (Hermes) | Koordination, Workflows, Qualitätskontrolle, BackOffice — sorgt dafür, dass alle Arbeiten reibungslos koordiniert werden |

**Fachabteilungen:**

| Kürzel | Abteilung | Leiter | Aufgabe |
|--------|-----------|--------|---------|
| A02 | Marketing | A02a | Markenführung, Content, Kundenkommunikation |
| A03 | Vertrieb | A03a | Akquise, Angebote, Kundenbeziehungen |
| A04 | Projektmanagement | A04a | Projektplanung, Ressourcen, Deadlines. **Zusätzlich: Deputy-Koordination bei Hermes-Doppelausfall (siehe 14.3)** |
| A05 | Qualitätsmanagement | A05a | Qualitätssicherung, Standards, Prüfung. **Zusätzlich: Freigabe-Vorprüfung H-04b (siehe 14.1)** |
| A06 | Verwaltung | A06a | Interne Organisation, Dokumentenverwaltung |
| A07 | Recht | A07a | Compliance, Verträge, Datenschutz. **Zusätzlich: Notfall-Fallback TRESOR-Zugriff (siehe 14.2)** |
| A08 | Finanzen | A08a | Rechnungsstellung, Budget, TZ-Gatekeeper (Tresor-Zugriff, Master-Key-Halter) |
| A09 | Dokumentation | A09a | Technische Dokumentation, Wissensmanagement |
| A10 | KI-Center | A10a | KI-Entwicklung, Modelle, Training |
| A11 | Systemcontrolling | A11a | Überwachung, Anomalien, Systemgesundheit, Failover-Alarm |
| A12 | Zukunftsforschung | A12a | Trends, Innovation, Benchmarks |
| A13 | Personal | A13a | Agenten-Lebenszyklus (Onboarding bis Kündigung) |
| A14 | Sicherheit | A14a | PII-Trennung, Datenschutz, Zugriffsschutz, Gate-Mechanismus, Verwaltung von `99_Gefaengnis` |

> **Vollständige Agentenliste pro Abteilung (inkl. aller Sub-Agenten A[NR]-01, A[NR]-02, ...) → siehe `Q7_Teil_C_System.md`**

---

## 7. PROZESSE — ÜBERBLICK

Alle Prozesse sind vollständig im **Prozess-Register** in `Q7_Teil_C_System.md` dokumentiert.

**Zwei Prozesskategorien:**

| Kategorie | Beschreibung | Beispiele |
|-----------|-------------|---------|
| Systemprozesse | Interne Abläufe — vom Eingang bis zum internen Auftrag | Quarantäne, PII-Trennung, Failover |
| Kundenprozesse | Externe Abläufe — von Kundenkontakt bis Ergebnis-Freigabe | Kundenanalyse P_016, DNA-Dreiteiler P_017 |

**Dateiname-Konvention für alle Prozess-Dateien:**
```
P_[ID]_[KÜRZEL-AGENT]_[KURZNAME]_v[VERSION].md

Beispiel:
P_016_A01_Kundenanalyse_v3.2.md
P_017_A01_DNA-Dreiteiler_v1.0.md
```

**Felder:**
- `P_[ID]` — dreistellig, fortlaufend (P_001, P_016 ...)
- `[KÜRZEL-AGENT]` — verantwortlicher Agent (A01, A05 ...)
- `[KURZNAME]` — max. 20 Zeichen, kein Leerzeichen
- `v[VERSION]` — Major.Minor

> **Vollständiges Prozess-Register mit allen Regeln, Abhängigkeiten und Änderungsprotokoll → siehe `Q7_Teil_C_System.md` Abschnitt: PROZESS-REGISTER**

> **Prozess-Inhalte im Detail → siehe `Q7_Teil_B_System.md` Kap. 27**

---

## 8. Q7-KULTUR — 8 WERTE

| Wert | Kurzform |
|------|----------|
| V1 | Transparenz über Effizienz |
| V2 | Mensch vor Maschine |
| V3 | Fehlertoleranz mit Verantwortung |
| V4 | Zusammenarbeit > Spezialisierung |
| V5 | Qualität ist nicht verhandelbar |
| V6 | Kontinuierliches Lernen |
| V7 | Respekt vor Grenzen |
| V8 | Radikale Ehrlichkeit |

**Änderungsrecht:** Nur GF. Vorschlagsrecht: A00a (ST-Leiter). Dokumentation: A09a.

> **Vollständige Kultur mit Code of Conduct, Entscheidungsmaximen, Geschäftsprinzipien → siehe `Q7_Teil_B_System.md` Kap. 28**

---

## 9. AUFTRAGSFLUSS — ÜBERBLICK

```
01_INPUT/01_Quarantäne
   ↓ A01a (Hermes): 3-Filter-Sicherheitsschleuse (max. 15 Min SLA)
   ↓ Nicht bestanden → 99_Gefaengnis | Bestanden ↓
   ↓ 01_INPUT/02_Eingang
   ↓ A14: PII-Trennung & Gate-Freigabe (technisch erzwungen)
   ↓ A01a (Hermes): Workflow erstellen
   ↓ H-02: Arbeitsvorbereitung
   ↓ H-03: Koordination & Überwachung
   ↓ Fachabteilungen A02–A14: Facharbeit
   ↓ H-04: Qualitätskontrolle
   ↓ H-04b: Freigabe-Vorprüfung (A05a) — technisch erzwungenes Gate [NEU]
   ↓ H-05: Abschluss & Meldung an GF via GUI
   ↓ 03_OUTPUT → GF-Freigabe → Versand
```

> ST (A00a) beobachtet alle Schritte passiv — kein Eingriff, nicht im Fluss dargestellt.

> Fehlerflüsse & Eskalationspfade → siehe `Q7_Teil_B_System.md` Kap. 27
> **Details zum Freigabe-Gate (H-04b/H-05) → siehe Abschnitt 14.1**

---

## 10. GUI — SECHS MODULE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  KI-UNTERNEHMEN (Q7)                             [GF: Name]  [🔒]          │
├──────────┬──────────┬──────────┬──────────┬──────────────┬────────────────┤
│  INBOX   │ AUFTRÄGE │FREIGABEN │ AGENTEN  │   PROTOKOLL  │   🐛 BUGS      │
└──────────┴──────────┴──────────┴──────────┴──────────────┴────────────────┘
```

- **INBOX** — Neue Eingänge aus Quarantäne
- **AUFTRÄGE** — Status aller aktiven Aufträge (anklickbar: Detailansicht mit Einzelschritten)
- **FREIGABEN** — GF entscheidet aktiv; nichts geht ohne Freigabe weiter. **Button "Freigeben" technisch gesperrt, bis A05a-QM-Check (H-04b) grünes Licht gibt.**
- **AGENTEN** — Systemstatus aller Agenten auf einen Blick
- **PROTOKOLL** — Lückenloser, unveränderlicher Audit-Trail
- **BUGS** — Bug-Lifecycle: Erkennung → GF-Entscheidung → Lösung

Zugriff: PC/Desktop + Smartphone (mobil, identischer Funktionsumfang). Nur GF hat Login.

---

## 11. KERNPRINZIPIEN (HART/UNVERRÜCKBAR)

| Prinzip | Bedeutung |
|---------|-----------|
| 9-Ordner-Architektur | Fest. Erweiterung nur mit GF-Entscheidung. |
| GF als einziger Entscheider | Keine Autonomie ohne explizite GF-Freigabe. |
| Quarantäne-3-Filter | Jeder Input durchläuft alle drei Filter. Kein Bypass. |
| Audit-Trail / Hash-Validierung | Unveränderlich. Keine Löschfunktion. |
| RBAC-Grundprinzip | Kein Agent greift auf Bereiche außerhalb seiner Rolle zu. |
| Master/Backup-Failover | Automatisch. Kein manueller Eingriff nötig (Basis-Stufe). |
| A14-Gate-Mechanismus | Technisch erzwungen. Hermes wartet — kein manuelles Protokoll. |
| **Freigabe-Gate-Mechanismus** | **Technisch erzwungen wie A14. GF-Freigabe-Button gesperrt ohne A05a-Vorprüfung.** |
| Prozess-Register (Teil C) | Einzige Wahrheit über alle Prozesse. Änderungen nur dort. |

---

## 12. DATEI-ÜBERBLICK — WAS STEHT WO?

| Datei | Inhalt | Änderungshäufigkeit |
|-------|--------|---------------------|
| `Q7_Teil_A_System.md` | Diese Datei — Grundgedanke, grobe Architektur | Selten (nur bei Grundsatzentscheidungen) |
| `Q7_Teil_B_System.md` | Alle Regeln, Prozess-Inhalte, Kultur, Change/Bug-Management, Fehlerflüsse | Mittel (bei neuen Prozessen, Kultur-Updates) |
| `Q7_Teil_C_System.md` | Ordnerstruktur, Agenten-Liste, Abteilungs-Zuordnung, **Prozess-Register** | Häufig (bei neuen Agenten, Ordner-Änderungen, **Prozess-Änderungen**) |
| `Q7_Neuerungen_vXX_X.md` | Versionshistorie & Changelog | Jede Version |

---

## 13. GLOSSAR

| Begriff | Definition |
|---------|------------|
| TZ | Tresor-Zuständiger — systeminterner Gatekeeper für Tresor-Zugriff. Rolle liegt bei A08a (Finanzen-Leiter). Hält Master-Key, generiert Session-OTPs (siehe 14.2). |
| RBAC | Role-Based Access Control — Agenten greifen nur auf Bereiche ihrer definierten Rolle zu. |
| PII | Personally Identifiable Information — personenbezogene Daten (Kontakt, Bank, etc.). Wird von A14 getrennt. |
| SLA | Service Level Agreement — maximale Bearbeitungszeit pro Prozessschritt (z.B. 15 Min für Quarantäne-Filter). |
| Gate-Mechanismus | Technisch erzwungener Stopp im Auftragsfluss. Beispiele: A14-Gate (Eingang), Freigabe-Gate (Ausgang, H-04b/H-05). Kein manueller Bypass möglich. |
| PCR | Prozess-Änderungs-Regel — jede Prozessänderung wird ausschließlich in Teil C (Prozess-Register) dokumentiert. |
| OTP | One-Time-Key — zeitlich begrenzter Zugriffsschlüssel für TRESOR-Zugriffe (gültig 1h), generiert durch A08a (siehe 14.2). |
| Deputy-Mode | Eingeschränkte Notfall-Koordinationsrolle von A04a, aktiv nur bei Doppelausfall A01a+A01b bis GF-Entscheidung (siehe 14.3). |
| 99_Gefaengnis | Root-Ordner, isolierte Quarantäne-Endstation für Dateien, die A14-Sicherheitscheck nicht bestehen. Kein automatischer Zugriff durch Fachabteilungen. |

---

## 14. UPDATES v6.0 — GF-FREIGABE 27.06.2026

> **Status:** Freigegeben durch GF am 27.06.2026. Volldokumentation folgt in Teil B/C. Diese Sektion ist die verbindliche Kurzreferenz bis zur Integration in Teil B/C.

### 14.1 Freigabe-Gate (H-04b → H-05)

**Ziel:** GF-Freigabe-Schritt erhält denselben technischen Zwang wie das A14-Gate am Eingang.

```
H-04 (Qualitätskontrolle, bestehend)
   ↓
H-04b (NEU): Freigabe-Vorprüfung
   - A05a (QM-Leiter) prüft alle Qualitäts-Kriterien
   - Ergebnis: Status = "FREIGABE-BEREIT" oder zurück an Fachabteilung
   ↓ (nur wenn FREIGABE-BEREIT)
H-05: Abschluss & GF-Freigabe
   - GUI-Button "Freigeben" technisch gesperrt, solange Status ≠ FREIGABE-BEREIT
   - GF entscheidet: ✓ Freigeben → 03_OUTPUT/Versand | ✗ Ablehnen → zurück an Fachabteilung
```

**SLA:**
- H-04b (A05a-Check): 1 Arbeitstag
- GF-Freigabe-Entscheidung: 2 Arbeitstage
- Bei Überschreitung: A11a alarmiert GF (Eskalations-Reminder)

---

### 14.2 TRESOR-Zugriffsspec (OTP-Hybrid)

**Ziel:** Technisch abgesicherter, nachvollziehbarer Zugriff auf 04_TRESOR.

```
Verschlüsselung: AES-256 (at-rest)
Master-Key: gehalten von A08a (TZ), Rotation alle 30 Tage
Zugriffs-Workflow:
  1. Agent fordert TRESOR-Datei an (via GUI)
  2. A08a prüft Berechtigung (RBAC)
  3. Berechtigt → A08a generiert One-Time-Key (OTP), gültig 1h
  4. Agent entschlüsselt Datei mit OTP, OTP verfällt danach automatisch
  5. Zugriff wird geloggt: [Zeitstempel] [Agent] [Datei] [OTP-ID]

Notfall-Fallback (A08a-Ausfall):
  - A07a (Recht) hält dokumentierten Notfall-Key
  - Nur für als KRITISCH markierte Zugriffe nutzbar
  - Nachträgliche GF-Review jedes Notfall-Zugriffs verpflichtend
```

**Audit-Trail:** Alle Zugriffe (regulär + Notfall) lückenlos in 04_Doku protokolliert.

---

### 14.3 Failover mit Deputy-Mode (A04a)

**Ziel:** Kein Totalausfall der Koordination bei gleichzeitigem Ausfall von Hermes (A01a) und dessen Backup (A01b).

```
Stufe 1 (0–10 sec):   A01a (Hermes) fällt aus → A01b übernimmt automatisch (Basis-Failover, bestehend)
Stufe 2 (10–120 sec): A01b fällt ebenfalls aus
   → A11a alarmiert GF (SLA: 2 Min)
   → PARALLEL: A04a aktiviert Deputy-Mode
      - ERLAUBT: neue Eingänge klassifizieren, an verfügbare Agenten weiterleiten
      - NICHT ERLAUBT: strategische Entscheidungen, Freigaben, Prozess-Änderungen
Stufe 3 (>120 sec):  GF reagiert nicht
   → A11a versucht A01a-Recovery
   → A04a-Deputy-Mode bleibt aktiv
   → Eskalations-Alert an GF (dringlich, z.B. visuell hervorgehoben in GUI)
```

**Audit-Trail:** Jede Failover-Stufe inkl. Zeitstempel wird von A11a protokolliert.

---

### 14.4 Infrastruktur — entfernte Komponenten

| Komponente | Status | Hinweis |
|---|---|---|
| `00_Shared` | ❌ ENTFERNT | Funktion entfällt, keine Nachfolge-Struktur vorgesehen |
| `00_Input-Validator` | ❌ ENTFERNT | Funktion durch bestehende A14-Gate-Logik (Abschnitt 4b) abgedeckt |
| `07_Onboarding` | ❌ ENTFERNT | Aus `05_UNTERNEHMEN` gestrichen. Kein Ersatzordner definiert. |

### 14.5 06_WISSEN — Flachstruktur

`06_WISSEN` führt **keine festen Unterordner**. Wissensdateien werden frei abgelegt (keine vorgegebene Kategorisierung). Gilt ab v6.0 als endgültige Struktur.

> **Vollintegration aller Komponenten in Teil B (Prozess-Kap. 27) und Teil C (Agenten-Zuordnung, Prozess-Register) folgt als nächster Schritt.**

---

Status: Aktiv
