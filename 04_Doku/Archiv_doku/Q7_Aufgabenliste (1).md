---
Dokument: Q7_Aufgabenliste
Datum: 2026-07-29
Status: Aktiv — laufend erweitert
Zweck: Zentrale Sammlung aller offenen/zukünftigen Punkte in Q7 (System + App), sortiert nach ID und Priorität
Konsolidiert aus: Q7_Backlog_Konsolidiert_23072026.md, Q7_Backlog_Ergaenzung_20072026.md, Q7_Externe_Werkzeuge_Architektur.md (18.07.), Doku_Entscheidungsprotokoll_Support-Feedback_2026-07-23.md, P_0XX_B_Q7-Supportteam-Bearbeitung_v1.0.md, Q7_Aufgabenliste v2.3 (26.07.), sowie Chat-Session 29.07.2026 (Inbox-Redesign, A01/Tamza-Orchestrierung, Delegation)
Hinweis: Q7-M-Nummern (Mängelregister) sind ein separates Register (Q7_Maengel_Loesungsvorschlaege) und werden hier nicht dupliziert, außer sie erzeugen einen offenen Folgepunkt.
---

# Q7 — Aufgabenliste

| Q7-A-042 | hoch | Kundenindividuelle Modellwahl fehlt | Q7_Modell_Zuteilung_v1_2.md beschreibt nur globale/statische Modellzuteilung via .env (OPENROUTER_MODEL_<KUERZEL>), gilt für alle Kunden gleich, änderbar nur per Code-Deployment. Widerspricht Master-Dokument v1.2 (23.07.): Lizenznehmer soll pro Agent (außer Hermes) das Modell selbst sehen und zur Laufzeit wechseln können (z.B. Haiku→Opus). Braucht zusätzliche mandantenspezifische Ebene (z.B. Modellwahl-Feld pro Kunde in mandanten_datenbank), .env-Variable wird nur noch Fallback/Werkseinstellung. Neue Auflösungsreihenfolge: Kunden-Wahl (DB) → OPENROUTER_MODEL_<KUERZEL> (Werkseinstellung) → OPENROUTER_MODEL (global) → Code-Fallback | Offen — technische Lücke identifiziert 25.07. |

## A. Datenbank / Backend

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-001 | hoch | agenten_datenbank Schema | Tabellen aufgaben, aufgabe_chat, ergebnisse, protokoll final ausarbeiten und implementieren | In Arbeit |
| Q7-A-002 | mittel | ergebnisse-Versionierung | Klären: neue Zeile pro Chat-Runde (volle Historie) vs. nur aktuelle Version halten | Offen |
| Q7-A-004 | mittel | c_Q7_datenbank Umsetzung | Technische Entscheidung: eine physische DB-Instanz mit zwei Schemas (mandanten_datenbank/agenten_datenbank) oder zwei physisch getrennte DB-Server? | Offen |
| Q7-A-014 | hoch | Provider-Abstraktion rufeKIAn() | Bauen/verifizieren, dass jede KI-Anbindung in q7-app_code ausschließlich über rufeKIAn() läuft (Voraussetzung für Cloud→Local-Ableitung) | **Erledigt 26.07.2026** — real implementiert (lib/rufeKIAn.ts), genutzt in app/api/chat/route.ts und app/api/compare/route.ts, keine direkten/verstreuten Provider-Aufrufe im Code gefunden (findstr-Prüfung negativ) |
| Q7-A-015 | mittel | Q7-UI-011 | Kategorie-Struktur-Verstoß in app/ablage/page.tsx bzw. zugehörigen API-Routen lokalisieren und beheben | Offen |
| Q7-A-016 | offen/niedrig | Vier-Ebenen-Modell / ROOT-Umbenennung | Nur angedacht, keine Entscheidung getroffen | Offen, nicht priorisiert |
| Q7-A-017 | niedrig | Wirksamkeitstest-Tool-Fehler | Artefakt lief lokal nicht — Ursache ungeklärt | Offen |

