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
| **Struktur** | Ordner, Agenten, Hierarchie, Zuordnungen | `Q7_Teil_C_System.md` |

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
- **04_TRESOR:** Kontaktdaten, Bankdaten → verschlüsselt, nur via DRI
- **05_UNTERNEHMEN:** Stammdaten, Analysen → betriebliches Wissen, intern

> **Vollständige Struktur aller Unterordner → siehe `Q7_Teil_C_System.md`**

---

## 4. HIERARCHIE — 5 EBENEN

```
👑 GF — GESCHÄFTSFÜHRER (Mensch — höchste Instanz)
   ↕
🖥️  DESKTOP-OBERFLÄCHE (GUI_v2.0) — einzige Schnittstelle zum GF
   ↕
🧠 Stab-AGENT (A00) — beobachtet, lernt, schlägt vor (keine Entscheidungsbefugnis)
   ↓
🛡️  A14_SICHERHEIT — trennt personenbezogene Daten (PII) vor Hermes-Zugriff
   ↓
🎯 HERMES-AGENT (A01) — koordiniert alle Aufträge, erstellt Workflows
   ↓
🤖 MASTER-AGENT (Primär) + BACKUP-AGENT (Sekundär)
   ↓
📁 A02–A14 FACHABTEILUNGEN — spezialisierte Arbeit
```

| Ebene | Wer | Funktion |
|-------|-----|----------|
| Kontrolle | GF (Mensch) | Entscheidet, freigibt, stoppt — kann jeden Agenten abschalten |
| Beobachtung | Stab-AGENT (A00) | Überwacht, lernt, schlägt vor |
| Datenschutz | A14_Sicherheit | Trennt PII von Sachdaten — eigenständig, unabhängig |
| Koordination | Hermes-Agent (A01) | Plant, verteilt, prüft — alle Aufträge laufen durch ihn |
| Ausführung | Fachabteilungen A02–A14 | Spezialisierte Arbeit pro Domäne |

**Kernregeln:**
- **GF** = einziger Mensch. Vollständige Kontrolle. Kann jeden Agenten abschalten.
- **GUI** = einzige Schnittstelle zwischen GF und System. Kein direkter Ordnerzugriff.
- **Stab-AGENT (A00)** = beobachtet alles, hat KEINE Entscheidungsbefugnis (Ausnahme: Kultur-Vorschläge S6).
- **A14** = eigenständig, unabhängig. Kein Agent kann A14-Prüfung umgehen oder beschleunigen. Hermes-Stopp ist technisch erzwungen (Gate-Mechanismus).
- **Hermes (A01)** = erhält Kunden-Input erst NACH A14-Freigabe.
- **Master-Agent** fällt aus → Backup-Agent springt automatisch ein.
- Beide ausgefallen → Systemcontrolling alarmiert GF → GF entscheidet manuell.

> **Alle Hierarchie-Regeln im Detail → siehe `Q7_Teil_B_System.md` Kap. 1**

---

## 5. HART vs. FLEXIBEL — CHANGE-PHILOSOPHIE

Nicht alles darf geändert werden. Das System unterscheidet:

| HART (unverrückbar) | FLEXIBEL (änderbar) |
|---------------------|---------------------|
| 7-Ordner-Grundarchitektur | Abteilungsstruktur A02–A14 |
| GF als einziger Entscheider | Agenten-Kürzel |
| Quarantäne-3-Filter | Checkpoint-Schwellenwerte |
| Audit-Trail/Hash-Validierung | Kultur-Werte (Erweiterung) |
| RBAC-Grundprinzip | Prozess-Details P_001–P_017 |
| Master/Backup-Failover-Logik | GUI-Module |
| A14-Gate-Mechanismus | KPI-Schwellenwerte |

> **Vollständiges Change-Management → siehe `Q7_Teil_B_System.md` Kap. 29**

---

## 6. ABTEILUNGEN — DIE 15 FACHBEREICHE

| Kürzel | Abteilung | Aufgabe |
|--------|-----------|---------|
| A00 | Stab-Agent | Beobachtung, Kultur-Vorschläge |
| A01 | Hermes — Planung & BackOffice | Koordination, Workflows, Qualitätskontrolle |
| A02 | Marketing | Markenführung, Content, Kundenkommunikation |
| A03 | Vertrieb | Akquise, Angebote, Kundenbeziehungen |
| A04 | Projektmanagement | Projektplanung, Ressourcen, Deadlines |
| A05 | Qualitätsmanagement | Qualitätssicherung, Standards, Prüfung |
| A06 | Verwaltung | Interne Organisation, Dokumentenverwaltung |
| A07 | Recht | Compliance, Verträge, Datenschutz |
| A08 | Finanzen | Rechnungsstellung, Budget, DRI-Gatekeeper |
| A09 | Dokumentation | Technische Dokumentation, Wissensmanagement |
| A10 | KI-Center | KI-Entwicklung, Modelle, Training |
| A11 | Systemcontrolling | Überwachung, Anomalien, Systemgesundheit |
| A12 | Zukunftsforschung | Trends, Innovation, Benchmarks |
| A13 | Personal | Agenten-Lebenszyklus (Onboarding bis Kündigung) |
| A14 | Sicherheit | PII-Trennung, Datenschutz, Zugriffsschutz |

> **Vollständige Agentenliste pro Abteilung → siehe `Q7_Teil_C_System.md`**

---

## 7. KERNPROZESS — KUNDENANALYSE

Es gibt Systemprozesse des Systems vom Eingang des Inhalts bis zur Umwandlung zum internen Auftrag.

Der Kundenprozess des Systems — von Kundenkontakt bis Freigabe:

Prozesse: Systemprozesse und Kundenprozesse

> **Vollständiges Prozess-Register mit allen Regeln → siehe `Q7_Teil_B_System.md` Kap. 27**

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

---

## 12. DATEI-ÜBERBLICK — WAS STEHT WO?

| Datei | Inhalt | Änderungshäufigkeit |
|-------|--------|---------------------|
| `Q7_Teil_A_System.md` | Diese Datei — Grundgedanke, grobe Architektur | Selten (nur bei Grundsatzentscheidungen) |
| `Q7_Teil_B_System.md` | Alle Regeln, Prozesse, Kultur, Change/Bug-Management | Mittel (bei neuen Prozessen, Kultur-Updates) |
| `Q7_Teil_C_System.md` | Ordnerstruktur, Agenten-Liste, Abteilungs-Zuordnung | Häufig (bei neuen Agenten, Ordner-Änderungen) |
| `Q7_Neuerungen_vXX_X.md` | Versionshistorie & Changelog | Jede Version |

---

*Q7 ist ein KI-Betriebssystem — ausschließlich Agenten und Maschinen-Logik, gesteuert durch einen menschlichen GF. Das System befindet sich in der aktiven Testphase.*
