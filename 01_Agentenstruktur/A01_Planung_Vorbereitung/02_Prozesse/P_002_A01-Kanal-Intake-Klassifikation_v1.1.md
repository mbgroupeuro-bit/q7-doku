---
prozess_id: P_002
titel: Kanal-Intake und Klassifikation
agent: A01
wissensart: prozess
version: 1.1
datum: 2026-09-12
status: Final freigegeben (produktiv, siehe scripts/trigger-hermes.ts — Umbenennung ausstehend)
symptome: [Eingehende Nachricht, unklare Zustaendigkeit]
verknuepfte_agenten: [A02_Marketing, A03_Vertrieb, A04_PM, A05_QM, A06_Verwaltung, A07_Recht, A08_Finanzen, A13_Personal]
verknuepfte_prozesse: [P_003_Kunden-Feedback-Gate]
---

# P_002 — Kanal-Intake und Klassifikation (A01)

## Zweck
Vereinheitlicht die Aufnahme eingehender Nachrichten aus beliebigen Kanälen (E-Mail, WhatsApp, weitere) zu einem normalisierten Task und stellt sicher, dass A01 jede Aufgabe korrekt versteht, klassifiziert und — je nach Konfidenz — direkt weiterleitet oder vorher beim Admin rückfragt.

## Geltungsbereich
Gilt für alle eingehenden Kommunikationskanäle, die an Q7 angebunden sind. Kanal-spezifische Technik (Webhook-Aufbau, API-Zugang) ist NICHT Teil dieses Prozesses — nur die Verarbeitung ab Eingang des normalisierten Tasks.

**Abgrenzung zu P_001:** Dieser Prozess gilt für Nachrichten, die über externe Kanäle (Posteingang) eintreffen. P_001 (A01-Fallklassifizierung) regelt die Unterscheidung Allgemeinwissen/Q7-Kontext bei direkten Chat-Anfragen an A01 — unterschiedlicher Auslöser, keine Überschneidung.

---

## Ablaufschritte

### Schritt 1 — Eingang
Rohes Ereignis: Eine Nachricht trifft an einem Kanal ein (E-Mail im Postfach, WhatsApp am Business-Account, etc.). Keine Datenextraktion, nur das Faktum des Eintreffens.

### Schritt 2 — Kanal-Adapter
Technischer Listener (Webhook oder Postfach-Polling), kanal-spezifisch in `a_Q7-code`. Nimmt das Rohereignis entgegen. Rein technische Schicht, keine inhaltliche Verarbeitung.

### Schritt 3 — Aufnahme des Inputs (Normalisierung)
Adapter extrahiert und normalisiert:
- Name/Absender
- Kanal
- Zeitstempel
- Inhalt (Text)
- Anhänge (Referenz, kein Volltext-Import bei Bilddateien)

Ablage als Task-Datensatz in `c_Q7_datenbank/02_Agenten_Datenbank/aufgaben`:
```
id: T_XXXXX
kanal: email | whatsapp | ...
absender: [Name/Kontakt]
zeitstempel: ISO-8601
inhalt: [Volltext]
anhaenge: [Referenz oder null]
status: OFFEN
```

### Schritt 4 — A01-Trigger
App-Layer erkennt neuen Eintrag mit `status = OFFEN` und ruft A01 via `rufeKIAn()` auf, mit dem Task-Datensatz als Kontext.

### Schritt 5 — A01-Klassifikation

**5.1 Input für A01**
Task-Datensatz aus `aufgaben`. Kein direkter Zugriff auf `01_Mandanten_Datenbank` — bei Bedarf wird Kontext (z. B. Kundenstatus) durch den App-Service injiziert, nicht von A01 selbst abgefragt.

**5.2 Analyse — Was für eine Aufgabe ist das?**

- **5.2.1 Anliegen-Typ** *(wichtigster Teilschritt — alle folgenden Punkte bauen darauf auf)*
  Zuordnung zu fester Kategorie-Liste (siehe Anliegen-Typ-Matrix, Abschnitt unten). Passt keine Kategorie, wählt A01 „Sonstiges" und schlägt einen neuen Kategorienamen vor (Admin-Freigabe erforderlich, siehe Anhang B).

- **5.2.2 Verständnis-Rückmeldung**
  Nur bei Konfidenz 🟡 oder 🔴 (siehe 5.3). A01 spiegelt kurz zurück, was verstanden wurde, an den **Admin** (nicht an den externen Absender — Black-Box-Prinzip bleibt nach außen gewahrt).
  Beispiel: *„Verstanden: Reklamation zu Küchenfront-Lieferung, Kunde KD_001."*