## B. Agenten / Wissen

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-005 | niedrig | A06–A13 | Agentenskelette ausbauen, loadAgentContext() implementieren | Verschoben auf dedizierte Session |
| Q7-A-006 | mittel | Wissen-Kategorien | Wissen-Seite: fixe Union-Types (WissenEintrag, types.ts) durch frei konfigurierbare Kategorien ersetzen (analog wissenKategorien) | Offen |
| Q7-A-007 | niedrig | A15-Design-Agent | 3 Experten-Wissensdateien (Rand/Vignelli, Bringhurst, Lupton), Pfad A/B-Fork (Logo-Optimierung vs. Neu-Design) | Offene Detailfragen: Fork-Zuständigkeit, Briefing-Format, Text vs. Mockup-Output |
| Q7-A-008 | niedrig | P_023-Kollision | Zwei Dateien mit gleicher Prozess-ID (P_023_A01_DNA-NeukundenGate_v1.1.md, P_023_A01_Kunden-Gespraech-Wunsch_v2.0.md) | Ungeklärt |
| Q7-A-009 | niedrig | A14-Skills Case-Fehler | Datei A14_skills.md → A14_Skills.md umbenennen | Ungeklärt |
| Q7-A-010 | niedrig | A02-Abteilungsebene | Separate Dateien (entscheidungsprinzipien/guardrails/regeln_abteilung) noch nicht in regeln.md zusammengeführt (beschlossene Vereinheitlichung) | Ungeklärt |
| Q7-A-018 | mittel | Wissensart-Unterscheidung | Theorie/Prozess/Praxis-Feld ins Wissensmodell (L7) und App übernehmen (Erkenntnis aus Blind-A/B-Test Mr. Kouzina) | Offen |
| Q7-A-019 | offen | Agenten-/Prozess-Erweiterungsmechanismus | A-Code global (A15, A16 …) vs. kundenspezifische Variante; Prüfkriterien für Hermes; Update-Review-Zyklus (fest/ad hoc) | Konzept besprochen, nicht spezifiziert |
| Q7-A-020 | offen, sicherheitsrelevant | TRESOR-Filterung Per-Kunde-Memory-Datei | Klären, ob Memory-Datei (05_UNTERNEHMEN/KD_.../) den TRESOR-Klassen (K4_Personen etc.) unterliegt, vor/nach Cloud-Versand | Offen |
| Q7-A-021 | niedrig | Humanizer-Umsetzung | Ton-/Stilanweisung technisch in Hermes-Prompt-Logik umsetzen (Konzept bereits entschieden: kein separater Gate/Call) | Offen |
| Q7-A-022 | niedrig | Ton-Template-Set | Auswahloptionen für Tag-0-Onboarding definieren (z.B. locker/familiär, sachlich/professionell, herzlich/persönlich) | Offen |
| Q7-A-023 | niedrig, nicht priorisiert | Obsidian-Anwendungsfall | Konkretisieren: Wissensquelle (Kunde→Q7) oder Output-Ziel (Q7→Kunde)? Technik bereits geprüft (Datei-Sync oder Live-REST-Plugin) | Offen |
| Q7-A-059 | mittel | Limbic-Map-Wissen verifizieren | Bestätigen, ob Expertenwissen zu "Limbic Map" real und strukturiert in b_Q7-doku vorliegt — Grundannahme aus Root-Cause-Analyse Q7-A-054, noch nicht real geprüft | Neu, offen (29.07.2026) |

## F. Namenskonvention / Ordner-Bereinigung

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-039 | niedrig | Leerzeichen in Ordnernamen | b_Q7-doku/04_Doku: "Archiv Unternehmenssystem Versionen" → Archiv_Unternehmenssystem_Versionen, "Erfahrungen aus den Testläufen" → Erfahrungen_aus_den_Testlaeufen (Leerzeichen durch _ ersetzt) | **Erledigt 26.07.2026** — per CMD ren umgesetzt, verifiziert |
| Q7-A-040 | niedrig | Versionsnummer Q7_Datenbank_Architektur.md | In 04_Doku/Infrastruktur fehlte _v1-Suffix im Vergleich zu den 10 anderen Begleitdokumenten dort | **Erledigt 26.07.2026** — umbenannt zu Q7_Datenbank_Architektur_v1.md |

| Q7-A-041 | mittel | Sidebar-Doku veraltet | Q7_Sidebar_Struktur_2026-07-25.md sagt "keine KI-Terminologie im UI" — widerspricht Master-Dokument v1.2 (23.07.), das Modellname pro Agent (außer Hermes) bewusst sichtbar macht (Flexibilitäts-Vorteil: Kunde kann Modell selbst hochstufen, z.B. Haiku→Opus). Sidebar-Doku muss entsprechend angepasst werden | Offen |

