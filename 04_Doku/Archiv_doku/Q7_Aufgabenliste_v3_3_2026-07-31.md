---
Dokument: Q7_Aufgabenliste
Version: v3.3
Datum: 2026-07-31
Status: Aktiv — laufend erweitert
Zweck: Zentrale, konsolidierte Sammlung aller offenen/zukünftigen Punkte in Q7 (System + App)
Konsolidiert aus: Q7_Aufgabenliste.md (v2.4, 29.07.), Q7_Aufgabenliste_v2_2.md (26.07.), Q7_Maengel_Loesungsvorschlaege_v1_3 (Fragment), Q7_Maengelliste_2026-07-25.md (Fragment), Übergabe A01-Wissenslookup, Chat-Session 29.07.2026 (Wissenslookup 3-Quellen-Modell, A02-Rollenspiel), Sitzungsprotokoll_2026-07-31_Kanal-Intake.md (paralleler Chat, Kanal-Intake & Klassifikation, technische Umsetzung Prisma/Gmail-Adapter)
Konsolidierungs-Entscheidungen: siehe Änderungsprotokoll v3.0 am Dateiende (Q7-K-001 bis Q7-K-007)
Hinweis: Mängelregister (Q7-M-Nummern) ist unvollständig vorhanden (nur Q7-M-076-Fragment) — Hauptdatei Q7_Maengel_Loesungsvorschlaege_v1_2.md (75 Einträge) fehlt. Nicht integriert, siehe Abschnitt "Bekannte Lücken" am Ende.
---

# Q7 — Aufgabenliste (konsolidiert)