- **5.2.3 Rückfrage bei fehlender Information**
  Falls Ursachen/Details unklar (z. B. mehrdeutiges Symptom wie „Marge zu gering" mit mehreren möglichen Ursachen-Clustern), stellt A01 gezielte Rückfrage an den Admin, bevor weiter klassifiziert wird.

- **5.2.4 Ziel-Agent(en)**
  Ableitung aus Anliegen-Typ + ggf. Ursachen-Cluster (siehe Rückwärts-Verknüpfung, Abschnitt unten).

- **5.2.5 Dringlichkeit**
  Einstufung: sofort / normal / niedrig.

**5.3 Konfidenz-Bewertung**
- 🟢 Eindeutig → automatisches Routing, kein Zwischenschritt
- 🟡 Wahrscheinlich, nicht sicher → Verständnis-Rückmeldung (5.2.2) + Routing mit Vermerk, oder Rückfrage — abhängig von SEC-GATE-Einstellung pro Agent
- 🔴 Mehrdeutig → keine Auto-Weiterleitung, zwingend Rückfrage an Admin vor Routing (5.2.3)

**5.4 Output von Schritt 5**
Ergänzung des Task-Datensatzes:
```
anliegen_typ: [Kategorie]
ziel_agent: [A0X oder null bei offener Rückfrage]
dringlichkeit: [Stufe]
konfidenz: 🟢 | 🟡 | 🔴
```

### Schritt 6 — Vorbereitung und Weiterleitung
Bei 🟢 direkt, bei 🟡/🔴 erst nach Admin-Antwort:
- A01 sammelt benötigten Kontext (Prozess-Referenz, relevante Wissensdateien, ggf. injizierte Kundendaten)
- App-Layer ruft Ziel-Agent via `rufeKIAn()` mit Task + Kontext + Prozess-Referenz auf
- Status wechselt zu `IN_BEARBEITUNG`

---

## Anliegen-Typ-Matrix (Start-Liste, Vorwärts-Zuordnung)

| Anliegen-Typ | Ziel-Agent(en) | Konfidenz-Schwelle | Rückfrage-Pflicht |
|---|---|---|---|
| Reklamation | A05_QM | Standard | Nein (nur bei 🔴) |
| Vertriebsanfrage | A03_Vertrieb | Standard | Nein (nur bei 🔴) |
| Support-Anfrage | A04_PM / A05_QM | Standard | Nein (nur bei 🔴) |
| Interne Aufgabe | variabel | Standard | Ja, bei Mehrdeutigkeit |
| Terminanfrage | A03_Vertrieb | Standard | Nein |
| Beschwerde (allgemein) | A05_QM / A00_StabAgent | Standard | Nein (nur bei 🔴) |
| Sonstiges | — | — | Ja (Kategorievorschlag) |

*(Details: Ziel-Agenten, benötigte Wissensdateien und finale Konfidenz-Schwellen pro Zeile siehe `Anliegen_Prozess_Matrix.md`, Annex zu diesem Prozess.)*

---

## Rückwärts-Verknüpfung (Symptom → mögliche Ursachen)

Für Anliegen ohne eindeutigen Ziel-Agenten (z. B. „Marge zu gering") wird über Metadaten in Prozess-/Theorie-/Praxis-Dateien verknüpft:

```yaml
symptome: [Marge zu gering, Umsatz rückläufig]
ursachen_cluster: [Einkaufskosten, Produktionsausschuss, Marketing-Fehlsteuerung]
verknuepfte_agenten: [A08_Finanzen, A04_PM, A02_Marketing]
```

Bei Erkennung eines solchen Symptoms prüft A01 die verknüpften Ursachen-Cluster und stellt gezielte Rückfrage (5.2.3), statt an einen einzelnen Agenten zu raten.

---

## Anhang A — Beispiel-Durchlauf (🔴 Fall)

Siehe Referenzbeispiel „Interne E-Mail, mehrdeutiges Anliegen — Preisliste Q3": Task T_00147, Konfidenz 🔴 zwischen A08_Finanzen und A02_Marketing, Rückfrage an Admin, danach Sub-Task-Split nach Admin-Entscheidung.

## Anhang B — Neue Kategorie-Freigabe (Option C)
1. A01 erkennt keine passende Kategorie → wählt „Sonstiges"
2. A01 schlägt neuen Kategorienamen inkl. Begründung vor
3. Admin bestätigt oder lehnt ab
4. Bei Bestätigung: neue Zeile in Anliegen-Typ-Matrix, dauerhaft aktiv

---

## Bezug zur technischen Umsetzung
Diese Logik ist in `scripts/trigger-hermes.ts` bereits so umgesetzt (Stand 01.08.2026):
- Konfidenz 🟢 → `status = IN_BEARBEITUNG`
- Konfidenz 🟡/🔴 → `status = RUECKFRAGE_ADMIN`

**Offen:** Umbenennung `trigger-hermes.ts` → `trigger-a01.ts` (Backlog, Teil der Hermes→A01-Terminologie-Bereinigung). Sichtbarkeit dieser Status in der App-Oberfläche (Eingang/Aufgaben-Bereich) — noch nicht angebunden.

## Offene Punkte (nicht Teil dieser Version)
- Finale Prozess-ID war P_0XX, jetzt final **P_002** vergeben — Kollisionsfreiheit zu P_012/P_023 (alte Teil-C-Nummern) angenommen, aber **nicht abschließend bestätigt** (Merkposten)
- Vollständige `Anliegen_Prozess_Matrix.md` mit Prozess-IDs pro Zeile
- SEC-GATE-Konfiguration der Konfidenz-Schwellen pro Agent
- Umbenennung `trigger-hermes.ts` → `trigger-a01.ts`

## Änderungshistorie
| Version | Datum | Änderung |
|---|---|---|
| 1.0 | 2026-07-30 | Erstfassung als P_0XX, Agent-Bezeichnung "Hermes" |
| 1.1 | 2026-09-12 | Terminologie Hermes→A01 korrigiert, finale Prozess-ID P_002 vergeben, Abgrenzung zu P_001 ergänzt |