## C. UI / Sidebar / App

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-011 | niedrig | Sidebar-SPACES | Zusammenspiel SPACES mit Multi-User-Architektur/SEC-GATE noch offen | Offen |
| Q7-A-012 | niedrig | Standing-Order-UI | Exakte UI-Verortung: vollständig in EINSTELLUNGEN, oder teilweise in AUFGABEN integriert | Offen — siehe auch Q7-A-053 (Delegation-Rubrik) |
| Q7-A-013 | niedrig | Duplikate bereinigen | Q7_Sidebar_Struktur_2026-07-25.md und (1)-Kopie identisch; Q7_Sidebar_Freigabeflow_Rechte/Q7_Freigabe_Rechte_Aufgaben inhaltlich überlappend | **Teilerledigt 26.07.2026** — (1)-Kopie von Q7_Freigabe_Rechte_Aufgaben gelöscht. Inhaltliche Überlappung Sidebar-Freigabeflow/Freigabe_Rechte_Aufgaben weiterhin zu prüfen |
| Q7-A-003 | mittel | Multi-User-Aufgabenliste | ziel_user_id, kalender_verknuepft, weitergeleitet_an in aufgaben-Tabelle — Mitarbeiter-Aufgabenlisten (nicht nur Admin), Weiterleitung an Kollegen/Assistent | Zurückgestellt bis Multi-User-Layer ansteht |
| Q7-A-024 | bewusst zurückgestellt | Multi-User-Umsetzung (Code) | Gesamter Auth-Layer für mehrere Benutzer unterhalb Admin | Bewusst ans Ende der Entwicklung gestellt |
| Q7-A-025 | niedrig | Kurzbefehle *Q2–*Q7 | *Q1 bereits definiert (Kontext-Memory speichern), Q2–Q7 noch offen | Offen |
| Q7-A-044 | — | Agenten-Route Frontend | Prüfung: `app/agenten` existiert real im Code, ist absichtlich nicht mehr in Sidebar verlinkt (Black-Box-Prinzip, siehe Sidebar.tsx-Kommentar) | Bestätigt korrekt 26.07.2026 — kein Handlungsbedarf |
| Q7-A-045 | niedrig | Kalender: 4 Ansichtsmodi | Aktuell nur Monatsansicht implementiert. Anforderung: Tagesansicht, Wochenansicht, Monatsansicht (vorhanden), Jahresansicht | Neu, offen (26.07.2026) |
| Q7-A-047 | hoch | Input → Inbox Rename systemweit | "Input" wird zu "Inbox" umbenannt: Sidebar-Label, q7-app.html (Nav-Label + Protokoll-Dept-Label "Input · Omnichannel"), Code-Referenzen, Doku. Grund: Input wird konzeptuell zum zentralen Kommunikations-Postfach (nicht mehr reine Datei-Eingangsliste) | Neu, offen (29.07.2026) |
| Q7-A-048 | hoch | Inbox-Kanalerweiterung | Datenmodell in q7-app.html/Code aktuell hart auf `channel: 'wa'\|'mail'` begrenzt. Erweitern auf: WhatsApp, E-Mail, Facebook, Instagram, Telefon (manuell), zzgl. Kommentar-Kanäle (Google/YouTube/FB-Kommentare). Filter-Tabs entsprechend ergänzen | Neu, offen (29.07.2026) |
| Q7-A-049 | mittel | Manuelle Telefon-Erfassung in Inbox | Formular/Button, mit dem Mitarbeiter (z.B. Sekretärin) einen Anruf manuell als Inbox-Eintrag erfassen kann — Feldstruktur (Wer hat angerufen? Betreff? Notiz?) noch zu definieren | Neu, offen (29.07.2026) |
| Q7-A-050 | niedrig | Pin/Favorit-Funktion Inbox | Aus Referenzbild (inbox_1.png, macOS-Mail-Client) übernommen oder verworfen? Admin-Entscheidung im nächsten Änderungsdurchgang nötig | Neu, offen (29.07.2026) |
| Q7-A-051 | hoch | Routing-Architektur bestätigen (Root Cause 404) | q7-app.html ist Single-Page-Mockup (View-Switch per JS, keine echten Routen). Für a_Q7-code gilt: echtes Next.js App-Routing (eigene page.tsx je Sidebar-Sektion) — beratungsseitig empfohlen (SSOT-konform, natives Deep-Linking/Browser-Navigation, 404 sofort lokalisierbar). Fehlende page.tsx für /kalender und /aufgaben ist die vermutete Ursache des aktuellen 404-Fehlers | Neu, offen (29.07.2026) — Admin-Entscheidung zur Architektur ausstehend, Root-Cause-Verifizierung im Code noch offen |
| Q7-A-052 | — | q7-app.html als UI-SSOT festgehalten | q7-app.html als alleinige, aktuelle UI-Spezifikationsquelle bestätigt (29.07., bis neue Version vorliegt) | Vermerk, kein Handlungsbedarf |
| Q7-A-053 | mittel | Delegation-Rubrik in Einstellungen | Neue Sidebar-Rubrik unter EINSTELLUNGEN: "Delegation". Übersicht aller Delegationen (Standing Orders), Erteilen/Verändern/Zurücknehmen/Pausieren, Schwellenwert-Einstellung, Status "Testphase" (siehe Q7-A-062), Historie/Nachvollziehbarkeit (Bezug PROTOKOLL). Klärungsbedarf: Rubrik nur für A01/Tamza oder generisch für alle Agenten mit künftig delegierbaren Aufgaben? | Neu, offen (29.07.2026) |

