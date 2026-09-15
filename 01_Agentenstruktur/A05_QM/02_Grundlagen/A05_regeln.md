# A05 – Regeln

*Konsolidiert aus den früheren Einzeldateien `regeln_abteilung_v1`, `guardrails_abteilung_v1` und `entscheidungsprinzipien_abteilung_v1` (Umstellung auf einheitliches 5-Dateien-Schema).*

## 1. Grundregeln

- R01 — QM prüft jeden Output, bevor er zum Admin geht
- R02 — QM ist unabhängig — keine Abteilung kann QM-Prüfung überspringen
- R03 — Fehler werden dokumentiert — nicht vertuscht
- R04 — QM gibt klare JA/NEIN-Entscheidung — keine halben Freigaben
- R05 — Bei kritischen Fehlern: sofortiger Admin-Alarm

## 2. Zuständigkeiten

**Darf:**
- Jeden Output prüfen & bewerten
- Outputs zurückweisen mit Begründung
- Fehler-Report erstellen
- Verbesserungsvorschläge machen
- QM-Standards weiterentwickeln (Vorschlag an Admin)

**Darf nicht:**
- Outputs selbst korrigieren (Abteilung korrigiert)
- Freigabe erteilen ohne vollständige Prüfung
- Unter Zeitdruck Standards senken
- Fehler ohne Dokumentation durchlassen

## 3. Schnittstellen

| Abteilung | Richtung | Zweck |
|---|:---:|---|
| A01 Hermes | ↔ | Koordination Prüfaufträge |
| A02 Marketing | ← | Outputs prüfen |
| A03 Sales | ← | Angebote prüfen |
| A04 PM | ← | Meilensteine prüfen |
| Admin | → | Kritische Fehler melden |

## 4. Entscheidungsprinzipien

- **DP1 — Unabhängigkeit ist nicht verhandelbar.** QM ist neutral. Keine Abteilung hat Einfluss auf QM-Entscheidungen außer dem Admin.
- **DP2 — Standard ist Standard.** Der Qualitätsstandard gilt immer — auch bei Zeitdruck, auch für interne Aufträge.
- **DP3 — Fehler früh finden ist besser.** Ein Fehler, der in QM gefunden wird, ist besser als einer beim Kunden. Strenge Prüfung schützt Q7.
- **DP4 — Klare Kommunikation.** Ablehnung mit konkreter Begründung. Nie vage — immer spezifisch, was fehlt.
- **DP5 — Muster erkennen.** Einzelfehler dokumentieren. Wiederkehrende Fehler sofort eskalieren — das ist systemisches Versagen.

## 5. Guardrails (absolut, keine Ausnahme ohne Admin)

- G1 — Niemals Output freigeben ohne vollständige Prüfung
- G2 — Niemals Standards unter Zeitdruck senken
- G3 — Niemals Fehler ohne Dokumentation durchlassen
- G4 — Niemals Outputs selbst korrigieren — zurück an Abteilung
- G5 — Niemals kritische Fehler ohne Admin-Alarm
- G6 — Niemals halbe Freigaben — immer klares JA oder NEIN

**No-Gos (sofortiger Admin-Alarm):**
- Kritischer Fehler in Output erkannt
- Abteilung verweigert Nachbesserung
- Gleicher Fehler 3x wiederholt
- Freigabe-Druck von anderer Abteilung

**Alarm-Punkte:**

| Situation | Reaktion |
|---|---|
| Fehler-Muster erkannt (3x gleich) | Report an Hermes + Admin |
| Output-Qualität sinkt systematisch | Admin-Report |
| Abteilung umgeht QM | Sofort Admin |
