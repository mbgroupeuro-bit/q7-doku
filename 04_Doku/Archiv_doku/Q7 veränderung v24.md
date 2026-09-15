# Q7 — VERSIONSHISTORIE & NEUERUNGEN
**Letzte Aktualisierung:** 25.06.2026 | **Aktueller Stand:** v24.0

Diese Datei dokumentiert alle Versionen und deren Neuerungen.
Die Systemdokumentation selbst bleibt dadurch dauerhaft sauber.

---

## ÄNDERUNGSHISTORIE

| Version | Datum | Beschreibung |
|---------|-------|--------------|
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
| v23.0 | 25.06.2026 | MAJOR: Prozess-Register erweitert (P_016.1b, P_016.2.3, P_016.3.1–3.5, P_016.8a). K1–K6 dokumentiert. Max-Score korrigiert (1.285). A14-Gate-Mechanismus technisch verankert. Score-Konvertierungsregel. Scope-Roadmap-Längen. TikTok-Optionalität. Sinneseindrücke-Mapping. P_016.11 Eskalationsregel. Kap. 31 Offene Pendenzen. |
| **v24.0** | **25.06.2026** | **MINOR: 04_Doku als Meta-Ordner in Kap. 2 ergänzt. DNA-Vorlagen von 02_Prozesse nach 06_Vorlagen verschoben (Korrektur). Pendenzen P23-02, P23-03, P23-08 behoben.** |

---

## WAS IST NEU IN v24.0

| Bereich | Kapitel Systemdoku | Kurzbeschreibung |
|---------|-------------------|------------------|
| **04_Doku Meta-Ordner** | **2 / 32** | **Neuer Meta-Ordner für System-Versionierung & Erfahrungen aus Testläufen. Enthält: aktuelle Systemdokumentation, Archiv alter Versionen, Lessons Learned. NICHT Teil der 6-Ordner-Betriebsarchitektur (HART).** |
| **DNA-Vorlagen Ablage korrigiert** | **6 / 27 / 27a** | **DNA-Vorlagen (dna-analyse, dna-auswertung-intern, dna-endergebnis, MATRIX1, istunternehmen_DNA_Master-Checkliste) von 05_UNTERNEHMEN/02_Prozesse/ nach 05_UNTERNEHMEN/06_Vorlagen/ verschoben. Semantisch korrekter: Vorlagen gehören in Vorlagen-Ordner, nicht in Prozesse-Ordner.** |
| **P23-02 behoben** | **27a / 31** | **DNA Max-Score in dna-auswertung-intern_VORLAGE.md und dna-endergebnis_VORLAGE.md auf 1.285 korrigiert (war fälschlich 1.215).** |
| **P23-03 behoben** | **31** | **P_016.8a SCOPE-Datei Ablageort von 06_Kundengespräch/ nach 07_Bedarfsanalyse/ verschoben (semantisch korrekter).** |
| **P23-08 behoben** | **31** | **Auftragsformular Footer auf v22.0 aktualisiert + CI-vor-Digital-Hinweis ergänzt.** |

---

## DETAILS ZU DEN ÄNDERUNGEN IN v24.0

### 1. 04_Doku als Meta-Ordner (Kap. 2 / 32)

**Problem in v23.0:**
- Systemdokumentation lag in ROOT (unstrukturiert)
- Keine zentrale Stelle für alte Versionen
- Erfahrungen aus Testläufen nicht systematisch abgelegt

**Lösung in v24.0:**
- Neuer Meta-Ordner `04_Doku/` mit klarer Struktur:
  - Aktuelle Systemdokumentation (v24.0)
  - Archiv aller früheren Versionen (v12.0–v23.0)
  - Erfahrungen & Lessons Learned aus Testläufen
  - Versionshistorie & Neuerungen (Q7_Neuerungen_v[XX]_0.md)

**Warum Meta-Ordner (nicht 7. Haupt-Ordner)?**
- Die 6-Ordner-Architektur ist HART (Kap. 29.1) — Änderung nur mit GF-Entscheidung
- `04_Doku` dient der System-Verwaltung, nicht dem Betrieb
- CHANGELOG liegt in ROOT (nicht in 04_Doku) — bleibt zentraler Tracker
- Klare Trennung: Betrieb (01–06) vs. Verwaltung (07)

**Struktur:**