## D. Support-/Feedback-Prozess (Lizenznehmer↔Q7-Team)

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-026 | offen | Support-Eingang Tool/Struktur | Konkretes Tool/Ordnerstruktur für zentralen Q7-Support-Eingang (Sammelpunkt aller Lizenznehmer-Meldungen) | Offen |
| Q7-A-027 | offen | Support-Meldung Status-Sichtbarkeit | Wie wird Status einer Meldung sichtbar (Backlog/Angebot raus/abgeschlossen)? | Offen |
| Q7-A-028 | offen | Endkunde→Lizenznehmer-Prozess | Analoger Feedback-Prozess für Endkunden, die sich beim Lizenznehmer melden (z.B. Müllers eigene Kunden) — noch nicht ausgearbeitet, nur Lizenznehmer→Anbieter (P_0XX_A/B) bisher fertig | Offen |
| Q7-A-029 | niedrig | Finale Prozess-IDs P_0XX_A/B | Vergabe via Teil-C-Register (Kollisionsprüfung, z.B. wie P_023) | Offen |
| Q7-A-030 | niedrig | Kunden-Feedback-Gate Referenzmerkmale | Merkmal-Liste für Hermes-Lernphase (Pfad A Fehler vs. Pfad B Zusatzwunsch) erweitern | Offen |
| Q7-A-031 | niedrig | Kunden-Feedback-Gate Ablageort | Feedback_Log.md je Lizenznehmer/Kunde (Speicherort-Grundsatz entschieden 23.07.) — genauer Pfad innerhalb KD_[Nr]_[Name]/ noch festzulegen | Offen (Detail) |

## E. Externe Werkzeuge / Connectors (Konzeptdokument 18.07., noch nicht umgesetzt)

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-032 | offen | Envelope-Schema Connector-Input | Einheitliches Format für alle Connectors, z.B. { quelle, kunde, zeitstempel, typ, inhalt } | Offen |
| Q7-A-033 | offen, sicherheitsrelevant | SEC-GATE für externe Connector-Daten | Klären, ob/wie A14 eingehende externe Daten prüft, bevor sie im Input landen | Offen |
| Q7-A-034 | offen, sicherheitsrelevant | Verschlüsselung Connector-Zugangsdaten | integrationen.json aktuell nur Konzept-Platzhalter im Klartext — Verschlüsselungsmechanismus fehlt noch | Offen |
| Q7-A-035 | offen | Freigabestufe Schreibzugriffe extern | Schreibende Connector-Aktionen (z.B. Rechnung automatisch in DATEV anlegen) brauchen Freigabestufe analog A14-Prinzip | Offen |
| Q7-A-036 | niedrig | E-Mail-Connector-Entscheidung | Universeller IMAP/SMTP-Weg vs. anbieterspezifische APIs (Gmail/Graph) | Offen |
| Q7-A-037 | niedrig | Rate-Limits/Webhook vs. Polling/Consent | Pro Connector zu klären (Meta-Systeme bevorzugen Webhooks, Consent-Fluss pro Kunde) | Offen |
| Q7-A-038 | niedrig | L8-Verortung externe Anbindungen | Bei nächster L1–L8-Überarbeitung: eigener L8-Abschnitt vs. eigenständiges Begleitdokument in 04_Doku/Infrastruktur/ | Offen |

