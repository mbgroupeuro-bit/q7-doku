---
titel: A01 Routing-Entscheidung (Ergänzung zu P_002 Kanal-Intake-Klassifikation)
dateityp: prozess-annex
agent: A01
version: 1.1
datum: 2026-09-12
status: Final freigegeben
verknuepfte_prozesse: [P_002_A01-Kanal-Intake-Klassifikation]
---

# A01 — Routing-Entscheidung

## Kernregel (vereinfacht, ersetzt frühere Sonderfall-Überlegungen)

Nach der Klassifikation (Schritt 5 in P_002) trifft A01 genau eine von zwei Entscheidungen:

**Fall A — Eingang ist klar**
- Anliegen-Typ eindeutig erkannt, Prozess/Ziel-Agent zuordenbar (Konfidenz 🟢)
- → automatische Weiterleitung an den zuständigen Fachagenten
- Status: `IN_BEARBEITUNG`

**Fall B — Eingang ist nicht klar**
- Anliegen-Typ nicht eindeutig zuordenbar, oder A01 unsicher (Konfidenz 🟡/🔴)
- → keine automatische Weiterleitung
- → einfache Rückfrage an den Admin: was soll damit passieren?
- Status: `RUECKFRAGE_ADMIN`

Kein weiterer Sonderfall, keine zusätzliche Kategorie nötig — die Unterscheidung "kann ein Agent das erledigen oder nicht" ergibt sich automatisch daraus, ob ein Prozess/Ziel-Agent zuordenbar ist. Ist das nicht der Fall, landet es ohnehin bei Fall B (Admin entscheidet).

*Hinweis: "Fall A/Fall B" bezeichnet hier ausschließlich den Kanal-Intake-Routing-Kontext (P_002) — nicht zu verwechseln mit den in P_001 verwendeten Begriffen "Pfad Allgemein/Pfad Intern" (A01-Chat-Klassifikation), die einen anderen Auslöser betreffen.*

## Lernphase (Zusatzprinzip für den Anfang)

In der Anfangsphase kennt A01 die individuelle Arbeitsweise und Entscheidungslogik des jeweiligen Lizenznehmers noch nicht. Jede Rückfrage (Fall B) ist daher auch eine Gelegenheit für A01, aus der Admin-Antwort zu lernen, wie dieser Lizenznehmer typischerweise entscheidet.

**Noch offen (separater Baustein, nicht Teil dieser Version):**
- Speicherung von Admin-Antworten auf Rückfragen als Lernkontext
- Einbindung dieses Kontexts in künftige A01-Klassifikationen, damit die Rückfrage-Quote mit der Zeit sinkt

## Bezug zur technischen Umsetzung
Diese Logik ist in `scripts/trigger-hermes.ts` bereits so umgesetzt (Stand 01.08.2026):
- Konfidenz 🟢 → `status = IN_BEARBEITUNG`
- Konfidenz 🟡/🔴 → `status = RUECKFRAGE_ADMIN`

**Offen:** Umbenennung `trigger-hermes.ts` → `trigger-a01.ts` (Backlog). Sichtbarkeit dieser Status in der App-Oberfläche (Eingang/Aufgaben-Bereich) — noch nicht angebunden.

## Änderungshistorie
| Version | Datum | Änderung |
|---|---|---|
| 1.0 | 2026-08-01 | Erstfassung, Agent-Bezeichnung "Hermes"/teils "A01" gemischt |
| 1.1 | 2026-09-12 | Terminologie vollständig A01, Bezug zu P_002 (statt P_0XX) korrigiert, Abgrenzung zu P_001-Begriffen ergänzt |
