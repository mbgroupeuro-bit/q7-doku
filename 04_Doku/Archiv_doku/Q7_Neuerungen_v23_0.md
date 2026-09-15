# Q7 — VERSIONSHISTORIE & NEUERUNGEN
**Letzte Aktualisierung:** 25.06.2026 | **Aktueller Stand:** v23.0

> Diese Datei dokumentiert alle Versionen und deren Neuerungen.
> Die Systemdokumentation selbst bleibt dadurch dauerhaft sauber.

---

## ÄNDERUNGSHISTORIE

| Version | Datum | Beschreibung |
|---------|-------|-------------|
| v12.0 | 29.05.2026 | Integration Backup-, Failover- und RBAC-Architektur |
| v13.0 | 16.06.2026 | Einführung DRI. Behebung K4-Sicherheitswiderspruch |
| v13.1 | 16.06.2026 | Hierarchie-Korrektur, SuperAgent, RBAC-Update, Systemcontrolling erweitert |
| v13.2 | 16.06.2026 | Unveränderlichkeits-Protokoll (Audit-Trail), Hash-Validierung |
| v14.0 | 16.06.2026 | MAJOR: Desktop-GUI als zentrale Schnittstelle, 4 Module, Anomalie-Erkennung |
| v15.0 | 16.06.2026 | MAJOR: Neue 6-Ordner-Grundarchitektur. Hermes-Agent. Quarantäne-Logik. Checkpoint-System. Onboarding-Phase 0. GUI auf 5 Module. |
| v16.0 | 19.06.2026 | MAJOR: Quarantäne zur vollständigen Sicherheitsschleuse (3 Filter). A13_Personal — Agenten-Lebenszyklus. Hierarchie auf A02–A13. |
| v17.0 | 19.06.2026 | MAJOR: 99_Gefaengnis (3 Zellen). Mobiler GUI-Zugriff. Auftragsdetailansicht. Zeitfenster-Audit. Anomalie A7. Inkrementelles Backup. Sonntagsregel. Trennzeichen-Konventionen. Kunden-Feedback. Prozess-Register. |
| v18.0 | 19.06.2026 | MAJOR: Q7-Unternehmenskultur (8 Werte, Kommunikationston, Code of Conduct). Change-Management (HART/FLEXIBEL, Change-Log, GF-Feedback-Queue). Bug-Tracking-System. Agenten-Individualdokumentation 4-Säulen-Struktur. |
| v19.0 | 19.06.2026 | MAJOR: Kunden-Analyse & Transformationsprozess P_016 (11 Unterprozesse). Ordner 09_Kunden. Tresor K4_Personen. |
| v20.0 | 20.06.2026 | MAJOR: A14_Sicherheit als eigenständige Abteilung. PII-Trennung vor Hermes-Zugriff. Hierarchie 5 Ebenen. |
| v21.0 | 20.06.2026 | MAJOR: Quarantäne-Whitelist um .md ergänzt. Q7-Geschäftsprinzipien (Qualitätsschwelle, Mitwirkungspflicht, Phasen-Logik). P_016.8 Scope A/B/C. A03 DP2 konkretisiert. |
| v22.0 | 22.06.2026 | MAJOR: P_017 Matrix1. DNA-Dreiteiler (dna-analyse / dna-auswertung-intern / dna-endergebnis). CI-vor-Digital-Regel systemweit. |
| v23.0 | 25.06.2026 | MAJOR: Prozess-Register erweitert (P_016.1b, P_016.2.3, P_016.3.1–3.5, P_016.8a). K1–K6 dokumentiert. Max-Score korrigiert (1.285). A14-Gate-Mechanismus technisch verankert. Score-Konvertierungsregel. Scope-Roadmap-Längen. TikTok-Optionalität. Sinneseindrücke-Mapping. P_016.11 Eskalationsregel. Kap. 35 Offene Pendenzen. |

---

## WAS IST NEU IN v18.0