## G. A01 Hermes (Tamza) — Orchestrierung, Prozess-Befolgung & Delegation (Session 29.07.2026)

Auslöser: Blind-Vergleich identischer Prompt ("Limbic-Map-Analyse Küchenhersteller") an Q7 vs. ChatGPT. Q7-Antwort blieb generisch, obwohl Expertenwissen vermutlich in b_Q7-doku vorliegt (siehe Q7-A-059) → Hinweis auf fehlende Arbeitsweise-Regelung für A01.

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-054 | hoch | A01-Prozess-Befolgungs-Architektur (V3) | Root Cause generischer Antworten: keine Regel, die A01 zwingt, vorhandenes Prozess-/Expertenwissen vor Antwort abzugleichen. Empfohlene Architektur (V3, Hybrid): Code ermittelt deterministisch passende Prozessdatei aus A01-Prozessordner (Themen-Matching) → lädt Inhalt in Modell-Kontext via rufeKIAn() → Modell befolgt geladenen Prozesstext. SSOT-konform, hält Prinzip "Agenten klein/stabil, Prozesse unabhängig entwickelbar" ein. Verworfen: V1 (hardcoded im Code, verletzt SSOT), V2 (reines Prompt-Following, nachweislich unzuverlässig) | Neu, offen (29.07.2026) — als P_xxx-Prozessdokument auszuarbeiten |
| Q7-A-055 | mittel | Themen-Zuordnung Anfrage→Prozessdatei | Entscheidung offen: simples Keyword-/Kategorie-Matching vs. semantische Suche (Embedding/ChromaDB, analog Odysseus-Referenzprojekt, P_016.5) | Neu, offen (29.07.2026) |
| Q7-A-056 | mittel | Fallback bei fehlendem Prozess-Treffer | Verhalten definieren: generische Modellantwort zulassen vs. Rückfrage an Admin/Nutzer, falls kein passender Prozess im Ordner gefunden wird | Neu, offen (29.07.2026) |
| Q7-A-057 | hoch | A01 Code-Isolation | Eigene, klar abgegrenzte Modulstruktur für A01 statt Vermischung mit anderem Code (Single Point of Failure, alle Anfragen laufen durch ihn): lib/agents/a01-hermes/{router.ts, prozessLoader.ts, orchestrator.ts, types.ts}. rufeKIAn.ts bleibt bewusst zentral/getrennt (von allen Agenten genutzt) | Neu, offen (29.07.2026) |
| Q7-A-058 | mittel | Ist-Zustand-Prüfung A01-Code | Prüfen, ob A01-Logik bereits verstreut in route_chat.ts o.ä. liegt (Refactoring) oder noch nicht existiert (Neubau) — Voraussetzung für Aufwandseinschätzung Q7-A-057 | Neu, offen (29.07.2026) |
| Q7-A-060 | hoch | Gemeinsamer A01-Router für Chat + Inbox | Beide Eingangskanäle (direkte Chat-Anfrage synchron; Inbox-Nachrichten aus E-Mail/WhatsApp/FB/Instagram/Kommentare/Telefon-manuell) müssen auf denselben zentralen A01-Router (router.ts) treffen, damit Prozess-Lade-Logik (Q7-A-054) konsistent bleibt | Neu, offen (29.07.2026) |
| Q7-A-061 | hoch | Inbox-Einsortierung: Standing-Order-Lernlogik | Workflow bestätigt: Admin entscheidet initial manuell pro Inbox-Nachricht (→ Aufgabe / → Termin Kalender / → Antwort / → sonstige Aktion). Tamza beobachtet Entscheidungen und lernt Muster (bestehendes Standing-Order-Prinzip: Delegation pro Aktivitätstyp nach Nutzungsschwelle). Admin kann Einsortierungs-Aufgabe später an Tamza delegieren. Abgrenzung bestätigt: betrifft nur operative Einsortierung, nicht die Freigabe-Struktur (PROTOKOLL+AUFGABEN-Flow) und nicht die non-delegable Admin-Letztentscheidung (Grundprinzip 9/Q7-M-016) | Neu, offen (29.07.2026) — Schwellenwert-Definition pro Nachrichtentyp noch offen |
| Q7-A-062 | mittel | Proaktive Delegations-Empfehlung durch Tamza | Tamza darf bei erreichtem Schwellenwert proaktiv Delegation vorschlagen (nicht automatisch aktivieren), inkl. Testphasen-Angebot (Beispiel-Wortlaut: "Ich bin bereit, [Aktivität] selbstständig zu erledigen. Wenn du möchtest, können wir das für die nächste Woche testen."). Nach Testphase: erneute Abfrage (dauerhaft übernehmen / verlängern / zurück zu manuell). Status "Testphase" ergänzt Delegation-Rubrik (Q7-A-053) | Neu, offen (29.07.2026) — offen: wo erscheint Empfehlung zuerst (Chat/Meine Aufgaben/Delegation-Rubrik), Testzeitraum admin-frei oder Systemvorgabe, Freigabepflicht pro Einzelfall während Testphase oder vollautonom |
| Q7-A-063 | hoch | 3-Stufen-Verarbeitungsmodell A01 | Konzept aus drei Beispielfällen abgeleitet: Stufe A "Prozessgeführt" (Admin hat Prozess onboardet, Tamza folgt ohne Rückfrage — z.B. Bestandskunden-Bestellung per E-Mail), Stufe B "Musterbasiert" (eindeutig erkennbare Nachrichtenart ohne Prozessdatei, direkte Einsortierung — z.B. "ruf mich an" → Aufgabe), Stufe C "Interpretationsbedürftig" (offene/komplexe Anfrage, Tamza bestätigt Verständnis vor Handeln und lernt aus Korrektur — z.B. "Erstelle mir ein Angebot..."). Als zentrales Konzept auszuarbeiten, ergänzt Q7-A-054 | Neu, offen (29.07.2026) |
| Q7-A-064 | mittel | Onboarding-Mechanismus für Prozesse (Stufe A) | Klären, wie ein interner Prozess praktisch an Tamza übergeben wird: im Chat-Dialog in natürlicher Sprache (Tamza generiert daraus Prozessdatei) vs. eigene UI-Eingabemaske (z.B. im Studio-Bereich) | Neu, offen (29.07.2026) |
| Q7-A-065 | niedrig | Mindestliste erkennbarer Muster (Stufe B) | Prüfen, ob "eindeutiges Muster" als generelle Regel genügt oder eine definierte Mindestliste musterbasierter Fälle (z.B. "ruf mich an" → Aufgabe, "wann habt ihr offen" → automatische Antwort) separat onboardet werden muss | Neu, offen (29.07.2026) |
| Q7-A-066 | mittel | Ausführungsverhalten Stufe C nach Rückbestätigung | Klären: Wartet Tamza nach Verständnis-Rückmeldung ("Ok, ich habe verstanden...") auf explizite Admin-Bestätigung, bevor er handelt (Blocker), oder ist die Rückmeldung rein informativ und die Ausführung startet direkt? | Neu, offen (29.07.2026) |

