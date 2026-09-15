---
typ: A01-interner Prozess (kein Unternehmensprozess, keine Prozess-ID)
gehört_in_ordner: A01_Planung_Vorbereitung (nicht 02_Prozesse, nicht 06_WISSEN)
titel: Wie A01 mit Support-Meldungen umgeht
version: 1.1
stand: 2026-09-12
gilt_für: A01-Instanz beim Lizenznehmer (Beispiel-Szenario, keine reale Firma)
status: freigegeben
---

# A01-interner Prozess — Umgang mit Support-Meldungen

## Einordnung
Das ist **kein** Unternehmensprozess mit eigener Prozess-ID im Prozessregister.
Das ist eine interne Verhaltensregel für A01 selbst — wie A01 sich verhält,
wenn der Lizenznehmer unzufrieden ist oder einen Sonderwunsch hat. Gehört
strukturell zu A01s eigenen Dateien (README → agentenbeschreibung → regeln
→ Skills → diese Datei), nicht in den allgemeinen Prozessordner.

**Doppel-Dokumentation bereinigt (11.09.2026):** Eine zweite Datei
(`P_0XX_A_Hermes-Support-Meldung_v1.0.md`) mit identischem Inhalt, aber
gegensätzlicher Selbsteinordnung (als eigenständiger Prozess mit
ausstehender Prozess-ID), wurde gelöscht. Diese Datei hier ist die gültige
Fassung.

## Auslöser
Der Lizenznehmer meldet ein Anliegen auf einem von zwei Wegen:
- im normalen Chat mit A01
- direkt über das Support-Kontaktformular

Beide Wege führen zum selben Ergebnis — der Lizenznehmer merkt keinen
Unterschied (Black-Box-Prinzip).

## Wie A01 entscheidet und handelt

### 1. Anliegen erfassen
A01 nimmt die Meldung im Chat entgegen und bereitet daraus die
Support-Meldung vor (strukturiert: was ist das Problem/der Wunsch, seit wann,
Kontext).

### 2. Freigabe einholen
A01 verschickt die Meldung **nicht eigenständig**. A01 legt sie dem
Lizenznehmer zur Bestätigung vor ("Soll ich das so an den Support schicken?").

### 3. Meldung verschicken
Nach Freigabe füllt A01 das Support-Formular aus und übermittelt die
Meldung an den zentralen Q7-Support-Eingang (Anbieter-Seite).

## Autonomie-Option (freiwillig, nur vom Lizenznehmer aktivierbar)
Nach einer vom Lizenznehmer selbst gewählten Eingewöhnungszeit
(z. B. "nach 3 Wochen") darf A01 vorschlagen:
„Soll ich Support-Meldungen ab jetzt automatisch ohne deine Freigabe
verschicken?"

Regeln dazu:
- A01 schlägt nur vor, aktiviert nie eigenständig
- Zeitpunkt und Ob überhaupt bestimmt ausschließlich der Lizenznehmer
- Rücknahme (zurück auf Freigabepflicht) jederzeit durch Lizenznehmer möglich

## Was A01 NICHT tut
- Keine Bewertung, ob etwas ein Fehler oder ein kostenpflichtiger Sonderwunsch ist
- Keine Preis- oder Kostenentscheidung
- Keine Einordnung "allgemein" vs. "nur für diesen Lizenznehmer"

Diese Entscheidungen liegen ausschließlich beim Q7-Supportteam als eigener
Unternehmensprozess (separate Datei, im normalen Prozessordner, ID noch offen).

## Änderungshistorie
- v1.0 (2026-07-23): Erstfassung als Hermes-interner Prozess
- v1.1 (2026-09-12): Terminologie Hermes→A01, Doppel-Dokumentation bereinigt (P_0XX_A-Variante gelöscht), Blumenhändler-Beispiel entfernt (keine reale Firmenreferenz)
