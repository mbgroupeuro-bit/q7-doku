---
Dokument: Q7_Freigabe_Rechte_Aufgaben
Version: 1.1
Datum: 2026-07-26
Status: Entwurf — Diskussionsstand, Admin-Freigabe ausstehend
Ersetzt: Q7_Freigabe_Rechte_Aufgaben_2026-07-25.md (v1.0)
Verwandte Datei: Q7_Sidebar_Struktur_2026-07-25_v2.md
---

# 1. Freigabe-Flow (Beispiel: Angebotserstellung via WhatsApp)

1. **Input** — Kunde sendet Anfrage über WhatsApp.
2. **Scan & Gate** — SEC-GATE-Prüfung auf Schadcode/Spam/Injection → Status sauber.
3. **Eingang** — Nachricht landet freigegeben in INPUT.
4. **Verteilung** — Koordinationsfunktion erkennt Kundenwunsch, erstellt interne Aufgabe an Fachagent (z.B. Vertrieb).
5. **Datenbeschaffung** — Fachagent greift auf ERP zu (Bestand, Preise, Lieferzeiten).
6. **Erstellung** — Fachagent generiert Ergebnis-Dokument, Ablage in OUTPUT.
7. **Fertigmeldung (gleichzeitig, automatisch)** —
   - **PROTOKOLL** erhält einen Eintrag mit Status „Fertig" (Ergebnis nachvollziehbar dokumentiert, inkl. Abteilung, Modell, Kosten, Zeit).
   - **MEINE AUFGABEN** erhält eine neue Aufgabe „Freigeben / Ergänzen / Optimieren", zugewiesen an den Admin (bzw. die laut Standing Order delegierte Rolle).
8. **Entscheidung:**
   - **Ohne aktive Standing Order:** Admin prüft die Aufgabe in MEINE AUFGABEN. Mögliche Reaktionen: Freigeben, Ergänzen, Optimieren (zurück an Fachagent).
   - **Mit aktiver Standing Order** (siehe Abschnitt 2): Versand erfolgt automatisch, ohne manuelle Freigabe, sofern der jeweilige Prozess dafür freigeschaltet ist.
9. **Versand** — Nach Freigabe (manuell oder automatisch): Auslieferung an Endkunde (WhatsApp/Mail).
10. **Abschluss-Protokollierung** — PROTOKOLL-Eintrag wird auf Status „Fertig versendet" aktualisiert.

**Grundsatz:** Es gibt keinen separaten Freigabe-Status innerhalb von OUTPUT. OUTPUT ist reines Archiv der generierten Ergebnisse (ansehen/herunterladen/teilen) — die Freigabe-Entscheidung selbst läuft ausschließlich über MEINE AUFGABEN, dokumentiert im PROTOKOLL. Finale Freigabe verbleibt beim Admin, sofern keine Standing Order aktiv ist (nicht-delegierbar laut Grundprinzip 9, außer per aktiver Standing Order — siehe Abschnitt 2).

**Ergänzende Admin-Bereiche** (`Agentenstruktur/00_Admin/`):
- `00_Admin_Prioritaet` — persönliche To-Dos/Eskalationen des Admin (Bezug: MEINE AUFGABEN in der Sidebar)
- `00_Admin_Archiv` — persönliche Ablage des Admin, getrennt vom System-Archiv (PROTOKOLL)

`00_Admin` bleibt für Agenten nicht zugänglich (weder Lese- noch Schreibzugriff) — rein menschliche Schnittstelle.

**Black-Box-Hinweis (Q7-M-Fund, 26.07.2026):** In UI-Flächen, die dem Lizenznehmer sichtbar sind (PROTOKOLL, STUDIO u.a.), dürfen zu keinem Zeitpunkt interne Agentencodes (A00–A14) oder deren Bezeichnungen (z.B. „SEC-GATE", „Harness Agent") im Klartext erscheinen — auch nicht in einer als „Admin-Ansicht" bezeichneten Fläche. Der Lizenznehmer sieht ausschließlich den Assistenten (Ebene-3-Name) sowie Klartext-Abteilungsnamen. Sichtbar bleibt zusätzlich nur der Modellname pro Agent (Master v1.2 Ausnahme, Grundprinzip 7).

---

# 2. Rechte-Delegation (Standing Orders)

## 2.1 Mechanismus
Die Koordinationsfunktion erkennt wiederkehrende, erfolgreich abgeschlossene Vorgänge und schlägt dem Admin proaktiv vor, die Freigabe zu delegieren (Beispiel: nach 20 erfolgreichen Angeboten).

## 2.2 Vorschlagsmuster (verbindlich für alle Vorschläge)
Jeder Vorschlag folgt zwingend vier Schritten:
1. Kontext benennen
2. Erkannten Bedarf benennen
3. Konkreten Vorschlag machen
4. Alternative offenlassen

