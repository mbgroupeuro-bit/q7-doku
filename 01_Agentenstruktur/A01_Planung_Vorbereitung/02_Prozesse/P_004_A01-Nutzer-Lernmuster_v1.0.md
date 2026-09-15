# P_004 – A01: Nutzer-Lernmuster (Häufigkeits-Kategorisierung)

Stand: 13.09.2026
Status: **Konzept freigegeben — technische Implementierung zurückgestellt** (siehe Q7_Bugfix_Backlog.md / separate Folgesession)
Quelle: `Anweisung_A01_Fall-Trennung_Chronik.md` (Zusatzidee), `A01_Fall-Trennung_Chronik_Ergebnis.md` (Punkt 5), Klärungsrunde 13.09.2026

---

## 1. Zweck

A01 soll über Zeit erkennen, wenn sich ein Workflow beim Admin wiederholt oft
wiederholt, und von sich aus vorschlagen, diesen als festen, dokumentierten
Prozess zu formalisieren — analog zu bereits etablierten festen Mustern wie
"grill me" oder "*Q1".

---

## 2. Grundprinzip

**Kein Konfidenz-Zahlenwert bei der Erkennung selbst** (analog zur Philosophie
aus P_001) — hier aber bewusst **doch** mit klaren Zahlenschwellen für die
*Häufigkeit*, da es sich um eine objektiv zählbare Größe handelt (Anzahl
Vorkommen pro Monat), nicht um eine unscharfe Einschätzung wie "ist diese
Anfrage intern oder extern".

---

## 3. Häufigkeits-Kategorisierung

| Bereich | Häufigkeit pro Monat |
|---|---|
| A | > 20× |
| B | ~ 10× |
| C | ~ 5× (selten, unterste Meldeschwelle) |

Erreicht eine Prozess-ID mindestens Bereich C, gilt sie als
"wiederkehrend genug", um gemeldet zu werden.

---

## 4. Zähleinheit — Frage 1 (entschieden 13.09.2026)

**Entschieden: Zählung pro Prozess-ID**

- Basis: Prozessregister (`ProzessRegisterEintrag`, siehe eigenständiges
  Modul aus heutiger Session) + Chronik-Zuordnung (P_001-Flow: jeder
  Chronik-Eintrag wird nach Möglichkeit einer Prozess-ID zugeordnet)
- Gezählt wird, wie oft eine bestimmte Prozess-ID in der Chronik innerhalb
  eines gleitenden 30-Tage-Fensters vorkommt
- **Bewusst nicht gewählt:** Semantische Cluster-Bildung über Embeddings
  (würde auch bisher nicht registrierte, aber inhaltlich ähnliche Anfragen
  erfassen) — aktuell nicht umsetzbar, da `rufeKIAn()` keine
  Embedding-Fähigkeit hat (bekannter Blocker, siehe `lib/prozessRegister.ts`,
  Q7_Bugfix_Backlog.md-analoger Vermerk). Als spätere Erweiterung vorgemerkt,
  sobald Embedding verfügbar ist.
- **Bewusst nicht gewählt:** Exakte Trigger-Wort-Zählung (wie "*Q1") — zu
  starr für organisches Erkennen natürlichsprachlicher Wiederholungen

---

## 5. Zählmechanismus — Frage 2 (entschieden 13.09.2026)

**Entschieden: Täglicher Routine-Lauf, keine Live-Zählung pro Chat-Nachricht**

- Nutzt die bereits bestehende `AgentRoutine`/`AgentCronLauf`-Infrastruktur
  (dieselbe, die z. B. den täglichen Arbeitsplan-Vorschlag trägt)
- Einmal täglich: Zählung aller Prozess-ID-Vorkommen der letzten 30 Tage,
  Abgleich gegen die Schwellen aus Abschnitt 3
- **Bewusst nicht gewählt:** Live-Zählung bei jedem einzelnen
  Chronik-Schreibvorgang — unnötiger Overhead für einen Anwendungsfall, der
  ohnehin über Wochen gedacht ist, nicht in Echtzeit reagieren muss
