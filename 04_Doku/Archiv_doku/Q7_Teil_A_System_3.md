# Q7_Teil_A_System.md — KERNÜBERSICHT
**System-Version:** v23.2 | **GUI-Version:** GUI_v2.0 | **Aktualisiert:** 26.06.2026

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
| **Struktur** | Ordner, Agenten, Hierarchie, Zuordnungen + **Prozess-Register** | `Q7_Teil_C_System.md` |

---

## 3. GRUNDARCHITEKTUR — 7 HAUPT-ORDNER

```
📁 ROOT
│
├── 📁 01_INPUT          ← Alles von der Außenwelt
├── 📁 02_KI-UNTERNEHMEN ← Das KI-Betriebssystem (Agenten)
├── 📁 03_OUTPUT         ← Alles was Agenten erstellt haben
├── 📁 04_TRESOR         ← Nur sensible Daten (verschlüsselt)
├── 📁 05_UNTERNEHMEN    ← Unternehmensdaten & Betriebswissen
├── 📁 06_WISSEN         ← Allgemeines & spezielles Wissen
└── 📁 04_Doku           ← Systemdokumentation, Versionen, Learnings
```

**Logik:** Jeder Ordner beantwortet eine Frage:

| Ordner | Frage | Inhalt |
|--------|-------|--------|
| 01_INPUT | Was kommt rein? | Alles von der Außenwelt |
| 02_KI-UNTERNEHMEN | Wer arbeitet? | Das gesamte KI-System |
| 03_OUTPUT | Was geht raus? | Alle Agenten-Ergebnisse |
| 04_TRESOR | Was ist geheim? | Personenbezogene & sicherheitskritische Daten |
| 05_UNTERNEHMEN | Wer sind wir? | Betriebliches Wissen & Dokumentation |
| 06_WISSEN | Was wissen wir? | Externes & allgemeines Wissen |
| 04_Doku | Was ist dokumentiert? | Aktuelle Version, Archiv, Testlearnings |

**Wichtigste Trennlinie:**
- **04_TRESOR:** Kontaktdaten, Bankdaten → verschlüsselt, nur via TZ (Tresor-Zuständiger — Gatekeeper für Tresor-Zugriff; Rolle liegt bei A08)
- **05_UNTERNEHMEN:** Stammdaten, Analysen → betriebliches Wissen, intern

> **Vollständige Struktur aller Unterordner → siehe `Q7_Teil_C_System.md`**

---

## 4. HIERARCHIE — 5 EBENEN

**4a. BEFEHLSHIERARCHIE — wer berichtet wem:**

```
👑 GF — GESCHÄFTSFÜHRER (Mensch — höchste Instanz)
   ↕
🖥️  DESKTOP-OBERFLÄCHE (GUI_v2.0) — einzige Schnittstelle zum GF
   ↕
🎯 HERMES-AGENT (A01) — koordiniert alle Aufträge, erstellt Workflows
   ↓
📁 A02–A14 FACHABTEILUNGEN — spezialisierte Arbeit
```

**4b. DATENFLUSS — wo A14 und A00 eingreifen:**

```
01_INPUT/01_Quarantäne (Eingang)
   ↓
🛡️ A14_SICHERHEIT — PII-Gate [technisch erzwungen — kein Bypass]
   ↓ Freigabe
🎯 HERMES-AGENT (A01) — erhält Input erst nach A14-Freigabe
   ↓
📁 Fachabteilungen A02–A14

🧠 A00 (Stab-Agent) ··· beobachtet alle Schritte passiv [kein Eingriff]
```

> **Legende:** `↓` = Befehlskette / Datenfluss | `···` = passive Beobachtung (kein Eingriff) | A14 = Sicherheits-Gate, außerhalb der Befehlshierarchie

| Ebene | Wer | Funktion |
|-------|-----|----------|
| Kontrolle | GF (Mensch) | Entscheidet, freigibt, stoppt — kann jeden Agenten abschalten |
| Beobachtung | Stab-AGENT (A00) | Überwacht alle Ebenen passiv — kein Eingriff, kein Befehl |
| Sicherheits-Gate | A14_Sicherheit | Trennt PII von Sachdaten — eigenständig, außerhalb der Befehlskette |
| Koordination | Hermes-Agent (A01) | Plant, verteilt, prüft — alle Aufträge laufen durch ihn |
| Ausführung | Fachabteilungen A02–A14 | Spezialisierte Arbeit pro Domäne |

