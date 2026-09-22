# Q7 – Technisches Modell

**Version:** 1.8
**Status:** Verbindlich

---

# Zweck

Das technische Modell definiert die technischen Grundprinzipien und Systemkomponenten von Q7.
Es beschreibt die technische Infrastruktur, ohne Implementierungsdetails oder konkrete Programmiersprachen festzulegen.

---

# Grundprinzipien

## 1. Modularität

Q7 besteht aus unabhängigen technischen Modulen.
Jedes Modul besitzt eine klar definierte Aufgabe.

---

## 2. Erweiterbarkeit

Neue Module können ergänzt werden, ohne bestehende Module grundlegend zu verändern.

Konkrete Infrastruktur-Umsetzung (Repository, CI/CD, Hosting) wird in `04_Doku/Infrastruktur/` dokumentiert und muss den hier definierten Prinzipien entsprechen.
Konkrete technische Zielarchitektur (Datenarchitektur, Integrationsarchitektur, Deployment-Modi, Resilienz, AI Observability, Restore-Strategie): `04_Doku/Infrastruktur/Q7_Technisches_Architekturhandbuch_v1_2.md`.

---

## 3. Skalierbarkeit

Q7 muss für kleine Unternehmen ebenso geeignet sein wie für internationale Konzerne.

---

## 4. Sicherheit

Alle technischen Komponenten müssen den Schutz der Systemarchitektur und der Unternehmensdaten gewährleisten.

Vertiefung (Tool-Sandboxing, Prompt-Injection-Abwehr, Instruktions-/Datentrennung, IP-Schutz, Secret-Management, DLP): `04_Doku/Infrastruktur/Q7_Sicherheitsmodell_v1_6.md`.

---

## 5. Standardisierung

Technische Schnittstellen folgen einheitlichen Standards.

---

## 6. KI-Provider-Abstraktion

Sämtliche KI-Modellaufrufe erfolgen ausschließlich über die zentrale Abstraktionsschicht `rufeKIAn()`.
Direkte oder verstreute Provider-Aufrufe sind nicht zulässig (siehe Master, Cloud-Priorität-Bedingung).
Diese Regel gilt unabhängig vom Modell, Provider oder Agenten und ist Voraussetzung dafür, dass Q7 Local ohne Neubau möglich bleibt (reine Konfigurationsänderung statt Rebuild).

**Bestätigt umgesetzt (26.07.2026):** `app/api/chat/route.ts` verwendet `rufeKIAn()` aus `lib/rufeKIAn.ts` durchgängig, kein direkter OpenRouter-Aufruf mehr im Route-Code (Q7-A-014, teilweise verifiziert — `/api/compare` noch zu prüfen).

---

# Hauptkomponenten

Das technische System besteht aus folgenden Komponenten:

- Benutzeroberfläche (Frontend)
- Backend
- API
- Datenbank
- Speicher
- Authentifizierung
- Integrationen
- Workflow Engine
- Monitoring
- Logging
- Sicherheit

---

# Frontend

Das Frontend stellt ausschließlich die Benutzeroberfläche bereit.
Es enthält keine Geschäftslogik.

---

# Backend

Das Backend verarbeitet:

- Geschäftslogik
- Prozesse
- Berechtigungen
- Datenzugriffe
- Integrationen

**Black-Box-Durchsetzung im Backend (Q7-M-078, 26.07.2026):** API-Routen dürfen an den Client ausschließlich Klartext-Bezeichnungen zurückgeben (z.B. `agentLabel: "Assistent"`), niemals interne Routing-Bezeichner mit Agentencode. Interne Bezeichner (`agent`-Parameter mit Code, z.B. „A01 Planung & Vorbereitung") sind ausschließlich für serverseitiges Routing, Modellwahl und Systemprompt-Aufbau bestimmt. Ebenso dürfen interne Präfixe aus Fehlermeldungen (z.B. „SEC-GATE:") nicht unverändert an den Client durchgereicht werden.