| Bereich | Kapitel | Kurzbeschreibung |
|---------|---------|-----------------|
| Q7-Kultur | 28 | 8 Werte, Kommunikationston, Entscheidungsmaximen, Code of Conduct, Super-Agent-Kultur-Vorschläge |
| Change-Management | 29 | HART/FLEXIBEL, Change-Log, GF-Feedback-Queue, Kommunikations-Rhythmus |
| Bug-Tracking | 30 | Pflicht-ID je Fehler, vollständiger Report, GUI-Modul BUGS, Tagesreport |
| Agenten-Doku | 15.1 / 15.1a | 4-Säulen-Struktur (README / identitaet / stellenbeschreibung / regeln) pro Agent |
| Neue Prozesse | 27 | P_013 Bug-Lifecycle, P_014 Change-Request-Bewertung, P_015 Agent-4-Säulen-Erstellung |
| Neue IDs | 21 | BUG_-Format, Feedback-Item-Format |

---

## WAS IST NEU IN v19.0

| Bereich | Kapitel | Kurzbeschreibung |
|---------|---------|-----------------|
| Kunden-Prozess | 27 | P_016 mit 11 Unterprozessen (P_016.1–P_016.11) |
| Kunden-Ordner | 6 | `05_UNTERNEHMEN/09_Kunden` mit vollständiger KD_[Nr]-Struktur |
| Tresor-Erweiterung | 5 | `04_TRESOR/K4_Personen/KD_[Nr]` für personenbezogene Kundendaten |
| Kundennummer | 21 | Format KD_[3-stellig]_[Kurzname] eingeführt |
| Mystery Shopping | P_016.2 | Physischer Test-Prozess mit Bewertungsbogen & Konsolidierung |
| Digital Audit | P_016.3 | Vollständige digitale Bestandsaufnahme |
| SWOT | P_016.4 | Stärken/Schwächen-Analyse inkl. Strategie-Ableitungen |
| Benchmarks | P_016.5 | Branchen-KPIs mit Vergleichstabelle |
| IST-Zustand | P_016.6 | Gap-Analyse & IST-Gesamtbericht |
| Kundengespräch | P_016.7 | GF-Gesprächsleitfaden + Protokoll-Template |
| Bedarfsanalyse | P_016.8 | Delta Kundenwunsch vs. fachliche Notwendigkeit + Pflichtbausteine |
| SOLL-Zustand | P_016.9 | Transformations-Roadmap 3 Phasen & Meilensteine |
| Deliverables | P_016.10 | Präsentation (Slides) + PDF-Report |
| Umsetzungsstart | P_016.11 | Kunden-Freigabe + Start regulärer Q7-Auftrag |

**Kernprinzip v19.0:**
Q7 berät ehrlich. Markenidentität ist keine Option — sie ist strategische Voraussetzung.

---

## WAS IST NEU IN v20.0

| Bereich | Kapitel | Kurzbeschreibung |
|---------|---------|-----------------|
| A14_Sicherheit | 1 / 6a / 8 / 15.2 | Neue eigenständige Abteilung — PII-Trennung vor Hermes-Zugriff |
| Hierarchie | 1 | 5. Ebene Datenschutz eingeführt |
| Systemstruktur | 8 | A14 in Ordnerstruktur |
| Abteilungs-Übersicht | 15.2 | A14 mit Kürzel 14S |

---

## WAS IST NEU IN v21.0

| Bereich | Kapitel | Kurzbeschreibung |
|---------|---------|-----------------|
| Quarantäne-Whitelist | 3 | .md Dateiformat ergänzt (BUG_009 behoben) |
| Q7-Geschäftsprinzipien | 28.9 | Qualitätsschwelle, Mitwirkungspflicht, Phasen-Logik A/B formalisiert |
| P_016.8 Scope | P_016.8 | Scope-Festlegung A/B/C vor Bedarfsanalyse |
| A03 DP2 | A03 v3.0 | Qualitätsschwelle + Mitwirkungspflicht + Phasen-Wechsel konkretisiert |
| Neue Kulturdatei | 28.9 | `q7_geschaeftsprinzipien_v1.md` erstellt (BUG_008 behoben) |

---

## WAS IST NEU IN v22.0

