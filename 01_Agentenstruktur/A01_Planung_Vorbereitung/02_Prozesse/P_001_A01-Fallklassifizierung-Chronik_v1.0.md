# P_001 – A01: Fallklassifizierung (extern/intern) + Chronik-Auswertung

Stand: 11.09.2026
Status: **Freigegeben nach Grillung** — bereit zur Implementierung
Quelle: `Anweisung_A01_Fall-Trennung_Chronik.md`, `A01_Fall-Trennung_Chronik_Ergebnis.md`, Grill-Session vom 11.09.2026

---

## 0. Zweck

A01 entscheidet für jede eingehende Nachricht, ob sie extern/allgemein (Pfad Allgemein)
oder intern/Q7-bezogen (Pfad Intern) ist, und nutzt bei Pfad Intern die Chronik, um
bewährte Workflows wiederzuerkennen statt neu zu raten.

---

## 1. Gesamt-Pipeline

```
Eingehende Nachricht
  │
  ▼
[1] Kritik-Check (Trigger-Wörter + LLM-Fallback)
  │ Treffer ──────────────────────────────► Rückversicherungs-Flow (Abschnitt 5)
  │ kein Treffer
  ▼
[2] Possessiv-/Bezugswort-Check
  │ Treffer ("unser", "bei uns", "unsere Firma" …) ──► Pfad Intern
  │ kein Treffer
  ▼
[3] Extern-zuerst-Filter (klare Allgemein-Signale, Weltwissen)
  │ Treffer ──► Pfad Allgemein (Modell direkt via rufeKIAn(), z. B. Haiku)
  │ kein Treffer
  ▼
Pfad Intern
  │
  ▼
[4] Prozess-ID-Match (Primärschlüssel)
  │ Treffer ──► Workflow anwenden
  │ kein Treffer
  ▼
[5] Embedding-Fallback (semantische Suche, via rufeKIAn(), Cosine-Similarity
     über embedding_json)
  │ Treffer ──► Workflow anwenden
  │ kein Treffer / unsicher
  ▼
Nachfrage beim Nutzer (Abschnitt 4)
```

**Bindend:** Jeder Modell-Call in dieser Pipeline (Fall-A-Antwort, Embedding-
Berechnung, LLM-Fallback im Kritik-Check) läuft über `rufeKIAn()` — keine
Ausnahme, keine direkten Provider-Calls.

---

## 2. Stufe 1 — Kritik-Check (vorgeschaltet)