**Offen (Q7-L8-006, siehe Master „Abweichung von Grundprinzip 7"):** Der Master sieht vor, dass der Lizenznehmer pro Agent (außer A01) den verwendeten Modellnamen im Klartext sehen kann. Ob und wie ein Feld wie `modelName` zusätzlich zu `agentLabel` in der API-Response zulässig ist, ist hier bewusst noch nicht spezifiziert — Umsetzung zurückgestellt, bis das System grundlegend steht. Bis zur Klärung gilt: kein zusätzliches Feld wird ausgeliefert.

---

# Datenhaltung

Alle Daten werden zentral verwaltet.
Dazu gehören unter anderem:

- Benutzer
- Projekte
- Chats
- Dateien
- Wissen
- Prozesse
- Ergebnisse
- Protokolle

Zugriffe auf alle Datenbanken erfolgen ausschließlich über eine zentrale Abstraktionsschicht im Backend — kein Agent und keine Komponente verbindet sich direkt mit einer Datenbank.

Lizenznehmer- und Agenten-Daten werden physisch getrennt gehalten (`c_Q7_datenbank/01_Mandanten_Datenbank` und `c_Q7_datenbank/02_Agenten_Datenbank`). Agenten besitzen keine DB-Verbindung zur Lizenznehmer-Datenbank; benötigte Lizenznehmerdaten werden vom zentralen App-Service als Prompt-Kontext injiziert (siehe L6 Zugriffsrechte).

**Offen (Q7-L8-007):** Die Ordnernamen `01_Mandanten_Datenbank`/`02_Agenten_Datenbank` sind physische Pfadbezeichner und wurden im Zuge dieses Konsistenz-Checks bewusst nicht mit umbenannt (Terminologie-Korrektur betrifft hier nur die Prosa, nicht den realen Pfad) — eine Umbenennung der tatsächlichen Ordner ist eine separate technische Entscheidung und noch offen.

---

# Schnittstellen

Q7 unterstützt standardisierte Schnittstellen.
Beispiele:

- REST API
- Webhooks
- Dateischnittstellen
- Cloud-Dienste
- Drittsysteme

---

# Integrationen

Q7 kann unter anderem mit folgenden Systemen verbunden werden:

- E-Mail
- Outlook
- Gmail
- WhatsApp
- CRM
- ERP
- Kalender
- Cloud-Speicher
- Microsoft 365
- Google Workspace

---

# Sicherheit

Das technische System schützt insbesondere:

- Unternehmensdaten
- Benutzerdaten
- Wissensdaten
- Prozesse
- Systemarchitektur

Die interne Systemlogik ist für Lizenznehmer nicht sichtbar.

---

# Benutzerverwaltung

Das System unterstützt mindestens:

- Lizenznehmer
- Admin
- User
- Rollen
- Berechtigungen
- Sitzungen

Zum Rollenverhältnis siehe L1, Abschnitt „Rollenmodell".

Vertiefung (Lizenznehmerstruktur, Isolationsgrade, Datenräume): `04_Doku/Infrastruktur/Q7_Tenant_Modell_v1_2.md`.
Vertiefung (Lizenzmodell, Feature Flags, IP-Schichten, Update-/Rollback-Modell): `04_Doku/Infrastruktur/Q7_Lizenz_und_Deployment_v1_2.md`.

---

# Protokollierung

Technische Ereignisse werden protokolliert.
Beispiele:

- Anmeldung
- Änderungen
- Fehler
- Synchronisationen
- Schnittstellen
- Systemereignisse

---

# Performance

Das System muss:

- skalierbar
- performant
- ausfallsicher
- wartbar

sein.

---

# Akzeptanzkriterien

- Jede technische Komponente ist im Betrieb eindeutig einer der elf Hauptkomponenten zuordenbar.
- Das Frontend enthält nachweislich keine Geschäftslogik (keine Regel-/Entscheidungslogik im Client-Code).
- Jeder in "Protokollierung" gelistete Ereignistyp wird tatsächlich erfasst und ist nachträglich auffindbar.
- Kein Lizenznehmer hat Einsicht in interne Systemlogik (Black-Box-Prinzip, siehe L1/L3) — geprüft anhand der sichtbaren Oberflächen.
- Keine API-Response enthält einen internen Agentencode oder ein internes Sicherheits-Präfix im Klartext (Q7-M-078).
- Neue technische Module lassen sich ergänzen, ohne dass bestehende Schnittstellen brechen.

---

# Erweiterbarkeit

Neue technische Komponenten dürfen ergänzt werden, sofern sie:

- den Architekturprinzipien entsprechen,
- bestehende Module nicht beeinträchtigen,
- standardisierte Schnittstellen verwenden.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich das technische Modell.
Organisation wird in L4 beschrieben.
Prozesse werden in L5 beschrieben.
Agenten werden in L6 beschrieben.
Wissen wird in L7 beschrieben.

**Mängelregister — nicht mehr aktiv geführt (19.09.2026):** Das Mängelregister (`Q7_Maengel_Loesungsvorschlaege_vX.md`) wurde geführt, solange offene Mängel bestanden; nachdem alle Mängel behoben waren, wurde die Datei gelöscht statt archiviert. Der Abschnitt bleibt hier zur Erklärung des historischen Ablageorts erhalten (vormals `04_Doku/Infrastruktur/`, nicht in L2 Governance integriert). Traceability zwischen Mangel-ID, Lösungsdokument und Akzeptanzkriterium wurde geführt in: `04_Doku/Infrastruktur/Q7_Test_und_Traceability_v1_2.md`, Abschnitt „Traceability Matrix" — dort ebenfalls als abgeschlossen vermerkt.

**Korrektur (21.09.2026):** Die Aussage oben, das Mängelregister sei gelöscht worden, wurde bei der Dateihygiene-Prüfung vom 21.09.2026 widerlegt — `Q7_Maengel_Loesungsvorschlaege_v1_5....md` existiert real im Infrastruktur-Ordner (Stand 27.07.2026). Dieser Abschnitt und der entsprechende Abschnitt in `Q7_Test_und_Traceability_v1_2.md` müssen inhaltlich korrigiert werden — noch nicht in dieser Version umgesetzt, da die Datei selbst noch nicht neu geprüft wurde.

---

# Änderungsregel

Technische Änderungen dürfen die Architekturprinzipien von Q7 nicht verletzen.
Vor jeder technischen Erweiterung sind Auswirkungen auf Architektur, Organisation, Prozesse, Agenten und Wissensmodell zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (08.07.2026): Verweis auf `04_Doku/Infrastruktur/` unter Erweiterbarkeit ergänzt. M-ID-Register-Standort als offener Punkt markiert. GF-Freigabe in Änderungsregel ergänzt.
- v1.1 (08.07.2026): Abschnitt "Akzeptanzkriterien" ergänzt (Q7-M-073).
- v1.2 (09.07.2026): Anschlusspunkt-Ergänzung. M-ID-Register-Standort als geschlossen markiert, Verweis auf Mängelregister-Ablageort und Q7_Test_und_Traceability_v1.md ergänzt. Verweise auf Q7_Technisches_Architekturhandbuch_v1.md (unter „Erweiterbarkeit"), Q7_Sicherheitsmodell_v1.1.md (unter „Sicherheit"-Grundprinzip) sowie Q7_Tenant_Modell_v1.md und Q7_Lizenz_und_Deployment_v1.md (unter „Benutzerverwaltung") ergänzt.
- v1.3 (26.07.2026): Terminologie "GF" → "Admin" (Q7-L8-001). Neuer Grundsatz 6 "KI-Provider-Abstraktion" ergänzt — `rufeKIAn()` als verbindliche Regel, bisher nur im Master verankert (Q7-L8-002). Abschnitt "Datenhaltung" um DB-Abstraktionsregel und Verweis auf physische Trennung Mandanten-/Agenten-Datenbank (`c_Q7_datenbank`) ergänzt (Q7-L8-003, Q7-L8-004).
- v1.4 (26.07.2026): Referenz auf Sicherheitsmodell korrigiert — `Q7_Sicherheitsmodell_v1.1.md` existierte nicht mehr (reale Bestandsaufnahme, Terminal-Screenshot 26.07.), aktueller Stand `Q7_Sicherheitsmodell_v1_4.md` referenziert (Q7-L8-005). Grundsatz 6 um Bestätigung der `rufeKIAn()`-Nutzung in `/api/chat/route.ts` ergänzt (Code-Review 26.07., Q7-A-014 teilweise verifiziert). Neuer Absatz unter "Backend": Black-Box-Durchsetzungsregel für API-Responses (Q7-M-078) — keine Agentencodes oder internen Präfixe (z.B. „SEC-GATE:") in Client-Antworten.
- v1.5 (15.09.2026): (übersprungen in Quelldokument — Versionssprung direkt auf v1.6 im Rahmen des Konsistenz-Checks vom 19.09.2026, siehe unten.)
- v1.6 (19.09.2026): Terminologie "Mandant"/"Mandanten-" → "Lizenznehmer"/"Lizenznehmer-" in Prosa (Abschnitt „Datenhaltung"); reale Ordnerpfade (`01_Mandanten_Datenbank`) bewusst nicht mit umbenannt, als offener technischer Punkt markiert (Q7-L8-007). Abschnitt "Benutzerverwaltung" um Rollenmodell (Lizenznehmer/Admin/User, siehe L1) präzisiert. Neuer offener Punkt (Q7-L8-006) zur technischen Umsetzung der Modellname-Sichtbarkeit in der Backend-Response ergänzt (siehe Master, Abweichung Grundprinzip 7) — Umsetzung bewusst zurückgestellt, bis das System grundlegend steht.
- v1.7 (19.09.2026): Abschnitt „M-ID-Register" aktualisiert (Q7-VERT2-007 abschließend geklärt): Mängelregister wurde gelöscht, nachdem alle Mängel behoben waren — kein offener/kaputter Verweis mehr, sondern dokumentierter historischer Zustand.
- v1.8 (21.09.2026): Querverweise korrigiert (Q7-L8-008): `Q7_Technisches_Architekturhandbuch_v1.md` → `..._v1_2.md`; `Q7_Sicherheitsmodell_v1_4.md` → `..._v1_6.md`; `Q7_Tenant_Modell_v1.md` (2×) → `..._v1_2.md`; `Q7_Lizenz_und_Deployment_v1.md` → `..._v1_2.md`. Abschnitt „M-ID-Register" um Korrekturhinweis ergänzt (Q7-L8-009): die in v1.7 als geklärt vermerkte Löschung des Mängelregisters wurde bei der Dateihygiene-Prüfung vom 21.09.2026 widerlegt — Datei existiert real, inhaltliche Neubewertung von Abschnitt und Q7_Test_und_Traceability_v1_2.md noch ausstehend.
