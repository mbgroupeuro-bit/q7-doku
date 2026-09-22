# Q7 — Kontext-Zusammenfassung, Stand 31.07.2026 (aktualisiert, Abend)
## Thema: Kanal-Intake & Klassifikation (A01-Hermes) — E-Mail-Kanal vollständig fertig

Diese Datei fasst eine Arbeitssitzung zum Thema "Wie verarbeitet Hermes (A01) eingehende Nachrichten von Eingang bis Weiterleitung an den Fachagenten" zusammen. Gedacht als Kontext-Übergabe für einen neuen Chat.

---

## 1. Getroffene Entscheidungen

**Grundablauf (6 Schritte):**
1. Eingang — rohes Ereignis am Kanal (E-Mail, WhatsApp, ...)
2. Kanal-Adapter — technischer Empfänger (Webhook-Endpoint oder Poller), rein technisch, keine Inhaltslogik
3. Aufnahme des Inputs — Normalisierung (Absender, Kanal, Zeitstempel, Inhalt, Anhänge) → Task-Datensatz in DB, `status=OFFEN`
4. Hermes-Trigger — App-Layer ruft A01_Hermes via `rufeKIAn()` mit Task-Kontext auf
5. Klassifikation — Hermes bestimmt Anliegen-Typ, Ziel-Agent, Dringlichkeit, Konfidenz
6. Weiterleitung — Kontext + Prozess-Referenz gesammelt, an Fachagent übergeben, `status=IN_BEARBEITUNG`

**Klassifikations-Logik (Schritt 5):**
- 5.2.1 Anliegen-Typ = Kernschritt, alles andere baut darauf auf
- Konfidenz-Stufen: 🟢 eindeutig → direktes Routing | 🟡 unsicher → Verständnis-Rückmeldung an Admin | 🔴 mehrdeutig → Rückfrage-Pflicht an Admin vor Routing
- Verständnis-Rückmeldung geht an den **Admin**, nie an den externen Absender (Black-Box-Prinzip bleibt nach außen gewahrt)

**Anliegen-Typ-Kategorisierung:**
- Modell: feste Kategorie-Liste + bei "Sonstiges" schlägt Hermes neue Kategorie vor, Admin muss bestätigen (kontrolliertes Wachstum)
- Start-Liste: Reklamation, Vertriebsanfrage, Support-Anfrage, Interne Aufgabe, Terminanfrage, Beschwerde (allgemein), Sonstiges

**Vernetztes Wissen (Rückwärts-Verknüpfung):**
- Mehrdeutige Symptome (z.B. "Marge zu gering" → könnte Einkauf, Produktion oder Marketing betreffen) werden über Metadaten-Tags in den Wissensdateien verknüpft: `symptome`, `ursachen_cluster`, `verknuepfte_agenten`

**Drei technische/prozessuale Grundsatzentscheidungen:**
1. Konfidenz-Schwelle: **pro Agent individuell** einstellbar (nicht global)
2. Mehrdeutigkeit: **ein Ziel-Agent pro Task** als Standard; Sub-Task-Split nur als bewusste Admin-Ausnahme
3. Kanal-Adapter-Technik: **Webhook wo verfügbar**, **Polling als Fallback** (aktuell für E-Mail eingesetzt)

**Datenbank-Technologie:**
- SQLite + Prisma als Abstraktionsschicht

---

## 2. Neu erstellte Dateien (final abgelegt in Obsidian-Struktur)

| Datei | Zweck | Speicherort |
|---|---|---|
| `P_0XX_A01_Kanal-Intake-Klassifikation_v1.0.md` | Detaillierter Prozess für Hermes: Eingang → Klassifikation → Weiterleitung | `b_Q7-doku/01_Agentenstruktur/A01-Planung_Vorbereitung/02_Hermes_Prozesse/` |
| `Anliegen_Prozess_Matrix.md` | Zuordnungstabelle: Anliegen-Typ → Prozess-ID → Ziel-Agent → benötigte Dateien | `b_Q7-doku/01_Agentenstruktur/A01-Planung_Vorbereitung/02_Hermes_Prozesse/` |
| `Metadaten_VORLAGE.md` | Universelle YAML-Frontmatter-Vorlage für alle Wissens-/Prozessdateien | `b_Q7-doku/04_Doku/` |

