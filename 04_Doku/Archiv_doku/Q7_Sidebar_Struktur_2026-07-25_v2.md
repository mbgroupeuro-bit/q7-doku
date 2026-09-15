---
Dokument: Q7_Sidebar_Struktur
Datum: 2026-07-25
Status: Entwurf — Diskussionsstand, GF-Freigabe ausstehend
Ersetzt: Q7_Sidebar_Struktur_2026-07-25.md (v1) — Regel zur KI-Terminologie an Master-Dokument v1.2 angepasst
Verwandte Datei: Q7_Freigabe_Rechte_Aufgaben_2026-07-25.md, 00_Q7_MASTER.md (Änderungsvermerk v1.2, 23.07.2026)
---

# Sidebar-Struktur

Referenz: Screenshot Q7-App, White-Label-Beispiel "Tamza Assistent".

| Menüpunkt | Funktion | Bezug zu Q7-Architektur |
|---|---|---|
| **[Assistentenname]** (z.B. Tamza Assistent) | Sichtbare Identität des Systems für den Lizenznehmer | Black-Box-Prinzip: ein Assistent sichtbar, keine internen Agent-Namen (A00–A14) oder Prozess-IDs im UI |
| **INPUT** | Eingehende Kanäle (WhatsApp, E-Mail), Nachrichtenverlauf mit Kunden | Kanal-Grenzpunkt, TRESOR-/SEC-GATE-Prüfung am Eingang |
| **MEINE AUFGABEN** | Alle Handlungen, die der Lizenznehmer persönlich ausführen muss | Details siehe `Q7_Freigabe_Rechte_Aufgaben.md`, Abschnitt Aufgaben-Quellen |
| **KALENDER** | Rein informativ: Termine und Fristen | Kein Freigabe-/SLA-Bezug |
| **STUDIO** | Tools/Generatoren, mandantenspezifisch, mit Start-Funktion | Prozess-Ausführung, kartenbasiert |
| **SPACES** | Unterteilung nach Kunden, Projekten, Produkten, Abteilungen des Lizenznehmers | Mandanten-/Bereichstrennung |
| **OUTPUT** | Fertige Agenten-Ergebnisse (intern Q7) | Lizenznehmer entscheidet: weiterleiten, ansehen, oder freigeben → Assistent versendet an Kunden |
| **PROTOKOLL** | Vollständiges Audit-Log jeder internen Aktion | Historisch, abgeschlossene Vorgänge |
| **ABLAGE** | 1:1 identisch mit Kunden-Datenbank (C:), firmeninterne Daten (Verträge, Prozesse, Marken-IDs, Anträge wie Urlaub) — intranet-artig | Nur Admin darf hochladen/ändern; Rechteverwaltung siehe `Q7_Freigabe_Rechte_Aufgaben.md` |
| **EINSTELLUNGEN** | Zentrale Konfigurations- und Rechte-Rubrik | Details siehe `Q7_Freigabe_Rechte_Aufgaben.md` |

---

## Bindende Regel (aktualisiert, v2 — 25.07.2026)

Agent-Bezeichnungen (A00–A15) und Prozess-IDs dürfen an keiner Stelle im Lizenznehmer-UI erscheinen (Black-Box-Prinzip, siehe L1 Grundprinzip 1 / L3 Architekturprinzip 3).

**Ausnahme (Master-Dokument v1.2, 23.07.2026):** Der verwendete KI-Modellname (Klartext, z.B. "Claude Sonnet 5") wird pro Agent — mit Ausnahme von Hermes — bewusst sichtbar gemacht. Der Lizenznehmer kann das Modell selbst wechseln (z.B. Haiku → Opus bei Unzufriedenheit mit einem Ergebnis). Zusätzlich steht ein Budget-Modus zur Verfügung (Kunde gibt Wertvorstellung pro Ergebnis an, z.B. "1 € wert" — Hermes wählt das Modell innerhalb dieses Rahmens selbst).

**Begründung:** Modelltransparenz ist funktional notwendig, kein reines Komfort-Feature — ohne Kenntnis des verwendeten Modells kann der Lizenznehmer nicht gezielt hochstufen. Dies ist ein bewusster Flexibilitäts-Vorteil von Q7 gegenüber Wettbewerbern mit fest verdrahteter Modellwahl.

**Was weiterhin unsichtbar bleibt:** Agenten-Codes (A00–A14), Prozess-IDs, sowie jegliche interne KI-Terminologie (Prompt, Tokens, Context Window etc.). Sichtbar wird ausschließlich: Abteilungsname (Klartext) + Modellname.

---

## Offene Punkte
- SPACES: Detailliertes Zusammenspiel mit Multi-User-Architektur/SEC-GATE aus paralleler Session (20.07.2026) noch offen.
- Exakte UI-Verortung der Modell-Auswahl (in EINSTELLUNGEN pro Agent, oder direkt im OUTPUT-Bereich beim jeweiligen Ergebnis?) — noch nicht entschieden.

---

**Änderungsprotokoll:**
- v1.0 (25.07.2026): Ausgangsfassung.
- v2.0 (25.07.2026): Bindende Regel zur KI-Terminologie an Master-Dokument v1.2 (23.07.2026) angepasst — Modellname pro Agent (außer Hermes) jetzt bewusst sichtbar, Begründung ergänzt. Neuer offener Punkt: UI-Verortung der Modell-Auswahl.