---

## Bereits erledigt/entschieden (zur Nachvollziehbarkeit, nicht gelöscht)

| Punkt | Datum | Kurzstatus |
|---|---|---|
| Q7-UI-013 (Kontextmenü Chat-Umbenennen/Löschen) | 19.07. | Abgeschlossen, lokal getestet |
| Chat-Historie, Terminologie-Cleanup, Upload-Funktion | 20.07. | Stabil |
| 01_Q7_ARCHITECTURE.md — alle 10 Punkte | 20.07. | Vollständig |
| Ordnerstruktur D:\Q7\ verifiziert | 19.07. | Bestätigt |
| Konflikt Q7_MASTER Grundprinzip 9 vs. "Cloud zuerst" | 19.07. | Aufgelöst, v1.1 |
| Visueller Workflow-/Agent-Builder | 20.07. | Verworfen (Wettbewerbsanalyse) |
| Humanizer-Grundkonzept (kein separater Gate/Call) | 20.07. | Entschieden, Umsetzung siehe Q7-A-021 |
| Kunden-Feedback-Gate Grundprozess + zwei Prozessdateien (P_0XX_A/B) | 23.07. | Ausformuliert, Details siehe Abschnitt D |
| c_Q7_datenbank Split (mandanten_datenbank/agenten_datenbank) | 25.07. | Entschieden, siehe Q7_Datenbank_Architektur.md |
| Q7-M-076 (Agentenmodell 5 vs. 6 Dateien) | 25.07. | Gelöst, L6 auf v1.5 |
| Q7-A-046 (07_DOKU-Pfadreferenzen korrigiert) | 25.07. | Alle 62 Fundstellen (07_DOKU) in b_Q7-doku auf reale Struktur 04_Doku korrigiert (per PowerShell-Ersatz, verifiziert 0 verbleibende Treffer) |
| Q7-A-014 (Provider-Abstraktion rufeKIAn()) | 26.07. | Real implementiert und verifiziert, keine direkten Provider-Aufrufe im Code |
| Q7-A-039, Q7-A-040 (Ordnerbereinigung/Versionssuffix) | 26.07. | Per CMD umgesetzt, verifiziert |
| Q7-A-013 (Duplikate) | 26.07. | Teilerledigt — (1)-Kopie gelöscht, Sidebar-Überlappung weiterhin offen |
| Q7-A-044 (Agenten-Route Frontend) | 26.07. | Bestätigt korrekt, kein Handlungsbedarf |