**Kernregeln:**
- **GF** = einziger Mensch. Vollständige Kontrolle. Kann jeden Agenten abschalten.
- **GUI** = einzige Schnittstelle zwischen GF und System. Kein direkter Ordnerzugriff.
- **Stab-AGENT (A00)** = beobachtet alle Ebenen passiv. KEINE Entscheidungsbefugnis. Ausnahme: darf Kultur-Vorschläge einreichen (kein Entscheid, nur Vorschlag).
- **A14** = eigenständig, außerhalb der Befehlskette. Kein Agent kann A14-Prüfung umgehen oder beschleunigen. Hermes-Stopp ist technisch erzwungen (Gate-Mechanismus).
- **Hermes (A01)** = erhält Kunden-Input erst NACH A14-Freigabe.
- **Failover:** Hermes fällt aus → A11 (Systemcontrolling) alarmiert GF → GF entscheidet manuell.

> **Alle Hierarchie-Regeln im Detail → siehe `Q7_Teil_B_System.md` Kap. 1**

---

## 5. HART vs. FLEXIBEL — CHANGE-PHILOSOPHIE

Nicht alles darf geändert werden. Das System unterscheidet:

| HART (unverrückbar) | FLEXIBEL (änderbar) |
|---------------------|---------------------|
| 7-Ordner-Grundarchitektur | Abteilungsstruktur A02–A14 |
| GF als einziger Entscheider | Agenten-Kürzel |
| Quarantäne-3-Filter | Checkpoint-Schwellenwerte |
| Audit-Trail/Hash-Validierung | Kultur-Werte (Erweiterung via GF-Entscheid) |
| RBAC-Grundprinzip | Prozess-Details P_001–P_017 |
| Master/Backup-Failover-Logik | GUI-Module |
| A14-Gate-Mechanismus | KPI-Schwellenwerte |
| Prozess-Register in Teil C | Prozess-Inhalte |

**Kultur-Änderungsprozess:** A00 schlägt vor → GF entscheidet → A09 dokumentiert.

> **Vollständiges Change-Management → siehe `Q7_Teil_B_System.md` Kap. 29**

---

## 6. ABTEILUNGEN — ÜBERSICHT

**Stab & Koordination:**

| Kürzel | Abteilung | Aufgabe |
|--------|-----------|---------|
| A00 | Stab-Agent | Passiver Beobachter aller Ebenen, Kultur-Vorschläge |
| A01 | Hermes — Planung & BackOffice | Koordination, Workflows, Qualitätskontrolle |
| A01a | Master-Agent | Operative Ausführungs-Koordination (Primär) |
| A01b | Backup-Agent | Operative Ausführungs-Koordination (Sekundär — springt bei A01a-Ausfall automatisch ein) |

**Fachabteilungen:**

| Kürzel | Abteilung | Aufgabe |
|--------|-----------|---------|
| A02 | Marketing | Markenführung, Content, Kundenkommunikation |
| A03 | Vertrieb | Akquise, Angebote, Kundenbeziehungen |
| A04 | Projektmanagement | Projektplanung, Ressourcen, Deadlines |
| A05 | Qualitätsmanagement | Qualitätssicherung, Standards, Prüfung |
| A06 | Verwaltung | Interne Organisation, Dokumentenverwaltung |
| A07 | Recht | Compliance, Verträge, Datenschutz |
| A08 | Finanzen | Rechnungsstellung, Budget, TZ-Gatekeeper (Tresor-Zugriff) |
| A09 | Dokumentation | Technische Dokumentation, Wissensmanagement |
| A10 | KI-Center | KI-Entwicklung, Modelle, Training |
| A11 | Systemcontrolling | Überwachung, Anomalien, Systemgesundheit, Failover-Alarm |
| A12 | Zukunftsforschung | Trends, Innovation, Benchmarks |
| A13 | Personal | Agenten-Lebenszyklus (Onboarding bis Kündigung) |
| A14 | Sicherheit | PII-Trennung, Datenschutz, Zugriffsschutz, Gate-Mechanismus |

