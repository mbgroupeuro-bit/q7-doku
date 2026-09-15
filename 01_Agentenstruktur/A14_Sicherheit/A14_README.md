# A14_Sicherheit — README

**Ordner:** 02_KI-UNTERNEHMEN/A14_Sicherheit/02_Grundlagen/
**Version:** v2.0 | **Status:** Aktiv
**Änderungen seit v1.0:** Filter 1+2 von A01 zu A14 verschoben (jetzt vollständig in Quarantäne) · PII-Trennung in Quarantäne vorgezogen (statt erst 02_Eingang) · A14b Backup-Agent ergänzt · Tresor-Pfad auf KD_[Nr] direkt korrigiert (KD_Neu/ entfällt) · Exklusivität 01_Quarantäne jetzt A14 + GF (A01 hat keinen Zugriff mehr)

---

## 1. Zweck dieser Datei

Diese Datei ist der Einstiegspunkt für A14_Sicherheit. Sie gibt einen Überblick über die Funktion der Abteilung im Gesamtsystem und verweist auf die vier weiteren Grundlagen-Dateien in diesem Ordner.

A14 ist das **absolute First-Gate** im System für alle eingehenden Kunden-Dateien — noch vor A01 (Hermes). A14 ist der **einzige Agent mit Zugriff auf `01_INPUT/01_Quarantäne`**, gemeinsam mit dem GF. Kein anderer Agent — insbesondere nicht A01 — erhält Zugriff auf einen Input, bevor A14 ihn vollständig geprüft und freigegeben hat.

---

## 2. API-Trigger

| Trigger-Typ | Ereignis | Folge |
|---|---|---|
| Eingang | Neuer Input erreicht `01_INPUT/01_Quarantäne` | A14 startet Prüfung automatisch (Filter 1 → Filter 2 → PII-Trennung) |
| Ausgang (positiv) | Filter 1 + Filter 2 bestanden + PII-Trennung abgeschlossen | Freigabe-Vermerk `AUD_[Datum]_[Datei-ID]_14S_FREIGABE` gesetzt → A01 erhält Zugriff in `02_Eingang` |
| Ausgang (negativ — Schadsoftware) | Filter 1 nicht bestanden | Input → `99_Gefaengnis/Zelle_[Nr]` + GF-Alarm |
| Ausgang (negativ — Spam) | Filter 2 nicht bestanden | Input wird abgelehnt + protokolliert, kein Zugriff für A01 |
| PII erkannt | Während Filter-Durchlauf in Quarantäne | PII-Anteil → `04_TRESOR/K4_Personen/KD_[Nr]` (Write-Only), bereinigte Datei läuft regulär weiter Richtung `02_Eingang` |
| Backup-Übernahme | A14a fällt aus | A14b übernimmt automatisch (10 Sek. Failover) |

---

## 3. Datei-Register

| Datei | Zweck | Zielgruppe |
|---|---|---|
| `README.md` | Einstiegspunkt, API-Trigger, Systemkontext (diese Datei) | Mensch + Agent |
| `agentenbeschreibung.md` | Identität, Kernaufgaben, Trigger, Outputs von A14 | Mensch + Agent |
| `skills.md` | Kernkompetenzen, Wissensbasis, Kommunikationskanäle | Agent |
| `regeln.md` | Operative Regeln, Guardrails, Sanktionsmatrix, RBAC | Agent + GF |
| `loops.md` | Lernschleifen, Lernprinzipien | Agent |

---

## 4. Systemkontext

**Position im Gesamtfluss (neu, v2.0):**

```
01_INPUT/01_Quarantäne (roh, von außen)
  ↓ Zugriff EXKLUSIV: A14 + GF — kein anderer Agent, auch nicht A01
A14: Filter 1 (Schadsoftware) → Filter 2 (Spam/Legitimität) → PII-Trennung
  ↓ (Freigabe-Vermerk: AUD_..._14S_FREIGABE)
01_INPUT/02_Eingang
  ↓
A01a (Hermes): erhält ERST JETZT Zugriff — Filter 3 (Vollständigkeit), IT-ID-Vergabe,
               Workflow-Erstellung — alles A01a, keine Subagenten-Aufteilung (Stand: aktuell)
```

A14 ist First-Gate. A01 hat keinerlei Zugriff auf `01_Quarantäne` — weder lesend noch schreibend. Dies ist eine bewusste Änderung gegenüber der ursprünglichen Architektur (vormals A01-exklusiv) und gilt ab v2.0 als verbindlich.

**Abhängige Agenten:**

| Agent | Beziehung zu A14 |
|---|---|
| A01 (Hermes) | Wartet auf A14-Freigabe-Vermerk, bevor Zugriff auf `02_Eingang` möglich ist. Übernimmt danach Filter 3 + IT-ID + Workflow-Erstellung vollständig selbst. |
| A07 (Recht) | Eskalationsziel bei rechtlich unklaren Fällen (z.B. PII-Grenzfälle) |
| GF | Einziger weiterer Akteur mit Zugriff auf `01_Quarantäne`. Eskalationsziel bei Sicherheitsalarmen und Grenzfällen. |
| A08 (Finanzen) | Hält Master-Key für TRESOR; A14 hat Write-Only Zugriff auf `K4_Personen` |
| A11 (Systemcontrolling) | Überwacht A14-Durchlaufzeiten und Wartezeiten |
| A14b | Backup-Agent, übernimmt automatisch bei A14a-Ausfall (10 Sek. Failover, analog A01a/A01b) |

**Tresor-Bezug:** A14 hat Write-Only-Zugriff auf `04_TRESOR/K4_Personen/KD_[Nr]` (direkt, kein `KD_Neu/`-Zwischenschritt). A14 kann PII dort ablegen, aber nicht wieder auslesen.

---

## 5. Schnittstellen-Tabelle

| Quelle | Trigger | A14-Aktion | Ziel / Output |
|---|---|---|---|
| `01_INPUT/01_Quarantäne` | Schadsoftware erkannt (Filter 1) | Isolierung | `99_Gefaengnis/Zelle_[Nr]` + GF-Alarm + Audit-Trail |
| `01_INPUT/01_Quarantäne` | Spam/Werbung erkannt (Filter 2) | Ablehnung | Protokollierung, kein Weitertransport, Audit-Trail |
| `01_INPUT/01_Quarantäne` | PII im Inhalt erkannt | Extraktion | `04_TRESOR/K4_Personen/KD_[Nr]` (PII) + bereinigte Datei läuft weiter |
| `01_INPUT/01_Quarantäne` | Filter 1+2 bestanden + PII bereinigt | Freigabe | Vermerk `AUD_..._14S_FREIGABE` → Übergabe an A01 in `02_Eingang` |
| A14a-Ausfall | Heartbeat-Timeout | Failover | A14b übernimmt, 10 Sek. SLA |

---

*A14_Sicherheit — README | Q7-System | Datei 1/5*