**Hinweis:** Prozess-ID noch als Platzhalter `P_0XX` — finale Nummer noch offen (Kollision mit bestehendem P_023 beachten).

---

## 3. Technischer Umsetzungsstand — E-Mail-Kanal VOLLSTÄNDIG FERTIG

**Datenbank:**
- Prisma + SQLite eingerichtet in `a_Q7-code` (Prisma Version 6 verwendet — Version 7 hat Breaking Change bei `url`-Syntax in `schema.prisma`, daher Downgrade nötig)
- Schema-Datei: `a_Q7-code/prisma/schema.prisma`
- Tabellen `aufgaben` und `aufgabe_chat` real angelegt: `c_Q7_datenbank/02_Agenten_Datenbank/q7_agenten.db`

**Kanal-Adapter E-Mail (Gmail):**
- Datei: `a_Q7-code/scripts/poll-gmail.js`
- Technik: IMAP-Polling (liest ungelesene Mails, normalisiert, schreibt Task mit `status=OFFEN`, markiert Mail als gelesen)
- Pakete: `imapflow`, `mailparser`, `dotenv`
- Zugangsdaten in lokaler `.env`-Datei (App-Passwort, nicht geteilt)

**Dediziertes Geschäfts-Gmail-Konto eingerichtet:**
- Ursprünglich privates Konto (`mbgroupeuro@gmail.com`) enthielt zu viel Newsletter-Rauschen
- Neues, sauberes Konto angelegt (`abuu4666@gmail.com`), 2FA aktiviert, eigenes App-Passwort erstellt
- `.env` entsprechend aktualisiert

**Automatisches Polling (Windows Task Scheduler) — eingerichtet und stabil laufend:**
- Batch-Datei: `a_Q7-code/run-poll-gmail.bat` (nutzt vollen Pfad zu `node.exe`, da Task Scheduler den PATH nicht immer korrekt auflöst)
- Task-Name: `Q7_Gmail_Polling`, läuft alle 2 Minuten
- Log-Datei: `a_Q7-code/scripts/poll-log.txt`
- **Wichtige Fehlerbehebung dokumentiert:** Task mit `/rl highest` (erhöhte Rechte) lief scheinbar erfolgreich (Ergebnis-Code 0), schrieb aber nichts in die Log-Datei — Ursache war die erhöhte Rechteanforderung. Lösung: Task **ohne** `/rl highest` neu angelegt, seitdem funktioniert es zuverlässig.
- Aufräum-Skript erstellt: `a_Q7-code/scripts/cleanup-aufgaben.js` (löscht Testdaten aus der DB bei Bedarf)

**Vorfall während der Einrichtung (gelöst):**
- Task lief unbemerkt bereits einige Zeit gegen das alte, volle Postfach → 3957 Test-Einträge in der Datenbank entstanden
- Über `cleanup-aufgaben.js` vollständig bereinigt, Datenbank ist jetzt sauber

**WhatsApp-Kanal-Adapter:**
- Twilio-Sandbox-Einrichtung hat nicht funktioniert → zurückgestellt, E-Mail-Kanal hatte Priorität

---

## 4. Offene Punkte für die Fortsetzung

**Mittelfristig:**
- Einzelprozesse P_0XX pro Anliegen-Typ ausschreiben (Matrix hat bisher nur Platzhalter)
- Prozess-ID final vergeben
- Konfidenz-Schwellen pro Agent konkret festlegen
- Filter-Logik für E-Mail-Adapter überlegen, falls später wieder unerwünschte Mails/Rauschen reinkommen (aktuell durch sauberes dediziertes Konto nicht akut)
- WhatsApp-Kanal-Adapter — Alternative zu Twilio-Sandbox prüfen

**Später:**
- Verknüpfung Kanal-Adapter → Hermes-Trigger (`rufeKIAn()`) direkt nach DB-Insert automatisch auslösen (aktuell nur der Insert-Teil fertig, automatischer Klassifikations-Aufruf noch zu verdrahten — das ist der nächste große Baustein)
- Weitere Kanäle anbinden
- Bei produktivem Einsatz: Log-Datei `poll-log.txt` regelmäßig prüfen/leeren, damit sie nicht unbegrenzt wächst