- **Bewusst nicht gewählt:** Rein reaktives On-Demand-Zählen nur auf
  expliziten Admin-Befehl — widerspricht dem Ziel "A01 erkennt von selbst"

---

## 6. Auslöseverhalten — Frage 3 (entschieden 13.09.2026)

**Entschieden: Einmalige Rückfrage pro Prozess-ID, danach nie wieder**

- Überschreitet eine Prozess-ID erstmals eine der Schwellen aus Abschnitt 3,
  fragt A01 einmalig: *"Dieser Workflow kam diesen Monat [X]-mal vor — als
  festen Prozess dokumentieren?"*
- Unabhängig davon, ob der Admin zustimmt oder ablehnt: Für diese Prozess-ID
  wird **nie wieder** automatisch nachgefragt (verhindert wiederholtes,
  nerviges Nachfragen bei bewusster Ablehnung)
- Admin kann jederzeit **manuell** über das `neuer-prozess`-Werkzeug (siehe
  P_002-Integration, `lib/ki-agent/werkzeuge.ts`) einen Prozess anlegen,
  unabhängig vom automatischen Vorschlag — die Automatik verbaut nichts,
  sie automatisiert nur die *erste* Erkennung
- **Bewusst nicht gewählt:** Wiederholte Rückfrage bei jeder neuen
  Schwellen-Stufe (Bereich C → B → A) — Risiko, als nervig empfunden zu
  werden, wenn eine bewusste Ablehnung vorlag
- **Bewusst nicht gewählt:** Rein passive Auflistung ohne aktive
  Ansprache — Risiko, vom Admin übersehen zu werden, widerspricht dem
  proaktiven Charakter, den A01 hier haben soll

---

## 7. Technische Ergänzung (identifiziert, nicht umgesetzt)

`ProzessRegisterEintrag` (siehe `prisma/schema.prisma`) benötigt ein
zusätzliches Feld:

```prisma
lernmusterAbgefragt Boolean @default(false)
```

Verhindert wiederholtes Nachfragen (Abschnitt 6) — sobald einmal gefragt
wurde (egal ob Zustimmung oder Ablehnung), wird dieses Flag gesetzt.

---

## 8. Status der Umsetzung

**Konzept vollständig geklärt und freigegeben (13.09.2026).**

**Technische Implementierung bewusst zurückgestellt** auf eine separate
Folgesession — nicht in derselben Session wie die heutige
Schema-Wiederherstellungs-Krise umgesetzt, um das Risiko einer weiteren
fragilen Baustelle direkt im Anschluss zu vermeiden.

**Für die Umsetzungs-Session benötigt:**
- Schema-Ergänzung `lernmusterAbgefragt` (siehe Abschnitt 7)
- Neue `AgentRoutine`-Instanz mit täglichem Zähl-Lauf (Anlehnung an
  bestehende Routine-Muster in `lib/ki-agent/orchestrierung.ts`,
  `fuehreAgentAuftragAus()`)
- Verknüpfung zur Chronik-Prozess-ID-Zuordnung aus P_001

---

## 9. Bezug zu bestehender Architektur

- Baut auf P_001 (Chronik-Prozess-ID-Zuordnung) und dem heute gebauten
  Prozessregister-Modul (`lib/prozessRegister.ts`, `neuer-prozess`-Werkzeug)
  auf — keine neue, unabhängige Infrastruktur
- Nutzt bestehende `AgentRoutine`/`AgentCronLauf`-Mechanik, kein neuer
  Systembestandteil

---

## 10. Änderungshistorie

| Datum | Änderung |
|---|---|
| 13.09.2026 | Erstformalisierung nach Klärungsrunde (3 Kernfragen entschieden: Zähleinheit, Zählmechanismus, Auslöseverhalten). Technische Umsetzung bewusst zurückgestellt. |
