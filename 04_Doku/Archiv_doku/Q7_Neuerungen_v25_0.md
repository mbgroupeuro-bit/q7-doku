# Q7 — VERSIONSHISTORIE & NEUERUNGEN
**Letzte Aktualisierung:** 26.06.2026 | **Aktueller Stand:** v25.0

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
| v23.0 | 25.06.2026 | MAJOR: Prozess-Register erweitert (P_016.1b, P_016.2.3, P_016.3.1–3.5, P_016.8a). K1–K6 dokumentiert. Max-Score korrigiert (1.285). A14-Gate-Mechanismus technisch verankert. Score-Konvertierungsregel. Scope-Roadmap-Längen. TikTok-Optionalität. Sinneseindrücke-Mapping. P_016.11 Eskalationsregel. Kap. 35 Offene Pendenzen. |
| v24.0 | 25.06.2026 | MINOR: 04_Doku als Meta-Ordner in Kap. 2 ergänzt. DNA-Vorlagen von 02_Prozesse nach 06_Vorlagen verschoben (Korrektur). Pendenzen P23-02, P23-03, P23-08 behoben. |
| **v25.0** | **26.06.2026** | **MINOR: NEU-01 (00_Gating Ordner), NEU-02 (Sub-Audit vs. DA-Dateien), NEU-03 (P_016.8a Ablageort), NEU-04 (M-Werte-Skala 1/2/3/4/5), B-01 (Sinneseindrücke 5 Punkte), P_016.6 Scope-B-Ausnahme, P_016.8 Trigger korrigiert.** |

---

## WAS IST NEU IN v25.0

| Bereich | Kapitel Systemdoku | Kurzbeschreibung |
|---------|-------------------|------------------|
| **00_Gating Ordner** | **6 / 27** | **Neuer Unterordner in 09_Kunden/KD_[Nr]_[Name]/ für Gate-Entscheidungen. P_016.1b (istunternehmen_DNA) wird hier abgelegt, da er VOR P_016.2, P_016.7 und P_016.8a läuft. Verhindert Timing-Konflikte bei der Ordnererstellung.** |
| **Sub-Audit vs. DA-Dateien** | **27 / 27a** | **Sub-Audits (FB_AUDIT, IG_AUDIT, etc.) sind Source of Truth für Details. Einzelne DA_[Bereich].md Dateien entfallen. DA_KONSOLIDIERT bleibt als Management-Summary. Klare Übergabe-Logik: Sub-Audit → DNA-Strang 2.** |
| **P_016.8a Ablageort** | **27** | **SCOPE-Datei Ablageort von 06_Kundengespräch/ nach 07_Bedarfsanalyse/ verschoben (semantisch korrekt, da Scope zur Bedarfsanalyse gehört).** |
| **M-Werte-Skala erweitert** | **27a** | **M-Werte-Skala von 1/3/5 auf 1/2/3/4/5 erweitert. M=2 hinzugefügt: "Niedrige Priorität". M=4 hinzugefügt: "Sehr wichtig, strategisch relevant". Max-Scores bleiben unverändert (1.215 gesamt).** |
| **Sinneseindrücke reduziert** | **27a** | **P_016.2.3 von 8 auf 5 Prüfpunkte reduziert (identisch mit dna-analyse Strang 1.3). Max-Score: 95. 1:1-Mapping garantiert.** |
| **P_016.6 Scope-abhängig** | **27** | **Trigger und Input von P_016.6 sind jetzt scope-abhängig. Scope A: Trigger P_016.5, Input P_016.2–P_016.5. Scope B/C: Trigger P_016.4, Input P_016.2–P_016.4. Finanzieller Gap entfällt bei Scope B/C.** |
| **P_016.8 Trigger korrigiert** | **27** | **Trigger von P_016.8 korrigiert: P_016.7 → P_016.8a (SCOPE-Festlegung). Scope muss VOR der Bedarfsanalyse stehen.** |

---

## DETAILS ZU DEN ÄNDERUNGEN IN v25.0

### 1. NEU-01 Fix — 00_Gating Ordner (Kap. 6 / 27)

**Problem in v24.0:**
- P_016.1b (istunternehmen_DNA Analyse) ist ein Gate-Prozess VOR P_016.2.
- Ablagestruktur war `06_Kundengespräch/` — dieser Ordner wird aber erst bei P_016.7 erstellt.
- Semantisch falsch: Gate-Entscheidung ist kein Kundengespräch.

**Lösung in v25.0:**
- Neuer Ordner `00_Gating/` als erster Unterordner in `KD_[Nr]_[Name]/`.
- P_016.1b wird hier abgelegt.
- Struktur: