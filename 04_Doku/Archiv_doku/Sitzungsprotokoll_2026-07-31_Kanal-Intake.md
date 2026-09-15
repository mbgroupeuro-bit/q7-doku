---
titel: Sitzungsprotokoll - Kanal-Intake & Klassifikation (A01-Hermes)
dateityp: prozess
agent: A01_Hermes
datum: 2026-07-31
status: Entwurf
---

# Sitzungsprotokoll — Kanal-Intake & Klassifikation

## Kontext
Thema der Sitzung: Wie erkennt und verarbeitet A01_Hermes eingehende Nachrichten (E-Mail, WhatsApp, ...) von Eingang bis Weiterleitung an den zuständigen Fachagenten.

---

## Was erstellt / entschieden wurde

### Konzept & Architektur
- **6-Schritte-Ablauf** definiert: Eingang → Kanal-Adapter → Aufnahme des Inputs → Hermes-Trigger → Klassifikation → Weiterleitung
- **Konfidenz-Logik** für Klassifikation: 🟢 eindeutig (direktes Routing) / 🟡 unsicher (Verständnis-Rückmeldung an Admin) / 🔴 mehrdeutig (Rückfrage-Pflicht an Admin)
- **Anliegen-Typ** (Schritt 5.2.1) als Kernentscheidung identifiziert — alle weiteren Klassifikations-Schritte bauen darauf auf
- **Kategorisierungs-Modell:** Option C gewählt — feste Kategorie-Liste + Hermes schlägt bei "Sonstiges" neue Kategorie vor, Admin bestätigt (kontrolliertes Wachstum der Liste)
- **Start-Liste Anliegen-Typen:** Reklamation, Vertriebsanfrage, Support-Anfrage, Interne Aufgabe, Terminanfrage, Beschwerde (allgemein), Sonstiges
- **Rückwärts-Verknüpfung:** Symptome mit mehreren möglichen Ursachen (z.B. "Marge zu gering") werden über Metadaten-Tags (`symptome`, `ursachen_cluster`, `verknuepfte_agenten`) vernetzt statt starr 1:1 zugeordnet
- **Verständnis-Rückmeldung:** Hermes spiegelt bei 🟡/🔴 zurück, was verstanden wurde — geht an Admin, nicht an externen Absender (Black-Box-Prinzip bleibt nach außen gewahrt)

### Drei offene Entscheidungen geklärt
1. **Konfidenz-Schwelle:** pro Agent individuell einstellbar (nicht global)
2. **Mehrdeutigkeit:** ein Ziel-Agent pro Task als Standard; Sub-Task-Split nur als bewusste Admin-Ausnahme
3. **Kanal-Adapter-Technik:** Webhook wo verfügbar (z.B. WhatsApp), Polling als Fallback (z.B. klassisches E-Mail-Postfach)

### Dokumente erstellt und final abgelegt
| Datei | Speicherort |
|---|---|
| `P_0XX_A01_Kanal-Intake-Klassifikation_v1.0.md` | `b_Q7-doku/01_Agentenstruktur/A01-Planung_Vorbereitung/02_Hermes_Prozesse/` |
| `Anliegen_Prozess_Matrix.md` | `b_Q7-doku/01_Agentenstruktur/A01-Planung_Vorbereitung/02_Hermes_Prozesse/` |
| `Metadaten_VORLAGE.md` | `b_Q7-doku/04_Doku/` |

### Technische Umsetzung (funktionierend getestet)
- **Datenbank-Technologie festgelegt:** SQLite + Prisma als Abstraktionsschicht
- **Prisma eingerichtet** in `a_Q7-code` (Downgrade v7 → v6 nötig, da Prisma 7 die `url`-Syntax in `schema.prisma` geändert hat)
- **Tabelle `aufgaben` + `aufgabe_chat`** real angelegt und über Prisma Studio kontrolliert (leer, aber vorhanden)
  - Schema-Datei: `a_Q7-code/prisma/schema.prisma`
  - Datenbank-Datei: `c_Q7_datenbank/02_Agenten_Datenbank/q7_agenten.db`
- **Kanal-Adapter E-Mail (Gmail)** gebaut und erfolgreich getestet
  - Datei: `a_Q7-code/scripts/poll-gmail.js`
  - Funktionsweise: IMAP-Polling, liest ungelesene Mails, schreibt normalisierten Task in `aufgaben` mit `status=OFFEN`, markiert Mail als gelesen
  - Pakete installiert: `imapflow`, `mailparser`, `dotenv`
  - Zugangsdaten liegen lokal in `.env` (App-Passwort, nicht geteilt)
  - **Testlauf erfolgreich:** Tasks wurden korrekt aus eingehenden Mails erzeugt

### Erkenntnis aus dem Testlauf
- Aktuell verwendetes Gmail-Konto (`mbgroupeuro@gmail.com`) enthält viel Newsletter-/Werbe-Rauschen (z.B. Pinterest) — jede ungelesene Mail wird aktuell als Task erfasst, auch Nicht-Geschäftliches
- Entscheidung: **dediziertes, sauberes Geschäfts-Gmail-Konto** wird separat aufgesetzt, nur für Kunden-/Geschäftskommunikation

---

## Was noch zu tun ist

### Kurzfristig (nächste Sitzung)
- [ ] Neues Geschäfts-Gmail-Konto anlegen
- [ ] Dort 2-Faktor-Authentifizierung aktivieren + neues App-Passwort erstellen
- [ ] `.env`-Datei mit neuen Zugangsdaten aktualisieren (`GMAIL_USER`, `GMAIL_APP_PASSWORD`)
- [ ] Testlauf mit neuem Konto wiederholen — prüfen, dass nur eigene Test-Mails als Task erscheinen

### Mittelfristig
- [ ] Automatisches, wiederkehrendes Polling einrichten (aktuell nur manueller Start über CMD) — z.B. Windows Task Scheduler, Intervall festlegen
- [ ] Einzelprozesse P_0XX pro Anliegen-Typ ausschreiben (Matrix verweist aktuell nur auf Platzhalter)
- [ ] Prozess-ID final vergeben (Kollision mit bestehendem P_023 beachten)
- [ ] Konfidenz-Schwellen pro Agent konkret festlegen (SEC-GATE-Feintuning)
- [ ] Zweiter Kanal-Adapter (WhatsApp) — zurückgestellt, da Twilio-Sandbox-Einrichtung nicht funktioniert hat; Alternative später prüfen
- [ ] Filter-Logik für E-Mail-Adapter überlegen (z.B. nur bestimmte Absender/Label), damit nicht jede beliebige Mail automatisch zum Task wird

### Für später (nicht Teil dieser Sitzung)
- Anbindung weiterer Kanäle
- Verknüpfung Kanal-Adapter → Hermes-Trigger (`rufeKIAn()`) — Datenbank-Insert steht, automatischer Klassifikations-Aufruf direkt danach noch zu verdrahten
