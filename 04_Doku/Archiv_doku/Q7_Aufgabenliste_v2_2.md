---
Dokument: Q7_Aufgabenliste
Datum: 2026-07-26
Status: Aktiv — laufend erweitert
Zweck: Zentrale Sammlung aller offenen/zukünftigen Punkte in Q7 (System + App), sortiert nach ID und Priorität
Konsolidiert aus: Q7_Backlog_Konsolidiert_23072026.md, Q7_Backlog_Ergaenzung_20072026.md, Q7_Externe_Werkzeuge_Architektur.md (18.07.), Doku_Entscheidungsprotokoll_Support-Feedback_2026-07-23.md, P_0XX_B_Q7-Supportteam-Bearbeitung_v1.0.md, sowie eigener Erstfassung 25.07.
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
| Q7-A-014 | hoch | Provider-Abstraktion rufeKIAn() | Bauen/verifizieren, dass jede KI-Anbindung in q7-app_code ausschließlich über rufeKIAn() läuft (Voraussetzung für Cloud→Local-Ableitung) | Offen — Umsetzungsstand unklar, prüfen |
| Q7-A-015 | mittel | Q7-UI-011 | Kategorie-Struktur-Verstoß in app/ablage/page.tsx bzw. zugehörigen API-Routen lokalisieren und beheben | Offen |
| Q7-A-016 | offen/niedrig | Vier-Ebenen-Modell / ROOT-Umbenennung | Nur angedacht, keine Entscheidung getroffen | Offen, nicht priorisiert |
| Q7-A-017 | niedrig | Wirksamkeitstest-Tool-Fehler | Artefakt lief lokal nicht — Ursache ungeklärt | Offen |
| Q7-A-045 | hoch | Sidebar Badge-Feldnamen/Branding | Neu gebaute Sidebar.tsx (26.07.) nutzt angenommene Store-Felder (`ungeleseneInputs`, `offeneAufgaben`) für Badge-Zähler — gegen reales `store.tsx`-Schema verifizieren/anpassen. Zusätzlich: Branding-Werte („Tamza Assistent", Avatar) sind hartkodiert, müssen an Mandantenkonfiguration angebunden werden | Offen — Entwurf bereitgestellt, Integration/Verifikation ausstehend |

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

## F. Namenskonvention / Ordner-Bereinigung

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-039 | niedrig | Leerzeichen in Ordnernamen | b_Q7-doku/04_Doku: "Archiv Unternehmenssystem Versionen" → Archiv_Unternehmenssystem_Versionen, "Erfahrungen aus den Testläufen" → Erfahrungen_aus_den_Testlaeufen (Leerzeichen durch _ ersetzen, Umlaut-Konvention klären) | Offen |
| Q7-A-040 | niedrig | Versionsnummer Q7_Datenbank_Architektur.md | In 04_Doku/Infrastruktur fehlt _v1-Suffix im Vergleich zu den 9 anderen Begleitdokumenten dort | **Erledigt (26.07., bestätigt per Terminal-Bestandsaufnahme)** — Datei heißt real bereits `Q7_Datenbank_Architektur_v1.md` |

| Q7-A-041 | mittel | Sidebar-Doku veraltet | Q7_Sidebar_Struktur_2026-07-25.md sagt "keine KI-Terminologie im UI" — widerspricht Master-Dokument v1.2 (23.07.), das Modellname pro Agent (außer Hermes) bewusst sichtbar macht (Flexibilitäts-Vorteil: Kunde kann Modell selbst hochstufen, z.B. Haiku→Opus). Sidebar-Doku muss entsprechend angepasst werden | **Erledigt (25.07.)** — v2 der Sidebar-Doku behandelt das bereits korrekt |

## C. UI / Sidebar / App

| ID | Priorität | Thema | Beschreibung | Status |
|---|---|---|---|---|
| Q7-A-011 | niedrig | Sidebar-SPACES | Zusammenspiel SPACES mit Multi-User-Architektur/SEC-GATE noch offen | **Teilweise gelöst (26.07.)** — Zuordnungsprinzip konzeptionell geklärt (Objekt-Einzelrechte, siehe Q7_Rollenmodell_Lizenznehmer_v0_1.md Abschnitt 3b: Space = Objekt wie jedes andere, Kein Zugriff/Lesen/Ändern pro Mitglied). Technische Durchsetzungstiefe (SEC-GATE-Isolation vs. UI-Filter) bleibt an Q7-A-024 gekoppelt |
| Q7-A-012 | niedrig | Standing-Order-UI | Exakte UI-Verortung: vollständig in EINSTELLUNGEN, oder teilweise in AUFGABEN integriert | Offen |
| Q7-A-013 | niedrig | Duplikate bereinigen | Q7_Sidebar_Struktur_2026-07-25.md und (1)-Kopie identisch; Q7_Sidebar_Freigabeflow_Rechte/Q7_Freigabe_Rechte_Aufgaben inhaltlich überlappend | Offen |
| Q7-A-003 | mittel | Multi-User-Aufgabenliste | ziel_user_id, kalender_verknuepft, weitergeleitet_an in aufgaben-Tabelle — Mitarbeiter-Aufgabenlisten (nicht nur Admin), Weiterleitung an Kollegen/Assistent | Zurückgestellt bis Multi-User-Layer ansteht |
| Q7-A-024 | bewusst zurückgestellt | Multi-User-Umsetzung (Code) | Gesamter Auth-Layer für mehrere Benutzer unterhalb Admin | Bewusst ans Ende der Entwicklung gestellt |
| Q7-A-025 | niedrig | Kurzbefehle *Q2–*Q7 | *Q1 bereits definiert (Kontext-Memory speichern), Q2–Q7 noch offen | Offen |
| Q7-A-043 | mittel | Kalender-Ansichtsmodi | Aktuelle View zeigt nur Monatsansicht. Admin-Anforderung (26.07.): zusätzlich Tages-, Wochen- und Jahresansicht | Offen — Anforderung 26.07. aufgenommen |
| Q7-A-044 | niedrig | OUTPUT „+ Neu generieren" entfernen | Button gehört laut Admin-Klärung (26.07.) nicht in OUTPUT — Ergebniserstellung läuft ausschließlich über Agent-Prozesse, nicht über manuellen Generieren-Button in der Ergebnis-Archiv-Ansicht | Offen — UI-Fix ausstehend |

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
| Q7-A-046 | erledigt | 07_DOKU-Pfadreferenzen korrigiert | Alle 62 Fundstellen (07_DOKU) in b_Q7-doku auf reale Struktur 04_Doku korrigiert (25.07., per PowerShell-Ersatz, verifiziert 0 verbleibende Treffer) | Erledigt 25.07.2026 |
| TRESOR-Verbleib (Ablagestruktur Punkt 1) | 26.07. | Gelöst — Inhalt verteilt auf `06_Sicherheit` (Rahmenbedingungen K1–K4) und `c_Q7_datenbank` (operative Rechteverwaltung), Ablagestruktur v1.0 erreicht |
| Q7-Rollenmodell-Lizenznehmer (Konzept) | 26.07. | Erstellt, `06_Sicherheit/Q7_Rollenmodell_Lizenznehmer_v0_1.md` — 4 Werksrollen, Default nur Admin aktiv, Freischaltungs-Workflow, Objekt-Einzelrechte, Namenskonvention Mitglied+Abteilung. Technische Umsetzung weiterhin an Q7-A-024 gekoppelt |
| Q7_Freigabe_Rechte_Aufgaben Freigabe-Flow | 26.07. | Neu gefasst auf v1.1 — PROTOKOLL+AUFGABEN-Modell statt alte Ordner-Pipeline (03_OUTPUT/01_In_Arbeit etc.), OUTPUT als reines Ergebnis-Archiv klargestellt |
| Sidebar.tsx — Meine Aufgaben + Kalender ergänzt | 26.07. | Entwurf bereitgestellt (siehe Q7-A-045 für Verifikation/Integration) |
| Q7-M-077 (Agentencode-Leak PROTOKOLL/STUDIO) | 26.07. | Entschieden V1 — Klartext statt Agentencode, keine Admin-Ausnahme |

---

## Hinweis
Neue Einträge erhalten fortlaufende Q7-A-Nummer. Bei Umsetzung: Status aktualisieren (z.B. "Erledigt", Datum ergänzen), nicht löschen — Liste bleibt vollständiger Verlauf.

**Änderungsprotokoll:**
- v1.0 (25.07.2026): Ausgangsfassung.
- v2.0 (25.07.2026): Konsolidiert mit Q7_Backlog_Konsolidiert_23072026.md, Q7_Backlog_Ergaenzung_20072026.md, Q7_Externe_Werkzeuge_Architektur.md, Support-Feedback-Prozess-Dokumenten. In fünf Themenblöcke (A–E) gegliedert, Abschnitt "Bereits erledigt" ergänzt.
- v2.1 (25.07.2026): Finale Version. Q7-A-031 bereinigt (kein offener Widerspruch mehr, Grundsatz vs. Detail-Pfad klar getrennt).
- v2.2 (26.07.2026): Neue Einträge aus View-Abgleich-Session: Q7-A-043 (Kalender-Ansichtsmodi), Q7-A-044 (OUTPUT „+ Neu generieren" entfernen), Q7-A-045 (Sidebar Badge-Feldnamen/Branding verifizieren). Q7-A-011 (SPACES) auf „teilweise gelöst" aktualisiert. Q7-A-041 auf „Erledigt" korrigiert (war bereits durch v2-Sidebar-Doku behoben, Status war veraltet). „Bereits erledigt"-Tabelle um 5 neue Punkte aus heutiger Session ergänzt (TRESOR final, Rollenmodell-Konzept, Freigabe_Rechte_Aufgaben v1.1, Sidebar-Rebuild, Q7-M-077).
- v2.3 (26.07.2026): Q7-A-040 auf „Erledigt" korrigiert — reale Bestandsaufnahme (Terminal-Screenshot 26.07.) bestätigt `Q7_Datenbank_Architektur_v1.md` existiert bereits mit Suffix, Status war veraltet. Code-Review-Funde aus API-Dateien ergänzt: Q7-M-078 (Backend-Leck `agentLabel`/`/api/chat`), SEC-GATE-Präfix-Leck über Fehlermeldungen (`/api/ablage`) — siehe Mängelregister für Details.