---

## Hinweis
Neue Einträge erhalten fortlaufende Q7-A-Nummer. Bei Umsetzung: Status aktualisieren (z.B. "Erledigt", Datum ergänzen), nicht löschen — Liste bleibt vollständiger Verlauf.

**Änderungsprotokoll:**
- v1.0 (25.07.2026): Ausgangsfassung.
- v2.0 (25.07.2026): Konsolidiert mit Q7_Backlog_Konsolidiert_23072026.md, Q7_Backlog_Ergaenzung_20072026.md, Q7_Externe_Werkzeuge_Architektur.md, Support-Feedback-Prozess-Dokumenten. In fünf Themenblöcke (A–E) gegliedert, Abschnitt "Bereits erledigt" ergänzt.
- v2.1 (25.07.2026): Finale Version. Q7-A-031 bereinigt (kein offener Widerspruch mehr, Grundsatz vs. Detail-Pfad klar getrennt).
- v2.2 (26.07.2026): Q7-A-014 (rufeKIAn()) auf Erledigt gesetzt — real verifiziert per CMD-Prüfung (findstr), keine direkten Provider-Aufrufe gefunden. Q7-A-044 neu: Agenten-Route-Frontend geprüft und als korrekt bestätigt (kein Handlungsbedarf). Q7-A-045 neu: Kalender-Anforderung 4 Ansichtsmodi (Tag/Woche/Monat/Jahr), aktuell nur Monatsansicht vorhanden. IDs 043 nicht neu vergeben (Kollisionsrisiko mit vermuteter, nicht auffindbarer Vorversion) — Nummerierung ab 044 fortgesetzt.
- v2.3 (26.07.2026): Q7-A-039, Q7-A-040 erledigt (Ordnerbereinigung/Versionssuffix, per CMD verifiziert). Q7-A-013 teilerledigt (Duplikat gelöscht, inhaltliche Sidebar-Überlappung weiterhin offen).
- v2.4 (29.07.2026): Neuer Abschnitt G "A01 Hermes (Tamza) — Orchestrierung, Prozess-Befolgung & Delegation" mit Q7-A-054 bis Q7-A-066 (13 neue Punkte) aus Chat-Session zu Limbic-Map-Blindvergleich, Prozess-Befolgungs-Architektur, Code-Isolation, Inbox-Standing-Order-Lernlogik, Delegation-Empfehlungslogik, 3-Stufen-Verarbeitungsmodell. Abschnitt C erweitert um Q7-A-047 bis Q7-A-053 (7 neue Punkte) aus Inbox-Redesign-Diskussion (Rename Input→Inbox, Kanalerweiterung, Telefon-Erfassung, Pin/Favorit, Routing-Architektur/404-Root-Cause, q7-app.html als SSOT, Delegation-Rubrik). Abschnitt B erweitert um Q7-A-059 (Limbic-Map-Wissen verifizieren). Alle Punkte gemäß Chat-Anweisung nur notiert, keine Ausführung — Bearbeitung im nächsten Änderungsdurchgang.
