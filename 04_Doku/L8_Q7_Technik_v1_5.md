# Q7 – Technisches Modell

**Version:** 1.5
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
Konkrete technische Zielarchitektur (Datenarchitektur, Integrationsarchitektur, Deployment-Modi, Resilienz, AI Observability, Restore-Strategie): `04_Doku/Infrastruktur/Q7_Technisches_Architekturhandbuch_v1.md`.

---

## 3. Skalierbarkeit

Q7 muss für kleine Unternehmen ebenso geeignet sein wie für internationale Konzerne.

---

## 4. Sicherheit

Alle technischen Komponenten müssen den Schutz der Systemarchitektur und der Unternehmensdaten gewährleisten.

Vertiefung (Tool-Sandboxing, Prompt-Injection-Abwehr, Instruktions-/Datentrennung, IP-Schutz, Secret-Management, DLP): `04_Doku/Infrastruktur/Q7_Sicherheitsmodell_v1_4.md`.

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

Mandanten- und Agenten-Daten werden physisch getrennt gehalten (`c_Q7_datenbank/01_Mandanten_Datenbank` und `c_Q7_datenbank/02_Agenten_Datenbank`). Agenten besitzen keine DB-Verbindung zur Mandanten-Datenbank; benötigte Lizenznehmerdaten werden vom zentralen App-Service als Prompt-Kontext injiziert (siehe L6 Zugriffsrechte).

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

- Benutzer
- Rollen
- Berechtigungen
- Lizenznehmer
- Sitzungen

Vertiefung (Mandantenstruktur, Isolationsgrade, Datenräume): `04_Doku/Infrastruktur/Q7_Tenant_Modell_v1.md`.
Vertiefung (Lizenzmodell, Feature Flags, IP-Schichten, Update-/Rollback-Modell): `04_Doku/Infrastruktur/Q7_Lizenz_und_Deployment_v1.md`.

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

**Geschlossen (M-ID-Register):** Das Mängelregister wird als eigenständiges Dokument unter `04_Doku/Infrastruktur/Q7_Maengel_Loesungsvorschlaege_v1_2.md` geführt (nicht in L2 Governance integriert). Traceability zwischen Mangel-ID, Lösungsdokument und Akzeptanzkriterium: siehe `04_Doku/Infrastruktur/Q7_Test_und_Traceability_v1.md`, Abschnitt „Traceability Matrix".

---

# Änderungsregel

Technische Änderungen dürfen die Architekturprinzipien von Q7 nicht verletzen.
Vor jeder technischen Erweiterung sind Auswirkungen auf Architektur, Organisation, Prozesse, Agenten und Wissensmodell zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (Ausgangsfassung)
- v1.1 (08.07.2026): Verweis auf `04_Doku/Infrastruktur/` unter Erweiterbarkeit ergänzt. M-ID-Register-Standort als offener Punkt markiert. GF-Freigabe in Änderungsregel ergänzt.
- v1.2 (08.07.2026): Abschnitt "Akzeptanzkriterien" ergänzt (Q7-M-073).
- v1.3 (09.07.2026): Anschlusspunkt-Ergänzung. M-ID-Register-Standort als geschlossen markiert, Verweis auf Mängelregister-Ablageort und Q7_Test_und_Traceability_v1.md ergänzt. Verweise auf Q7_Technisches_Architekturhandbuch_v1.md (unter „Erweiterbarkeit"), Q7_Sicherheitsmodell_v1.1.md (unter „Sicherheit"-Grundprinzip) sowie Q7_Tenant_Modell_v1.md und Q7_Lizenz_und_Deployment_v1.md (unter „Benutzerverwaltung") ergänzt.
- v1.4 (26.07.2026): Terminologie "GF" → "Admin" (Q7-L8-001). Neuer Grundsatz 6 "KI-Provider-Abstraktion" ergänzt — `rufeKIAn()` als verbindliche Regel, bisher nur im Master verankert (Q7-L8-002). Abschnitt "Datenhaltung" um DB-Abstraktionsregel und Verweis auf physische Trennung Mandanten-/Agenten-Datenbank (`c_Q7_datenbank`) ergänzt (Q7-L8-003, Q7-L8-004).
- v1.5 (26.07.2026): Referenz auf Sicherheitsmodell korrigiert — `Q7_Sicherheitsmodell_v1.1.md` existierte nicht mehr (reale Bestandsaufnahme, Terminal-Screenshot 26.07.), aktueller Stand `Q7_Sicherheitsmodell_v1_4.md` referenziert (Q7-L8-005). Grundsatz 6 um Bestätigung der `rufeKIAn()`-Nutzung in `/api/chat/route.ts` ergänzt (Code-Review 26.07., Q7-A-014 teilweise verifiziert). Neuer Absatz unter "Backend": Black-Box-Durchsetzungsregel für API-Responses (Q7-M-078) — keine Agentencodes oder internen Präfixe (z.B. „SEC-GATE:") in Client-Antworten.