## A. Datenbank / Backend

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-001 | hoch | agenten_datenbank Schema | Tabellen aufgaben, aufgabe_chat, ergebnisse, protokoll final ausarbeiten und implementieren | In Arbeit — **Fortschritt 31.07.2026:** `aufgaben` + `aufgabe_chat` real angelegt via Prisma, verifiziert in Prisma Studio (leer, aber vorhanden). `ergebnisse` + `protokoll` weiterhin ausstehend |
| Q7-A-002 | mittel | ergebnisse-Versionierung | Klären: neue Zeile pro Chat-Runde (volle Historie) vs. nur aktuelle Version halten | Offen |
| Q7-A-004 | mittel | c_Q7_datenbank Umsetzung | Eine physische DB-Instanz mit zwei Schemas (lizenznehmer_datenbank/agenten_datenbank) oder zwei physisch getrennte DB-Server? | Teilweise geklärt (31.07.2026) — Technologie festgelegt: SQLite + Prisma als Abstraktionsschicht (Prisma v6, Downgrade von v7 wegen `url`-Syntax-Änderung in schema.prisma). Physische Trennung agenten_datenbank (`c_Q7_datenbank/02_Agenten_Datenbank/q7_agenten.db`) bestätigt real vorhanden. Frage "ein Server vs. zwei" damit faktisch beantwortet (zwei getrennte Dateien) |
| Q7-A-014 | hoch | Provider-Abstraktion rufeKIAn() | Jede KI-Anbindung ausschließlich über rufeKIAn() | **Erledigt 26.07.2026** — real implementiert (lib/rufeKIAn.ts), genutzt in app/api/chat/route.ts und app/api/compare/route.ts, keine direkten Provider-Aufrufe gefunden (findstr-Prüfung negativ) |
| Q7-A-015 | mittel | Q7-UI-011 | Kategorie-Struktur-Verstoß in app/ablage/page.tsx bzw. API-Routen lokalisieren und beheben | Offen |
| Q7-A-016 | niedrig | Vier-Ebenen-Modell / ROOT-Umbenennung | Nur angedacht, keine Entscheidung getroffen | Offen, nicht priorisiert |
| Q7-A-017 | niedrig | Wirksamkeitstest-Tool-Fehler | Artefakt lief lokal nicht — Ursache ungeklärt | Offen |
| Q7-A-042 | hoch | Lizenznehmer-individuelle Modellwahl fehlt | Q7_Modell_Zuteilung_v1_2.md beschreibt nur globale/statische Modellzuteilung via .env (OPENROUTER_MODEL_<KUERZEL>), gilt für alle Lizenznehmer gleich, änderbar nur per Code-Deployment. Widerspricht Master-Dokument v1.2 (23.07.): Lizenznehmer soll pro Agent (außer Hermes) das Modell selbst sehen und zur Laufzeit wechseln können (z.B. Haiku→Opus). Braucht zusätzliche Ebene (Modellwahl-Feld pro Lizenznehmer in lizenznehmer_datenbank), .env wird nur noch Fallback/Werkseinstellung. Auflösungsreihenfolge: Lizenznehmer-Wahl (DB) → OPENROUTER_MODEL_<KUERZEL> (Werkseinstellung) → OPENROUTER_MODEL (global) → Code-Fallback | Offen — technische Lücke identifiziert 25.07. *(Terminologie 29.07. korrigiert: Kunde→Lizenznehmer, gemäß Q7-K-005)* |
| Q7-A-067 | hoch | OUTPUT „+ Neu generieren"-Button entfernen | Button gehört laut Admin-Klärung (26.07.) nicht in OUTPUT — Ergebniserstellung läuft ausschließlich über Agent-Prozesse, nicht über manuellen Button in der Ergebnis-Archiv-Ansicht | Offen — *(neu vergeben 29.07., ursprünglich Q7-A-044 in v2_2, siehe Q7-K-001)* |
| Q7-A-068 | hoch | Sidebar Badge-Feldnamen/Branding verifizieren | Sidebar.tsx (26.07.) nutzt angenommene Store-Felder (`ungeleseneInputs`, `offeneAufgaben`) für Badge-Zähler — gegen reales `store.tsx`-Schema verifizieren/anpassen. Branding-Werte („Tamza Assistent", Avatar) sind hartkodiert, müssen an Lizenznehmer-Konfiguration angebunden werden | Offen — *(neu vergeben 29.07., ursprünglich Q7-A-045 in v2_2, siehe Q7-K-001)* |
| Q7-A-069 | hoch | Bulk-Umbenennung Kunde→Lizenznehmer im Code | `mandantenDb.ts`: kunde_id→lizenznehmer_id, kunden_modellwahl→lizenznehmer_modellwahl, getModellwahlenFuerKunde→getModellwahlenFuerLizenznehmer. Vermutlich auch mandanten_schema.sql (Spaltennamen) sowie alle aufrufenden Stellen betroffen | Offen — Terminologie-Beschluss 29.07. (siehe Chat-Memory), Umsetzung ausstehend |

## B. Agenten / Wissen

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-005 | niedrig | A06–A13 | Agentenskelette ausbauen, loadAgentContext() implementieren | Verschoben auf dedizierte Session |
| Q7-A-006 | mittel | Wissen-Kategorien | Fixe Union-Types (WissenEintrag, types.ts) durch frei konfigurierbare Kategorien ersetzen | Offen |
| Q7-A-007 | niedrig | A15-Design-Agent | 3 Experten-Wissensdateien (Rand/Vignelli, Bringhurst, Lupton), Pfad A/B-Fork (Logo-Optimierung vs. Neu-Design) | Offene Detailfragen: Fork-Zuständigkeit, Briefing-Format, Text vs. Mockup-Output |
| Q7-A-008 | niedrig | P_023-Kollision | Zwei Dateien mit gleicher Prozess-ID | Ungeklärt |
| Q7-A-009 | niedrig | A14-Skills Case-Fehler | Datei A14_skills.md → A14_Skills.md umbenennen | Ungeklärt |
| Q7-A-010 | niedrig | A02-Abteilungsebene | Separate Dateien noch nicht in regeln.md zusammengeführt | Ungeklärt |
| Q7-A-018 | mittel | Wissensart-Unterscheidung | Theorie/Prozess/Praxis-Feld ins Wissensmodell (L7) und App übernehmen | Offen |
| Q7-A-019 | offen | Agenten-/Prozess-Erweiterungsmechanismus | A-Code global (A15, A16 …) vs. lizenznehmerspezifische Variante; Prüfkriterien für Hermes; Update-Review-Zyklus | Konzept besprochen, nicht spezifiziert |
| Q7-A-020 | sicherheitsrelevant | TRESOR-Filterung Per-Lizenznehmer-Memory-Datei | Klären, ob Memory-Datei den TRESOR-Klassen (K4_Personen etc.) unterliegt, vor/nach Cloud-Versand | Offen |
| Q7-A-021 | niedrig | Humanizer-Umsetzung | Ton-/Stilanweisung technisch in Hermes-Prompt-Logik umsetzen | Offen |
| Q7-A-022 | niedrig | Ton-Template-Set | Auswahloptionen für Tag-0-Onboarding definieren | Offen |
| Q7-A-023 | niedrig | Obsidian-Anwendungsfall | Wissensquelle (Lizenznehmer→Q7) oder Output-Ziel (Q7→Lizenznehmer)? | Offen |
| Q7-A-059 | mittel | Limbic-Map-Wissen verifizieren | Bestätigen, ob Expertenwissen zu "Limbic Map" real und strukturiert in b_Q7-doku vorliegt | Offen (29.07.2026) |

## C. UI / Sidebar / App

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-003 | mittel | Multi-User-Aufgabenliste | ziel_user_id, kalender_verknuepft, weitergeleitet_an in aufgaben-Tabelle | Zurückgestellt bis Multi-User-Layer ansteht |
| Q7-A-011 | niedrig | Sidebar-SPACES | Zusammenspiel SPACES mit Multi-User-Architektur/SEC-GATE | **Teilweise gelöst (26.07.)** — Zuordnungsprinzip konzeptionell geklärt (Objekt-Einzelrechte, Q7_Rollenmodell_Lizenznehmer_v0_1.md Abschnitt 3b). Technische Durchsetzungstiefe bleibt an Q7-A-024 gekoppelt *(Status korrigiert 29.07., siehe Q7-K-003)* |
| Q7-A-012 | niedrig | Standing-Order-UI | UI-Verortung: vollständig EINSTELLUNGEN oder teilweise AUFGABEN | Offen — siehe auch Q7-A-053 |
| Q7-A-013 | niedrig | Duplikate bereinigen | Sidebar-Struktur-Dateien (1)-Kopie; Freigabeflow/Freigabe_Rechte_Aufgaben inhaltlich überlappend | **Teilerledigt 26.07.2026** — (1)-Kopie gelöscht, inhaltliche Überlappung weiterhin zu prüfen |
| Q7-A-024 | bewusst zurückgestellt | Multi-User-Umsetzung (Code) | Gesamter Auth-Layer für mehrere Benutzer unterhalb Admin | Bewusst ans Ende der Entwicklung gestellt |
| Q7-A-025 | niedrig | Kurzbefehle *Q2–*Q7 | *Q1 bereits definiert (Kontext-Memory speichern) | Offen |
| Q7-A-044 | — | Agenten-Route Frontend | `app/agenten` existiert real, absichtlich nicht in Sidebar verlinkt (Black-Box-Prinzip) | Bestätigt korrekt 26.07.2026 — kein Handlungsbedarf |
| Q7-A-045 | niedrig | Kalender: 4 Ansichtsmodi | Aktuell nur Monatsansicht. Anforderung: Tag/Woche/Monat/Jahr | Offen (26.07.2026) |
| Q7-A-047 | hoch | Input → Inbox Rename systemweit | Sidebar-Label, q7-app.html, Code-Referenzen, Doku | Offen (29.07.2026) |
| Q7-A-048 | hoch | Inbox-Kanalerweiterung | Datenmodell erweitern auf WhatsApp, E-Mail, Facebook, Instagram, Telefon (manuell), Kommentar-Kanäle | Offen (29.07.2026) |
| Q7-A-049 | mittel | Manuelle Telefon-Erfassung in Inbox | Formular/Button für manuelle Anruf-Erfassung | Offen (29.07.2026) |
| Q7-A-050 | niedrig | Pin/Favorit-Funktion Inbox | Admin-Entscheidung im nächsten Änderungsdurchgang nötig | Offen (29.07.2026) |
| Q7-A-051 | hoch | Routing-Architektur bestätigen (Root Cause 404) | q7-app.html ist Mockup ohne echte Routen; a_Q7-code braucht echtes Next.js App-Routing. Fehlende page.tsx für /kalender, /aufgaben vermutete 404-Ursache | Offen (29.07.2026) |
| Q7-A-052 | — | q7-app.html als UI-SSOT festgehalten | Bestätigt bis neue Version vorliegt | Vermerk, kein Handlungsbedarf |
| Q7-A-053 | mittel | Delegation-Rubrik in Einstellungen | Neue Sidebar-Rubrik: Standing Orders verwalten, Schwellenwert, Testphase-Status | Offen (29.07.2026) |

## D. Support-/Feedback-Prozess (Lizenznehmer↔Q7-Team)

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-026 | offen | Support-Eingang Tool/Struktur | Zentraler Q7-Support-Eingang für Lizenznehmer-Meldungen | Offen |
| Q7-A-027 | offen | Support-Meldung Status-Sichtbarkeit | Status sichtbar machen (Backlog/Angebot raus/abgeschlossen) | Offen |
| Q7-A-028 | offen | Endkunde→Lizenznehmer-Prozess | Analoger Feedback-Prozess für Endkunden des Lizenznehmers | Offen |
| Q7-A-029 | niedrig | Finale Prozess-IDs P_0XX_A/B | Vergabe via Teil-C-Register (Kollisionsprüfung) | Offen |
| Q7-A-030 | niedrig | Feedback-Gate Referenzmerkmale | Merkmal-Liste für Hermes-Lernphase erweitern | Offen |
| Q7-A-031 | niedrig | Feedback-Gate Ablageort | Feedback_Log.md je Lizenznehmer — genauer Pfad noch festzulegen | Offen (Detail) |

## E. Externe Werkzeuge / Connectors

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-032 | offen | Envelope-Schema Connector-Input | Einheitliches Format { quelle, lizenznehmer, zeitstempel, typ, inhalt } | Offen |
| Q7-A-033 | sicherheitsrelevant | SEC-GATE für externe Connector-Daten | A14 prüft eingehende externe Daten vor Input-Ablage? | Offen |
| Q7-A-034 | sicherheitsrelevant | Verschlüsselung Connector-Zugangsdaten | integrationen.json aktuell Klartext-Platzhalter | Offen |
| Q7-A-035 | offen | Freigabestufe Schreibzugriffe extern | Schreibende Connector-Aktionen brauchen Freigabestufe analog A14 | Offen |
| Q7-A-036 | niedrig | E-Mail-Connector-Entscheidung | IMAP/SMTP vs. anbieterspezifische APIs | **Entschieden & getestet (31.07.2026)** — IMAP-Polling via `imapflow`+`mailparser` (Gmail), Datei `a_Q7-code/scripts/poll-gmail.js`. Testlauf erfolgreich: liest ungelesene Mails, erzeugt normalisierten Task in `aufgaben` (status=OFFEN), markiert Mail gelesen. Noch offen: dediziertes Geschäftskonto + Filter-Logik, siehe Q7-A-087/090 |
| Q7-A-037 | niedrig | Rate-Limits/Webhook vs. Polling | Pro Connector zu klären | Offen |
| Q7-A-038 | niedrig | L8-Verortung externe Anbindungen | Eigener L8-Abschnitt vs. Begleitdokument | Offen |

## F. Namenskonvention / Ordner-Bereinigung

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-039 | niedrig | Leerzeichen in Ordnernamen | Ersetzt durch Unterstriche | **Erledigt 26.07.2026** — per CMD ren umgesetzt, verifiziert |
| Q7-A-040 | niedrig | Versionsnummer Q7_Datenbank_Architektur.md | _v1-Suffix fehlte | **Erledigt 26.07.2026** — umbenannt |
| Q7-A-041 | mittel | Sidebar-Doku veraltet | Widerspruch zu Master-Dokument v1.2 (Modellname sichtbar) | **Erledigt (25.07.)** — v2 der Sidebar-Doku behandelt das bereits korrekt *(Status korrigiert 29.07., siehe Q7-K-002)* |

## G. A01 Hermes (Tamza) — Orchestrierung, Prozess-Befolgung & Delegation

Auslöser: Blind-Vergleich identischer Prompt ("Limbic-Map-Analyse Küchenhersteller") an Q7 vs. ChatGPT. Q7-Antwort blieb generisch → Hinweis auf fehlende Arbeitsweise-Regelung für A01.

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-054 | hoch | A01-Prozess-Befolgungs-Architektur (V3) | Root Cause: keine Regel, die A01 zwingt, vorhandenes Wissen vor Antwort abzugleichen. Architektur V3 (Hybrid): Code ermittelt deterministisch passende Quelle(n) → lädt Inhalt via rufeKIAn() → Modell antwortet auf Basis geladenen Textes. Verworfen: V1 (hardcoded), V2 (reines Prompt-Following) | Offen — als P_xxx-Prozessdokument auszuarbeiten |
| Q7-A-055 | mittel | Themen-Zuordnung Anfrage→Quelle (Matching) | Keyword-/Kategorie-Matching vs. semantische Suche (Embedding/ChromaDB, Odysseus-Referenz) vs. Frontmatter-Tags | Offen — *siehe auch Q7-A-073* |
| Q7-A-056 | mittel | Fallback bei fehlendem Treffer | Generische Antwort vs. Rückfrage vs. generisch+Kennzeichnung im PROTOKOLL | Offen — *siehe auch Q7-A-074* |
| Q7-A-057 | hoch | A01 Code-Isolation | Eigene Modulstruktur `lib/agents/a01-hermes/{router.ts, prozessLoader.ts, orchestrator.ts, types.ts}`. rufeKIAn.ts bleibt zentral | Offen |
| Q7-A-058 | mittel | Ist-Zustand-Prüfung A01-Code | Prüfen, ob A01-Logik bereits verstreut liegt oder noch nicht existiert | Offen — *siehe auch Q7-A-081 (Testfall-Empfehlung)* |
| Q7-A-060 | hoch | Gemeinsamer A01-Router für Chat + Inbox | Beide Eingangskanäle müssen auf denselben zentralen Router treffen | Offen |
| Q7-A-061 | hoch | Inbox-Einsortierung: Standing-Order-Lernlogik | Admin entscheidet initial manuell, Tamza lernt Muster, spätere Delegation möglich | Offen — Schwellenwert-Definition pro Nachrichtentyp offen |
| Q7-A-062 | mittel | Proaktive Delegations-Empfehlung durch Tamza | Vorschlag bei Schwellenwert, inkl. Testphasen-Angebot | Offen |
| Q7-A-063 | hoch | 3-Stufen-Verarbeitungsmodell A01 | Stufe A "Prozessgeführt", Stufe B "Musterbasiert", Stufe C "Interpretationsbedürftig" | Offen — ergänzt Q7-A-054 |
| Q7-A-064 | mittel | Onboarding-Mechanismus für Prozesse (Stufe A) | Chat-Dialog natürlicher Sprache vs. eigene UI-Eingabemaske | Offen |
| Q7-A-065 | niedrig | Mindestliste erkennbarer Muster (Stufe B) | Generelle Regel vs. definierte Mindestliste | Offen |
| Q7-A-066 | mittel | Ausführungsverhalten Stufe C nach Rückbestätigung | Wartet Tamza auf explizite Bestätigung, oder ist Rückmeldung informativ? | Offen |

## H. Wissenslookup 3-Quellen-Modell (Chat-Session 29.07.2026, Vertiefung von Q7-A-054)

Kontext: A01 soll vor Fachagenten-Weiterleitung bis zu 3 Quellen durchsuchen — Leitfaden (ehem. "Framework"), Expertenwissen, Ablage. Terminologie "Framework" am 29.07. final durch "Leitfaden" ersetzt.

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-070 | hoch | Leitfaden-Definition & Speicherort | Leitfaden = Vorlagen/Richtlinien, die ein Fachagent bei Erstellungs-Aufgaben konsultiert (nicht allgemeines Architekturwissen). Speicherort im Dateisystem noch offen: zentral (`05_Leitfaeden`) vs. verteilt pro Agent vs. bereits vorhanden unter anderem Namen (Reality-Check nötig) | Offen (29.07.2026) |
| Q7-A-071 | mittel | Abgrenzung Leitfaden vs. Expertenwissen im Matching | Leitfaden = Struktur/Format (WIE erstellen) + nur bei Erstellungs-Trigger relevant; Expertenwissen = Fachinhalt (WAS wissen), auch bei reinen Antwort-Prompts. **Speicherort (29.07.2026 entschieden):** Leitfaden, Expertenwissen und Praxiswissen liegen gemeinsam im selben "Wissen"-Ordner, keine getrennten Verzeichnisse — Unterscheidung erfolgt inhaltlich/per Tag, nicht per Speicherort | **Speicherort geklärt (29.07.2026)** — Matching-Logik (welches Tag/Kriterium) weiterhin offen |
| Q7-A-072 | hoch | Ablage als 3. Wissensquelle — Scope & Rechteprüfungs-Interface | Ablage = Ort, wo Admin (Solo-Unternehmer) eigene Firmenunterlagen hochlädt (Logo, Markenidentität u.ä. — nicht abschließend definiert). Da Solo-Startszenario keine Mehrnutzer-Rechteprüfung braucht, empfohlen: Ablage jetzt als Quelle integrieren, Code-Schnittstelle so bauen, dass Rechteprüfung später (Mitarbeiter-Ausbau) eingehängt werden kann, ohne Umbau | Offen — Admin-Bestätigung zur Empfehlung sowie genaue inhaltliche Abgrenzung (nur CI-Material vs. alle Firmendokumente) noch ausstehend |
| Q7-A-073 | mittel | Matching-Mechanik Wissenslookup | Zentrale Keyword-Map vs. Frontmatter-Tags (SSOT-treuer) vs. Hybrid | Offen — Duplikat/Vertiefung von Q7-A-055 |
| Q7-A-074 | mittel | Fallback bei Kein-Treffer (Wissenslookup) | Generische Antwort vs. Stopp+Rückfrage vs. generisch mit PROTOKOLL-Kennzeichnung | Offen — Duplikat/Vertiefung von Q7-A-056 |
| Q7-A-075 | mittel | Pfad-Scope Expertenwissen | Nur A01-eigener Prozessordner vs. gesamte b_Q7-doku vs. A01-Ordner + freigegebene Unterordner | Offen |
| Q7-A-076 | mittel | Modul-Architektur wissenslookup.ts | 1 Modul mit 3 internen Funktionen vs. 3 separate Module (`_leitfaden.ts`/`_expertenwissen.ts`/`_ablage.ts`) — hängt von Q7-A-072 ab | Offen |
| Q7-A-077 | mittel | Terminologie-Konflikt SYSTEM-PROMPT "Q7-System-Evolution-Agent" | Eingespielter Fremd-SYSTEM-PROMPT verwendet durchgängig "GF" statt "Admin" sowie abweichende Code-Formate (A05-QM, H-01, 11SC-01). Klären: fehlerhafte Altversion, bewusst getrennter Kontext, oder teilweise verwertbar? | Offen — Terminologie-Teil bereits klar (immer Admin), Status des restlichen Prompts ungeklärt |
| Q7-A-078 | niedrig | 3-Stufen-Validierungsmodell aus Fremd-SYSTEM-PROMPT | Pflichtfelder/Format/KI-Plausibilität-Prüfkette mit 15-Min-SLA. Empfehlung: verwerfen, bestehender Freigabe-Flow (PROTOKOLL+AUFGABEN, v1.1) deckt das bereits ab | Offen, Empfehlung noch nicht admin-bestätigt |
| Q7-A-079 | niedrig | Prüfkriterium Phase 5/Schritt 10 ("A01 oder QM") | Aus 8-Phasen/16-Schritte-Gesamtprozess-Tabelle — Kriterium für Zuordnung ungeklärt, zusätzlich: welche Rolle hat "QM" im Agentenmodell A00–A14 (kein QM-Agent dokumentiert)? | Offen, reine Rückfrage an Admin |
| Q7-A-080 | — | Zuordnung `02_Operative_Sicherheit`-Ordner | Realer Ordner in c_Q7_datenbank/01_Mandanten_Datenbank/ (Screenshot 29.07. bestätigt) — Admin-Entscheidung: gehört zum SEC-GATE-Thema, aktuell nur Ordnergerüst ohne Inhalt | **Geklärt (29.07.2026)** — Vermerk, kein Handlungsbedarf bis Multi-User-Ausbau |
| Q7-A-081 | mittel | Root-Cause-Detail Limbic-Map-Fall | Empfehlung: Testfall (identischer Prompt) erneut auslösen, aktuelles A01-Verhalten live beobachten statt alte Logs zu rekonstruieren | Offen — Duplikat/Vertiefung von Q7-A-058 |

## I. Erkenntnisse aus Rollenspiel-Testlauf A02 Marketing (Chat-Session 29.07.2026)

Kontext: Simulierter Ablauf A01→A02 (Zielgruppenanalyse/Content-Erstellung Mr. Kouzina) mit realen A02-Dateien und Fachbibliotheken (Häusel, Werbetext-Schablonen, Werbetext-Praxis) durchgespielt. Ablauf wurde manuell vom Admin orchestriert (Dateien nacheinander bereitgestellt) — bestätigt, dass Fachagent bei vollständigem Kontext korrekt arbeitet, zeigt aber nicht, ob A01 dieselbe Quellen-Auswahl selbstständig träfe.

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-082 | hoch | Lizenznehmer-Memory-Bereich | Neue Tabelle `lizenznehmer_memory` innerhalb `lizenznehmer_datenbank` (getrennt von Ablage) für KI-erschlossenen Kontext über den Lizenznehmer (im Unterschied zu manuell hochgeladener Ablage). Entscheidungen: nur A01 schreibt zentral (Fachagenten liefern Vorschläge, A01 konsolidiert); wird wie Ablage automatisch bei jedem A01-Prozess mitgeladen (gemeinsame Quelle mit Ablage, zwei Unterarten: hochgeladen vs. gelernt); TRESOR-Klassifizierung (K1–K4) zwingend, gleiche Regel wie Q7-A-020 | Offen (29.07.2026) — Architektur-Entscheidung getroffen, technische Umsetzung aussteht. Abhängigkeit: Q7-A-072 (Ablage-Integration), Q7-A-020 (TRESOR-Filterung) |
| Q7-A-083 | mittel | Fallback bei fehlendem Ablage-Pflichtinhalt | Im Testlauf: Wissenslookup vollständig erfolgreich, Prozess eindeutig identifiziert — aber Pflichtdaten in der Ablage (Brand Assets, G2-Vorbedingung) fehlten. Anderer Fehlertyp als "keine Quelle gefunden" (Q7-A-056/074): Quelle existiert, Pflichtinhalt darin fehlt. Klären: prüft A01 das vorab (vor Delegation an Fachagenten), oder meldet der Fachagent es wie im Testlauf selbst zurück? | Offen (29.07.2026) — noch keine Entscheidung, nur im Testlauf beobachtet |
| Q7-A-084 | mittel | A02-Dateien-Korrektur (Terminologie & Pfade) | Alle 4 A02-Abteilungsdateien (Regeln, Guardrails, Entscheidungsprinzipien, Wissensbasis, Stand 19.06.2026/"Q7-System v19.0") verstoßen gegen aktuelle Konventionen: "GF" statt "Admin" (durchgängig), "Kunde" statt "Lizenznehmer" (durchgängig), veralteter Pfad `04_TRESOR` (R02), veraltete Ordner-Pipeline `03_OUTPUT/01_In_Arbeit` (R05, widerspricht Freigabe-Flow v1.1), Rolle "A05_QM" ungeklärt (kein QM-Agent im aktuellen A00–A14-Modell dokumentiert, vgl. Q7-A-079) | Offen (29.07.2026) — für Rollenspiel bewusst im Ist-Zustand belassen, Korrektur zurückgestellt |

---

## J. Kanal-Intake & Klassifikation A01-Hermes (Parallel-Session 31.07.2026)

Quelle: Sitzungsprotokoll_2026-07-31_Kanal-Intake.md. Direkte Vertiefung/Umsetzung von Q7-A-060/061/063 (Abschnitt G). 6-Schritte-Ablauf definiert: Eingang → Kanal-Adapter → Aufnahme Input → Hermes-Trigger → Klassifikation → Weiterleitung.

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-085 | hoch | Konfidenz-Logik Klassifikation | 🟢 eindeutig (direktes Routing) / 🟡 unsicher (Verständnis-Rückmeldung an Admin) / 🔴 mehrdeutig (Rückfrage-Pflicht an Admin). Verständnis-Rückmeldung geht an Admin, nie an externen Absender (Black-Box-Prinzip bleibt nach außen gewahrt) | **Konzept entschieden 31.07.2026**, technische Verdrahtung offen — siehe Q7-A-091 |
| Q7-A-086 | hoch | Anliegen-Typ Kategorisierungsmodell | Option C gewählt: feste Kategorie-Liste (Reklamation, Vertriebsanfrage, Support-Anfrage, Interne Aufgabe, Terminanfrage, Beschwerde allgemein, Sonstiges) + Hermes schlägt bei "Sonstiges" neue Kategorie vor, Admin bestätigt (kontrolliertes Wachstum). Rückwärts-Verknüpfung über Metadaten-Tags (`symptome`, `ursachen_cluster`, `verknuepfte_agenten`) statt starrer 1:1-Zuordnung | **Entschieden 31.07.2026**, Dokumente abgelegt (siehe unten) |
| Q7-A-087 | hoch | Neues Geschäfts-Gmail-Konto einrichten | Aktuelles Testkonto (`mbgroupeuro@gmail.com`) enthält Newsletter-/Werbe-Rauschen, wird fälschlich als Task erfasst. Schritte: Konto anlegen, 2FA aktivieren, neues App-Passwort, `.env` aktualisieren (`GMAIL_USER`, `GMAIL_APP_PASSWORD`), Testlauf wiederholen | Offen (31.07.2026) — kurzfristig priorisiert |
| Q7-A-088 | mittel | Automatisches wiederkehrendes Polling | Aktuell nur manueller Start über CMD — Windows Task Scheduler o.ä., Intervall festlegen | Offen (31.07.2026) |
| Q7-A-089 | mittel | Einzelprozesse P_0XX pro Anliegen-Typ ausschreiben | `Anliegen_Prozess_Matrix.md` verweist aktuell nur auf Platzhalter, keine ausformulierten Prozesse | Offen (31.07.2026) — Prozess-ID-Vergabe kollisionsprüfen, vgl. Q7-A-008 (P_023-Kollision) |
| Q7-A-090 | mittel | Filter-Logik E-Mail-Adapter | Verhindern, dass jede beliebige Mail (Spam/Newsletter) automatisch zum Task wird — z.B. nur bestimmte Absender/Label zulassen | Offen (31.07.2026) |
| Q7-A-091 | hoch | Kanal-Adapter → Hermes-Trigger Verdrahtung | Datenbank-Insert (poll-gmail.js) steht, automatischer Klassifikations-Aufruf (`rufeKIAn()`) direkt danach noch zu verdrahten — verbindet Q7-A-085 technisch mit dem realen Adapter | Offen (31.07.2026) |
| Q7-A-092 | niedrig | WhatsApp-Kanal-Adapter | Zurückgestellt — Twilio-Sandbox-Einrichtung nicht funktioniert, Alternative später prüfen | Offen, zurückgestellt (31.07.2026) — Detailpunkt zu Q7-A-048 |
| Q7-A-093 | mittel | Konfidenz-Schwellen pro Agent konkret festlegen | Grundsatzentscheidung bereits getroffen: Schwelle ist pro Agent individuell einstellbar (nicht global) — konkrete Werte pro Agent noch offen (SEC-GATE-Feintuning) | Offen (31.07.2026) — vgl. Q7-A-033 |
| Q7-A-094 | — | Mehrdeutigkeits-Grundsatz | Entschieden: ein Ziel-Agent pro Task als Standard, Sub-Task-Split nur als bewusste Admin-Ausnahme | **Entschieden 31.07.2026**, kein Handlungsbedarf |

**Neue Dokumente (real abgelegt 31.07.2026):**
| Datei | Speicherort |
|---|---|
| `P_0XX_A01_Kanal-Intake-Klassifikation_v1.0.md` | `b_Q7-doku/01_Agentenstruktur/A01-Planung_Vorbereitung/02_Hermes_Prozesse/` (Prozess-ID noch Platzhalter, Kollisionsprüfung gegen P_023 offen) |
| `Anliegen_Prozess_Matrix.md` | `b_Q7-doku/01_Agentenstruktur/A01-Planung_Vorbereitung/02_Hermes_Prozesse/` (bisher nur Platzhalter je Anliegen-Typ, Einzelprozesse P_0XX noch auszuschreiben) |
| `Metadaten_VORLAGE.md` | `b_Q7-doku/04_Doku/` — YAML-Frontmatter-Vorlage für Wissens-/Prozessdateien-Vernetzung (Tags: symptome, ursachen_cluster, verknuepfte_agenten) |

| Q7-A-095 | hoch | Gmail-Konto-Wechsel & Newsletter-Rauschen | Test-Konto erfasst aktuell jede ungelesene Mail als Task (Newsletter-Rauschen). Dediziertes Geschäfts-Gmail-Konto separat einrichten, 2FA + neues App-Passwort, `.env` aktualisieren, Testlauf wiederholen; danach Filter-Logik (Absender/Label statt gesamter Posteingang) | Offen (31.07.2026) |
| Q7-A-096 | mittel | Automatisches Polling statt manuellem Start | `scripts/poll-gmail.js` aktuell nur manuell via `node -r dotenv/config` gestartet — wiederkehrendes Polling einrichten (z.B. Windows Task Scheduler) | Offen (31.07.2026) |
| Q7-A-097 | hoch | Verdrahtung Kanal-Adapter → Hermes-Trigger | DB-Insert-Teil fertig, automatischer Klassifikations-Aufruf (rufeKIAn() direkt nach Insert) noch nicht verdrahtet | Offen (31.07.2026) — Kernstück für Schritt 4/5 des 6-Schritte-Ablaufs |

---

## Bereits erledigt/entschieden (zur Nachvollziehbarkeit, nicht gelöscht)

| Punkt | Datum | Kurzstatus |
|---|---|---|
| Q7-UI-013 (Kontextmenü Chat-Umbenennen/Löschen) | 19.07. | Abgeschlossen, lokal getestet |
| Chat-Historie, Terminologie-Cleanup, Upload-Funktion | 20.07. | Stabil |
| 01_Q7_ARCHITECTURE.md — alle 10 Punkte | 20.07. | Vollständig |
| Ordnerstruktur verifiziert | 19.07. | Bestätigt |
| Konflikt Q7_MASTER Grundprinzip 9 vs. "Cloud zuerst" | 19.07. | Aufgelöst, v1.1 |
| Visueller Workflow-/Agent-Builder | 20.07. | Final verworfen (gilt für alle Sessions) |
| Humanizer-Grundkonzept (kein separater Gate/Call) | 20.07. | Entschieden, Umsetzung siehe Q7-A-021 |
| Kunden-Feedback-Gate Grundprozess + P_0XX_A/B | 23.07. | Ausformuliert, siehe Abschnitt D |
| c_Q7_datenbank Split | 25.07. | Entschieden, siehe Q7_Datenbank_Architektur.md |
| Q7-M-076 (Agentenmodell 5 vs. 6 Dateien) | 25.07. | Gelöst, L6 auf v1.5 |
| Q7-A-046 (07_DOKU-Pfadreferenzen korrigiert) | 25.07. | Alle 62 Fundstellen korrigiert, verifiziert 0 verbleibende Treffer |
| Q7-A-014 (Provider-Abstraktion rufeKIAn()) | 26.07. | Real implementiert und verifiziert |
| Q7-A-039, Q7-A-040 (Ordnerbereinigung/Versionssuffix) | 26.07. | Per CMD umgesetzt, verifiziert |
| Q7-A-013 (Duplikate) | 26.07. | Teilerledigt |
| Q7-A-044 (Agenten-Route Frontend) | 26.07. | Bestätigt korrekt, kein Handlungsbedarf |
| TRESOR-Verbleib (Ablagestruktur) | 26.07. | Gelöst — verteilt auf 06_Sicherheit + c_Q7_datenbank |
| Q7-Rollenmodell-Lizenznehmer (Konzept) | 26.07. | Erstellt, 06_Sicherheit/Q7_Rollenmodell_Lizenznehmer_v0_1.md |
| Q7_Freigabe_Rechte_Aufgaben Freigabe-Flow | 26.07. | v1.1 — PROTOKOLL+AUFGABEN-Modell |
| Q7-M-077 (Agentencode-Leak PROTOKOLL/STUDIO) | 26.07. | Entschieden V1 — Klartext statt Agentencode |
| Q7-A-041 (Sidebar-Doku Modellname-Sichtbarkeit) | 25.07. | v2 der Sidebar-Doku behandelt das bereits korrekt *(29.07. Status-Konflikt bereinigt)* |
| Q7-A-011 (Sidebar-SPACES ↔ SEC-GATE) | 26.07. | Teilweise gelöst — Objekt-Einzelrechte konzeptionell geklärt *(29.07. Status-Konflikt bereinigt)* |
| Q7-M-016 (Freigabeinstanz Systemstruktur-Änderungen) | 26.07. | Admin-Alleinentscheidung, mehrstufiges Modell entfällt, v1.1 |
| Terminologie GF→Admin | 26.07. | Systemweit bindend, keine Ausnahme |
| Terminologie Kunde→Lizenznehmer | 29.07. | Systemweit bindend, keine Ausnahme (Code-Umsetzung siehe Q7-A-069) |
| Q7-A-080 (02_Operative_Sicherheit-Zuordnung) | 29.07. | Geklärt — SEC-GATE-Platzhalter |

---

## Bekannte Lücken (Reality-First-Hinweis)

- **Mängelregister unvollständig:** Nur Q7-M-076 (Fortschreibung v1.3) und ein veralteter Entwurf mit Platzhalter-ID vorliegend. Hauptdatei `Q7_Maengel_Loesungsvorschlaege_v1_2.md` (75 Einträge, u.a. auch Q7-M-077/078 dort referenziert) fehlt — für vollständige Konsolidierung nachreichen.
- **Q7-A-055/073, Q7-A-056/074, Q7-A-058/081** sind bewusst als Duplikate/Vertiefungspaare stehen gelassen (Abschnitt G = ursprüngliche Formulierung, Abschnitt H = Chat-Vertiefung 29.07.) — bei Bearbeitung zusammenführen, nicht doppelt abarbeiten.

---


Nachtrag vom Admin: manuell eingegeben: 01.08.2026 wir brauchen für später eine Funktion über q7 damit der Mitarbeiter zb. Azubi mit anderen kommunizieren kann wie eine art Unternehmens Chat. diese Funktion ist nicht in der Standard ausgabe vorhanden, weil es dort nur eine Person gibt. aber wenn mehrere Mitglieder eines Unternehmens es benutzen müssen diesee auch untereinder kommunizieren können. 





## Hinweis
Neue Einträge erhalten fortlaufende Q7-A-Nummer. Bei Umsetzung: Status aktualisieren, nicht löschen.

**Änderungsprotokoll:**
- v1.0–v2.3: siehe Vorgängerdateien (Q7_Aufgabenliste.md, Q7_Aufgabenliste_v2_2.md)
- v2.4 (29.07.2026): Abschnitt G (Q7-A-054–066) und C-Erweiterung (Q7-A-047–053) sowie B-Erweiterung (Q7-A-059) ergänzt.
- **v3.0 (29.07.2026): Vollkonsolidierung aller vorliegenden Aufgabenlisten-Versionen.** Entscheidungen (Q7-K-001 bis Q7-K-007, alle nach Admin-Empfehlung übernommen):
  - K-001: Verlorene Einträge aus v2_2 (OUTPUT-Button, Sidebar-Badge-Verifikation) als neue IDs Q7-A-067/068 re-integriert (alte Nummern 044/045 behalten ihre aktuelle Bedeutung aus v2.4)
  - K-002: Q7-A-041 Status auf "Erledigt (25.07.)" korrigiert (war in v2.4 fälschlich "Offen")
  - K-003: Q7-A-011 Status auf "Teilweise gelöst (26.07.)" korrigiert (war in v2.4 fälschlich "Offen")
  - K-004: Mängelregister nicht integriert (Hauptdatei fehlt), als bekannte Lücke vermerkt
  - K-005: Terminologie "Kunde"→"Lizenznehmer" durchgängig korrigiert (u.a. Q7-A-042, Q7-A-032)
  - K-006: Neue Chat-Erkenntnisse (Wissenslookup 3-Quellen-Modell) als Q7-A-069 bis Q7-A-081 in neuem Abschnitt H aufgenommen, fortlaufende Nummerierung
  - K-007: Neue Hauptversion/Dateiname vergeben (v3.0) statt Überschreiben
- v3.1 (29.07.2026): Neuer Abschnitt I ergänzt — Erkenntnisse aus A02-Marketing-Rollenspiel-Testlauf (Mr. Kouzina, Zielgruppenanalyse/Content-Erstellung). Neue Einträge: Q7-A-082 (Lizenznehmer-Memory-Bereich, Architektur bereits entschieden per F-018a–d), Q7-A-083 (Fallback bei fehlendem Ablage-Pflichtinhalt, offen), Q7-A-084 (A02-Dateien-Korrektur Terminologie/Pfade, zurückgestellt für Rollenspiel-Ist-Zustand).
- v3.2 (31.07.2026): Parallel-Session "Kanal-Intake & Klassifikation A01-Hermes" eingearbeitet (neuer Abschnitt J, Q7-A-085–094). Bestehende Einträge mit realem Umsetzungsstand aktualisiert: Q7-A-001 (Tabellen aufgaben/aufgabe_chat real via Prisma angelegt), Q7-A-004 (Technologie SQLite+Prisma festgelegt, physische Trennung bestätigt), Q7-A-036 (E-Mail-Connector entschieden & getestet: IMAP/imapflow, Gmail).
- v3.3 (31.07.2026): Inhalt von Abschnitt J gegen offiziellen Kontext-Handoff (`Q7_kontext_handoff_2026_07_31.md`) verifiziert — keine Widersprüche gefunden. Drei neue Einträge ergänzt, die im Handoff enthalten, zuvor aber nicht aufgenommen waren: Q7-A-095 (Gmail-Konto-Wechsel/Newsletter-Filter), Q7-A-096 (automatisches Polling), Q7-A-097 (Verdrahtung Kanal-Adapter→Hermes-Trigger, aktuell fehlendes Kernstück des 6-Schritte-Ablaufs).