- Läuft **vor** jeder Fall-A/B-Klassifizierung, bei jeder eingehenden Nachricht
- Erkennung: feste Trigger-Wörter für eindeutige Fälle ("nein", "gefällt mir
  nicht", "das meinte ich nicht" …) + LLM-Fallback bei unklaren Formulierungen
- Bei Treffer: automatisches Handeln stoppt sofort, Rückversicherungs-Flow
  greift (siehe Abschnitt 5)
- **Begründung Reihenfolge:** verhindert, dass eine Kritik-Äußerung fälschlich
  über den Extern-zuerst-Filter als Pfad Allgemein durchgeht (Grill-Revision 1)

---

## 3. Stufe 2 — Possessiv-/Bezugswort-Check (neu, Grill-Revision 4)

- Feste Wortliste: "unser/e/em", "bei uns", "unsere Firma", "unser Kunde"
  u. ä. — erweiterbar
- Treffer → automatisch Pfad Intern, unabhängig vom sonstigen Frageninhalt
- **Begründung:** fängt Grenzfälle ab, die sprachlich allgemein klingen, aber
  durch Possessivbezug klaren Firmenkontext haben (Beispiel: "Was kostet ein
  Angebot normalerweise in unserer Branche?")
- Kein zusätzlicher Modell-Call — reiner Wortlisten-Check, kein Bruch der
  sequenziellen Philosophie

---

## 4. Stufe 3 — Extern-zuerst-Filter (Pfad Allgemein / Pfad Intern)

- Sequenziell, kein Parallel-Klassifizierer
- Prüft auf klare Allgemein-Signale (Weltwissen, kein Firmenbezug erkennbar)
- Treffer → Pfad Allgemein: Antwort direkt über Modell (z. B. Haiku via `rufeKIAn()`)
- Kein Treffer → automatisch Pfad Intern: Chronik-Suche wird ausgelöst
- **Begründung Default-Richtung:** Pfad Intern hat über die Chronik-Logik bereits
  einen "nachfragen statt raten"-Mechanismus eingebaut — unklare Fälle landen
  automatisch in der sichereren Variante

---

## 5. Chronik-Suche (Pfad Intern)

### 5.1 Primärschlüssel: Prozess-ID-Match

- Jeder Chronik-Eintrag wird beim Speichern nach Möglichkeit einer Prozess-ID
  zugeordnet
- Suche läuft primär über Prozess-ID-Match

### 5.2 Fallback: Semantische Suche (Embeddings)

- Kein ID-Treffer → semantische Suche als Fallback
- Reiner Text-/Keyword-Match verworfen (zu fehleranfällig bei anderer
  Formulierung, gleicher Sinn)
- **Technische Umsetzung (Grill-Revision 3, nach Schema-Prüfung):**
  - DB-Provider ist **SQLite** (bestätigt in `prisma/schema.prisma`) — kein
    pgvector möglich
  - Embeddings werden als JSON-Array-String in neuem Feld `embedding_json`
    gespeichert (Muster konsistent mit bestehenden Feldern wie `usage_json`,
    `eingabe_daten`)
  - Ähnlichkeitsberechnung (Cosine-Similarity) läuft applikationsseitig in
    einer neuen Hilfsfunktion, z. B. `lib/chronikSuche.ts`
  - Embedding-Modell-Call selbst läuft über `rufeKIAn()` — ggf. Erweiterung
    von `rufeKIAn()` um Embedding-Modus nötig (offener technischer Punkt,
    nicht blockierend)
  - **Merkposten:** Skalierungsgrenze bei wachsender Chronik — spätere
    Migration zu Postgres + pgvector oder externem Vektor-Store als
    Zukunftsoption, aktuell nicht umzusetzen

---

## 6. Chronik-Datenstruktur

| Feld | Beschreibung |
|---|---|
| `ursprüngliche_frage` | Original-Formulierung des Nutzers |
| `verwendete_werkzeuge` | Welche Tools/Agenten beteiligt waren |
| `erfolg_misserfolg` | Strukturiertes Feld (nicht Freitext) |
| `kritik` | true/false |
| `korrektur_text` | Was der Nutzer korrigiert hat |
| `ursprungs_antwort` | Die ursprünglich kritisierte Antwort |
| `prozess_id` | Primärschlüssel für Workflow-Wiedererkennung |
| **`prozess_id_konfidenz`** *(neu, Grill-Revision 2)* | "sicher" / "geschätzt" — von A01 beim Speichern vergeben |
| **`embedding_json`** *(neu, Grill-Revision 3)* | JSON-Array der Embedding-Werte für semantische Suche |

**Begründung strukturierte Felder statt Freitext:** nur so ist maschinelle
Auswertung möglich (z. B. "zeige alle Kritikpunkte der letzten 30 Tage")

### 6.1 Korrekturpfad für Prozess-ID-Fehlzuordnung (Grill-Revision 2)

- A01 vergibt beim Speichern `prozess_id_konfidenz`: "sicher" oder "geschätzt"
- "Geschätzt"-Einträge sind separat filterbar für spätere Admin-Sichtung
- Zusätzlich: Wenn eine A01-Antwort, die auf einem Chronik-Treffer basiert,
  vom Nutzer kritisiert wird (siehe Abschnitt 2), wird die zugrundeliegende
  Prozess-ID-Zuordnung automatisch auf "zu prüfen" markiert
- Manuelle Korrektur durch Admin bleibt jederzeit zusätzlich möglich

---

## 7. Unsicherheits-Schwelle

Kein separater Konfidenz-/Zahlenwert. A01 gilt als unsicher genug zum
Nachfragen, wenn **eine** der beiden Bedingungen zutrifft:

1. Fall-Zuordnung unklar (Stufen 2–4 liefern kein eindeutiges Signal)
2. Kein passender Workflow gefunden (Abschnitt 5 liefert keinen ausreichend
   ähnlichen Treffer)

Kein hartes Coding mit Prozentzahlen — A01 wird auf dieses Verhalten
trainiert, nicht programmiert.

---

## 8. Rückversicherungs-Flow (Kritik)

1. Nutzer äußert Unzufriedenheit ("nein", "gefällt mir nicht", "das meinte
   ich nicht")
2. A01 erkennt das (Abschnitt 2) → stoppt automatisches Handeln
3. A01 formuliert Rückversicherung: "Achso, ich habe verstanden: du möchtest
   [X]. Richtig?"
4. Nutzer bestätigt → erst dann wird umgesetzt
5. Kritikpunkt wird strukturiert in Chronik geloggt (Abschnitt 6) → Basis für
   künftige Verbesserung; falls Chronik-basiert, zusätzlich Prozess-ID-Flag
   (Abschnitt 6.1)

---

## 9. Bezug zu bestehender Architektur

- Chronik wird Teil des Sidebar-Punkts "Aktivitäten" (Tab "Verlauf")
- A01 = zentrale Klassifizierungsinstanz, Modell-Wahl folgt Master v1.2
- `rufeKIAn()`-Abstraktion bindend für alle Modell-Calls dieser Pipeline
  (Fall-A-Antworten, Kritik-LLM-Fallback, Embedding-Berechnung)

---

## 10. Offene Punkte (bewusst verschoben, nicht Teil dieses Prozesses)

- **Nutzer-Lernmuster / Häufigkeits-Kategorisierung** (Bereich A/B/C nach
  Häufigkeit pro Monat) — eigene Klärungsrunde nötig (Zählbasis, Zeitfenster,
  Trigger-Zeitpunkt, Speicherort)
- **`rufeKIAn()`-Erweiterung um Embedding-Modus** — technischer
  Umsetzungsdetail, nicht blockierend für dieses Prozessdesign
- **Skalierungsgrenze SQLite-Embedding-Ansatz** — Migrationsoption für
  spätere Phase vermerkt

---

## 11. Änderungshistorie dieses Dokuments

| Datum | Änderung |
|---|---|
| 11.09.2026 | Erstformalisierung aus Ergebnis-Dokument + 4 Grill-Revisionen (Kritik-Check-Reihenfolge, Prozess-ID-Konfidenz-Feld, SQLite-Embedding-Lösung, Possessiv-Vorprüfung) |
| 11.09.2026 | Begriffe "Fall A/Fall B" → "Pfad Allgemein/Pfad Intern" umbenannt — Namenskollision mit bestehendem, produktivem Kanal-Intake-System (`P_0XX_A01_Kanal-Intake-Klassifikation`, `A01_Routing-Entscheidung`) vermieden. Beide Systeme bleiben inhaltlich getrennt (unterschiedlicher Auslöser: Posteingang-Kanal vs. direkter A01-Chat), nur die Bezeichnung war doppelt belegt. |