| Bereich | Kapitel | Kurzbeschreibung |
|---------|---------|-----------------|
| P_017 Matrix1 | 27 | Eigenständiger Prozess: Maßnahmen & Priorisierungsmatrix nach DNA-Auswertung |
| Vorlage Matrix1 | 6 / 27 | `MATRIX1_VORLAGE.md` in `05_UNTERNEHMEN/02_Prozesse/` |
| Output-Workflow | 4 | Matrix1 läuft zwingend durch 01_In_Arbeit → 03_Freigegeben → 05_Archiv |
| DNA-Dreiteiler | 27 / 34 | dna-analyse / dna-auswertung-intern / dna-endergebnis als Standard-Framework |
| CI-vor-Digital-Regel | 27a | Systemregel: sichtbare Touchpoints erst nach Markenidentität aktivieren |
| Vorlagen-Ablage | 6 | Alle 4 Vorlagen zentral in `05_UNTERNEHMEN/02_Prozesse/` |
| Referenz KD_001 | 34 | MATRIX1_20260622_MrKouzina.md als Referenz für künftige Kunden |

---

## WAS IST NEU IN v23.0

| Bereich | Kapitel Systemdoku | Kurzbeschreibung |
|---------|:-----------------:|-----------------|
| Prozess-Register erweitert | 27 | P_016.1b, P_016.2.3, P_016.3.1–3.5, P_016.8a neu eingetragen |
| P_016.2 Tester-Klarstellung | 27 | "Team (Menschen)" = GF + externe Tester, keine KI-Agenten |
| P_016.3 Struktur-Klarstellung | 27 | 6 Analysebereiche vs. 5 Plattform-Unterprozesse explizit getrennt |
| TikTok-Optionalität | 27 | Hermes-Regel: Nicht-Relevant-Flag, kein leerer Platzhalter |
| P_016.9 Roadmap-Längen | 27 | Scope A=12M, B=9M, C=6M formalisiert |
| P_016.10 Folienanzahl | 27 | 21 Folien (A) / 18 (B) / 12 (C) — kein "max. 20" mehr |
| P_016.11 Eskalationsregel | 27 | Max. 2 Anpassungsrunden, dann GF-Gate zwingend |
| K1–K6 Ursachen-Kategorien | 27a | Systematische Dokumentation aller 6 Kategorien mit Symptomen |
| Score-Konvertierungsregel | 27a | %-Wert je Strang wird übertragen, keine Rohpunkt-Addition |
| DNA Max-Score korrigiert | 27a | Gesamt 1.285 (Basis: dna-analyse_VORLAGE v3.0) |
| Sinneseindrücke-Mapping | 27a | P_016.2.3 ↔ DNA Strang 1.3: 1:1-Mapping dokumentiert |
| Scope-Roadmap konsolidiert | 27a | A/B/C mit Monaten und Folienanzahl an einem Ort |
| A14-Gate-Mechanismus | 1 / 6a / 9 / 17 / 21 | Technischer Hermes-Stopp bis A14-Freigabe-Vermerk im Protokoll |
| Dateiname-Korrektur | 6 / 27 | `istunternehmen_DNA.md` → `istunternehmen_DNA_Master-Checkliste.md` |
| Versionshistorie ausgelagert | — | Diese Datei ersetzt Änderungshistorie + Kap. 31–34 in der Systemdoku |
| Kap. 31 Offene Pendenzen | 31 | 9 GF-Entscheidungspunkte P23-01 bis P23-09 strukturiert |

---

## OFFENE BUGS (Stand v23.0)

| Bug-ID | Priorität | Beschreibung | Status |
|--------|:---------:|-------------|:------:|
| BUG_20260620_001 | HIGH | P_016.1 Kundentyp-Klassifizierung (Maßanfertiger) | OFFEN |
| BUG_20260620_002 | MEDIUM | P_016.2 Ausnahme-Protokoll Tester-Regel | OFFEN |
| BUG_20260620_003 | MEDIUM | P_016.2 Einzelstandort-Logik | OFFEN |
| BUG_20260620_004 | HIGH | P_016.3 Prüftiefe Digital Audit | OFFEN |
| BUG_20260620_006 | MEDIUM | P_016.7 Offene Kunden-Ideen Feld | OFFEN |
| BUG_20260620_007 | CRITICAL | A14 Grundlagen-Dateien noch nicht erstellt | OFFEN |

---

*Q7_Neuerungen_v23_0.md | Q7-System v23.0 | 25.06.2026*
*Wird bei jeder neuen Systemversion durch Q7_Neuerungen_v[XX]_0.md ersetzt.*