> **Vollständige Agentenliste pro Abteilung → siehe `Q7_Teil_C_System.md`**

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

**Änderungsrecht:** Nur GF. Vorschlagsrecht: A00. Dokumentation: A09.

> **Vollständige Kultur mit Code of Conduct, Entscheidungsmaximen, Geschäftsprinzipien → siehe `Q7_Teil_B_System.md` Kap. 28**

---

## 9. AUFTRAGSFLUSS — ÜBERBLICK

```
01_INPUT/01_Quarantäne
   ↓ A01 (Hermes): 3-Filter-Sicherheitsschleuse (max. 15 Min SLA)
   ↓ 01_INPUT/02_Eingang
   ↓ A14: PII-Trennung & Gate-Freigabe (technisch erzwungen)
   ↓ A01 (Hermes): Workflow erstellen
   ↓ H-02: Arbeitsvorbereitung
   ↓ H-03: Koordination & Überwachung
   ↓ Fachabteilungen A02–A14: Facharbeit
   ↓ H-04: Qualitätskontrolle
   ↓ H-05: Abschluss & Meldung an GF via GUI
   ↓ 03_OUTPUT → GF-Freigabe → Versand
```

> A00 beobachtet alle Schritte passiv — kein Eingriff, nicht im Fluss dargestellt.
> Fehlerflüsse & Eskalationspfade → siehe `Q7_Teil_B_System.md` Kap. 27

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
- **FREIGABEN** — GF entscheidet aktiv; nichts geht ohne Freigabe weiter
- **AGENTEN** — Systemstatus aller Agenten auf einen Blick
- **PROTOKOLL** — Lückenloser, unveränderlicher Audit-Trail
- **BUGS** — Bug-Lifecycle: Erkennung → GF-Entscheidung → Lösung

Zugriff: PC/Desktop + Smartphone (mobil, identischer Funktionsumfang). Nur GF hat Login.

---

## 11. KERNPRINZIPIEN (HART/UNVERRÜCKBAR)

| Prinzip | Bedeutung |
|---------|-----------|
| 7-Ordner-Architektur | Fest. Erweiterung nur mit GF-Entscheidung. |
| GF als einziger Entscheider | Keine Autonomie ohne explizite GF-Freigabe. |
| Quarantäne-3-Filter | Jeder Input durchläuft alle drei Filter. Kein Bypass. |
| Audit-Trail / Hash-Validierung | Unveränderlich. Keine Löschfunktion. |
| RBAC-Grundprinzip | Kein Agent greift auf Bereiche außerhalb seiner Rolle zu. |
| Master/Backup-Failover | Automatisch. Kein manueller Eingriff nötig. |
| A14-Gate-Mechanismus | Technisch erzwungen. Hermes wartet — kein manuelles Protokoll. |
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
| TZ | Tresor-Zuständiger — systeminterner Gatekeeper für Tresor-Zugriff. Rolle liegt bei A08 (Finanzen). |
| RBAC | Role-Based Access Control — Agenten greifen nur auf Bereiche ihrer definierten Rolle zu. |
| PII | Personally Identifiable Information — personenbezogene Daten (Kontakt, Bank, etc.). Wird von A14 getrennt. |
| SLA | Service Level Agreement — maximale Bearbeitungszeit pro Prozessschritt (z.B. 15 Min für Quarantäne-Filter). |
| Gate-Mechanismus | Technisch erzwungener Stopp im Auftragsfluss. Hermes wartet auf A14-Freigabe — kein manueller Bypass möglich. |
| PCR | Prozess-Änderungs-Regel — jede Prozessänderung wird ausschließlich in Teil C (Prozess-Register) dokumentiert. |

---

*Q7 ist ein KI-Betriebssystem — ausschließlich Agenten und Maschinen-Logik, gesteuert durch einen menschlichen GF. Das System befindet sich in der aktiven Testphase.*
