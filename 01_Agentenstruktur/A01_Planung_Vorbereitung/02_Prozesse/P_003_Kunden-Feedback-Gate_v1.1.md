---
prozess_id: P_003
name: Kunden-Feedback-Gate
version: 1.1
status: Final freigegeben
verantwortliche_agenten: [A03_Vertrieb, A04_PM]
eskalationsziel: Admin (Chat, keine Dashboard-Instanz)
letzte_änderung: 2026-09-12
ablageort: D:\Q7\Q7-doku\01_Agentenstruktur\A01_Planung_Vorbereitung\02_Prozesse\
ausnahme_von_prinzip: >
  Weicht bewusst vom Separation-of-Concerns-Prinzip ab (Prozessdateien normalerweise
  zentral in 02_Prozesse/, nicht im Agentenordner). Admin-Entscheidung vom 23.07.2026:
  liegt im A01-Ordner, da A01 der ausführende/kundenseitige Agent für diesen
  Prozess ist. Kollisionsrisiko mit alten Teil-C-Nummern (P_012, P_023) durch
  neue Prozess-ID P_003 strukturell vermieden — Merkposten: finale Bestätigung,
  dass Teil-C-Register nicht ebenfalls niedrige Nummern (P_001–P_003) nutzt,
  steht noch aus.
verknuepfte_prozesse: [P_002_A01-Kanal-Intake-Klassifikation]
---

# P_003 — Kunden-Feedback-Gate

## 1. Zweck
Strukturierter Umgang mit Kunden-Rückmeldungen zu Q7-Ergebnissen oder -Systemverhalten.
Trennt klar zwischen kostenloser Nachbesserung (Qualitätssicherung) und kostenpflichtiger
Sonderleistung (Zusatzwunsch), um Missbrauch ("Unzufriedenheit" als Umweg zu Gratis-Extras)
strukturell auszuschließen.

## 2. Trigger
Kunde meldet über den Chat ein Problem mit dem System oder Unzufriedenheit mit einem Ergebnis.

## 3. Ablauf

### Schritt 1 — Meldung eingehen
- Kanal: Chat (Kunden-Login-Bereich)
- Keine Vorklassifizierung durch den Kunden erforderlich — freie Formulierung.

### Schritt 2 — Klassifizierung durch A01
A01 ordnet die Meldung automatisch einem von zwei Pfaden zu:

| Pfad | Definition | Beispiel |
|---|---|---|
| **A — Fehler/Mangel** | Ergebnis weicht von vereinbarter/erwartbarer Leistung ab | "Das Angebot hat den falschen Preis" |
| **B — Zusatzwunsch** | Kunde fragt nach etwas, das nie Teil der bestehenden Leistung war | "Kann das System auch X können?" |

**Klassifizierungslogik (Lernphase, analog SEC-GATE):**
- Anfangsphase: A01 schlägt Klassifizierung vor, aber jede Zuordnung ist zunächst nicht endgültig — Admin sieht die Einordnung in der nächsten Zusammenfassung und kann sie korrigieren.
- Bei eindeutigen Signalwörtern/-mustern (z. B. Bezug auf konkret gelieferten Output = A; Bezug auf nie vereinbarte Funktion = B) lernt A01 aus den Admin-Korrekturen zunehmend autonome Zuordnung.
- **Referenzmerkmale (Startpunkt, zu erweitern):**
  - Pfad A: Kunde bezieht sich auf ein bereits geliefertes, konkretes Artefakt (Angebot, Dokument, Antwort) und benennt einen Fehler darin.
  - Pfad B: Kunde beschreibt eine Fähigkeit/einen Prozess, der im bisherigen Leistungsumfang nicht vorgesehen war.

**Bei Unklarheit:** A01 stellt die Rückfrage direkt im laufenden Chat an den Admin (kein separater Dashboard-Eintrag). Erst nach Admin-Antwort läuft der Prozess weiter.

### Schritt 3a — Pfad A: Fehler/Mangel
- Keine Kosten für den Kunden.
- Kein Freigabe-Gate nötig — Korrektur wird direkt durch den zuständigen Agenten (A03/A04, je nach Ursprungsprozess) umgesetzt.
- Nach Korrektur: kurze Bestätigung an Kunden im Chat.

### Schritt 3b — Pfad B: Zusatzwunsch/Sonderfeature
- A03_Vertrieb erstellt eine Aufwandsschätzung.
- Individueller Kostenvoranschlag (nutzt bestehende Angebotslogik).

### Schritt 4b — Kunden-Freigabe
- Kostenvoranschlag wird dem Kunden vorgelegt.
- Ohne explizite Freigabe keine Umsetzung.

### Schritt 5b — Umsetzung & Abrechnung
- Nach Freigabe: Übergabe an A04_PM zur Umsetzung.
- Abschluss: Abrechnung gemäß Kostenvoranschlag.

## 4. Verknüpfte Prozesse
- Angebotserstellung (Kostenvoranschlags-Logik, Pfad B) — **Prozess-ID ungeklärt, alte Referenz "P_012" nicht verifiziert, Merkposten**
- SEC-GATE-Feinsteuerung (Lernphasen-Prinzip für Klassifizierung)
- P_002 (Kanal-Intake-Klassifikation) — Kunden-Chat-Kanal separat von externem Posteingang, keine Überschneidung

## 5. Offene Punkte
1. Erweiterung der Referenzmerkmal-Liste für die A01-Lernphase (aktuell nur Startpunkt, keine trainierte Basis).
2. Ablageort der Feedback-Historie pro Kunde — `KD_[Nr]_[Name]/` ist bewusst flach gehalten, braucht eigenes Metadatenfeld statt Unterordner.
3. **Merkposten:** Kollisionsfreiheit von P_003 zu altem Teil-C-Register nicht abschließend bestätigt.
4. Referenz auf "P_012" (Angebotserstellung) in Vorversion — nicht verifiziert, ob diese ID im aktuellen Register noch gültig ist.

## 6. Änderungshistorie
| Version | Datum | Änderung |
|---|---|---|
| 1.0 | 2026-07-23 | Erstentwurf — Klassifizierung Hermes-automatisch, Preismodell Einzel-Kostenvoranschlag, Eskalation direkt im Chat |
| 1.1 | 2026-09-12 | Terminologie Hermes→A01 korrigiert, finale Prozess-ID P_003 vergeben, Ablageort-Pfad an aktuelle Ordnerstruktur angepasst, Bezug zu P_002 ergänzt |
