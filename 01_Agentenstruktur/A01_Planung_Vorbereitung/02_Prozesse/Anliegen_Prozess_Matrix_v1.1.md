---
titel: Anliegen-Prozess-Matrix
dateityp: prozess-annex
agent: A01
version: 1.1
datum: 2026-09-12
status: Entwurf

copy_risiko: niedrig

symptome: []
ursachen_cluster: []
verknuepfte_agenten: [A02_Marketing, A03_Vertrieb, A04_PM, A05_QM, A06_Verwaltung, A07_Recht, A08_Finanzen, A13_Personal, A00_StabAgent]
verknuepfte_prozesse: [P_002_A01-Kanal-Intake-Klassifikation]
verknuepfte_experten: []

anliegen_typ: [Reklamation, Vertriebsanfrage, Support-Anfrage, Interne Aufgabe, Terminanfrage, Beschwerde-allgemein, Sonstiges]
konfidenz_schwelle: standard
rueckfrage_pflicht: siehe Einzelzeile
---

# Anliegen-Prozess-Matrix

## Zweck
Zentrale Nachschlage-Tabelle für A01: ordnet jedem erkannten Anliegen-Typ (Schritt 5.2.1 in P_002) den zuständigen Prozess, Ziel-Agenten, benötigte Wissensdateien und die Rückfrage-Regel zu. Wird bei jeder Klassifikation referenziert.

## Geltungsbereich
Gilt für alle über P_002 (Kanal-Intake-Klassifikation) eingehenden Tasks. Neue Anliegen-Typen werden hier erst nach Admin-Freigabe (siehe Anhang B der P_002-Datei) ergänzt.

## Matrix

| Anliegen-Typ | Prozess-ID | Ziel-Agent(en) | Benötigte Dateien/Wissen | Konfidenz-Schwelle | Rückfrage-Pflicht |
|---|---|---|---|---|---|
| Reklamation | offen | A05_QM | Reklamations-Richtlinie, Kunden-Auftragshistorie (Mandanten-DB) | Standard | Nein (nur 🔴) |
| Vertriebsanfrage | offen | A03_Vertrieb | Preisliste, Produktkatalog | Standard | Nein (nur 🔴) |
| Support-Anfrage | offen | A04_PM / A05_QM | Auftragsstatus, Projektakte (Mandanten-DB) | Standard | Nein (nur 🔴) |
| Interne Aufgabe | offen | variabel (Ursachen-Cluster prüfen) | je nach Ursache | Streng | Ja, bei Mehrdeutigkeit |
| Terminanfrage | offen | A03_Vertrieb | Kalenderverfügbarkeit | Standard | Nein |
| Beschwerde (allgemein) | offen | A05_QM / A00_StabAgent | Beschwerde-Leitfaden | Standard | Nein (nur 🔴) |
| Sonstiges | — | — | — | — | Ja (Kategorievorschlag) |

## Vernetzung — Kontext für A01
"Interne Aufgabe" hat bewusst keinen festen Ziel-Agenten: Anliegen wie "Marge zu gering" erfordern Prüfung mehrerer Ursachen-Cluster (Einkauf, Produktion, Marketing) über die Rückwärts-Verknüpfung in den jeweiligen Fach-Prozessdateien, nicht über diese Matrix direkt.

## Offene Punkte
- Prozess-IDs pro Zeile final vergeben, sobald jeweilige Einzelprozesse geschrieben sind (nutzt künftig das deterministische Prozessregister, siehe Register-Konzept)
- Konfidenz-Schwellen pro Zeile ggf. im Testlauf anpassen (SEC-GATE-Feintuning)

## Änderungshistorie
| Version | Datum | Änderung |
|---|---|---|
| 1.0 | 2026-07-30 | Erstfassung, Agent-Bezeichnung "A01_Hermes" |
| 1.1 | 2026-09-12 | Terminologie A01 (ohne Hermes-Suffix), Bezug zu P_002 (statt P_0XX) korrigiert |