Kein automatisches Ausführen ohne Bestätigung — auch nicht nach erreichter Vorschlagsreife.

## 2.3 Vorschlagsreife (ersetzt starre "Lernphase")
- Kein globales Lernphasen-Ende. Vorschlagsreife wird **pro Tätigkeitstyp** individuell erreicht, gemessen an Wiederholungshäufigkeit (z.B. 20 Vorgänge → Standing-Order-Vorschlag; 1x/Woche wiederkehrend → Studio-Aufnahme-Vorschlag).
- Bestätigungspflichtige Einzelklassifizierungen (z.B. INPUT→AUFGABEN) laufen ab Systemstart ohne Schwellenwert.
- Fehlvorschlag senkt das Vertrauen nur für die betroffene Tätigkeitsart (höherer Schwellenwert bei erneutem Vorschlag) — kein Reset anderer Bereiche.

## 2.4 Grenzen der Delegation
- Delegierbar: **Freigabe-Entscheidung** für definierte, wiederkehrende Tätigkeiten.
- Nicht delegierbar/änderbar durch Lizenznehmer: **A: Code**, **B: Doku** (L1–L8-Verfassung, Systemarchitektur).
- Änderbar durch Lizenznehmer (auf eigene Verantwortung): Sprachstil/Kommunikation, verwendete Dokumente (Ablage/Wissensbasis), Prozessauswahl.
- Werkseinstellungen sind jederzeit reaktivierbar (Reset-Funktion).

## 2.5 Rechteverwaltung ABLAGE
Ablage ist zweistufig organisiert (siehe reale UI, 26.07.2026):
- **Öffentliche Ablage (Intranet)** — für alle Mitarbeiter sichtbar, wird zusätzlich als Kontextquelle für allgemeine Mitarbeiterfragen genutzt.
- **Geschützte Ablage (nur Admin)** — ausschließlich für den Admin einsehbar.

Nur Admin darf hochladen/ändern. Verwaltung erfolgt unter **EINSTELLUNGEN → Ablage-Rechte**.

---

# 3. Aufgaben-Quellen (MEINE AUFGABEN)

| Quelle | Beschreibung |
|---|---|
| **Freigabe-Aufgaben** | System-generiert aus Agent-Ergebnissen (z.B. Angebot freigeben) — siehe Abschnitt 1, Schritt 7 |
| **Selbst eingetragene Aufgaben** | Lizenznehmer trägt manuell Aufgaben ein, ohne Agent-Bezug |
| **Kundenanfrage → Aufgabe** | Eingehende Nachricht erfordert menschliche Handlung (z.B. Rückruf-Wunsch). Koordinationsfunktion erkennt dies und schlägt Verschiebung von INPUT nach AUFGABEN vor — mit Bestätigungspflicht, kein Automatismus |

**Beispiel-Vorschlag (Muster aus Abschnitt 2.2):**
> "Frau Ehrlich hat heute angerufen und verlangt einen Rückruf. Soll ich diese Nachricht in Ihre Aufgabenliste verschieben? Oder haben Sie einen anderen Wunsch?"

Nach Bestätigung: Protokollierung der Entscheidung im PROTOKOLL-Audit-Log.

---

# 4. Offene Punkte

- Exakte UI-Verortung der Standing-Order-Verwaltung: vollständig in EINSTELLUNGEN, oder teilweise in AUFGABEN integriert.

---

**Änderungsprotokoll:**
- v1.0 (25.07.2026): Ausgangsfassung.
- v1.1 (26.07.2026): Abschnitt 1 (Freigabe-Flow) vollständig neu nach real bestätigtem PROTOKOLL+AUFGABEN-Modell (Admin-Bestätigung 26.07.2026) — alte physische Ordner-Pipeline (`03_OUTPUT/01_In_Arbeit`→`02_Zur_Freigabe`→`03_Freigegeben`, `00_Admin_Eingang`/`00_Admin_Freigaben`) ersetzt durch: Fertigmeldung erzeugt gleichzeitig PROTOKOLL-Eintrag „Fertig" + MEINE-AUFGABEN-Eintrag; Freigabe (manuell oder per Standing Order automatisch) führt zu PROTOKOLL-Status „Fertig versendet". Klarstellung ergänzt: OUTPUT ist reines Ergebnis-Archiv ohne eigenen Freigabe-Status. Black-Box-Hinweis ergänzt (Agentencode-Leak-Fund, Q7-M, 26.07.2026). Abschnitt 2.5 an reale Ablage-UI angepasst (2-Tab-Modell Öffentlich/Geschützt statt Pro-Datei-Einzelrechte). Terminologie „GF" → „Admin" durchgängig.
