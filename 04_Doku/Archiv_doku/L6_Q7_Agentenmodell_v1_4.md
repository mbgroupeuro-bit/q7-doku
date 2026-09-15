# Q7 – Agentenmodell

**Version:** 1.4
**Status:** Verbindlich

---

# Zweck

Das Agentenmodell definiert den Aufbau, die Verantwortlichkeiten und das Verhalten aller Agenten innerhalb von Q7.
Agenten sind organisatorische Rollen zur Ausführung von Aufgaben.
Sie besitzen kein dauerhaft gespeichertes Fachwissen.

---

# Grundprinzipien

## 1. Rollenprinzip

Jeder Agent übernimmt eine klar definierte Unternehmensrolle.

---

## 2. Spezialisierung

Jeder Agent besitzt genau ein Fachgebiet.

---

## 3. Verantwortlichkeit

Jede Aufgabe besitzt genau einen verantwortlichen Agenten.

---

## 4. Zusammenarbeit

Agenten arbeiten ausschließlich über definierte Prozesse zusammen.

---

## 5. Zentrale Wissensnutzung

Agenten greifen auf die zentrale Wissensbasis zu.
Fachwissen wird nicht innerhalb des Agenten gespeichert.

---

# Standardaufbau eines Agenten

Jeder Agent besitzt dieselbe Grundstruktur.

```text
Agent
├── README.md
├── agentenbeschreibung.md
├── identitaet.md
├── regeln.md
├── skills.md
└── loops.md
```

---

# Aufgaben eines Agenten

Ein Agent kann:

- Aufgaben bearbeiten
- Informationen analysieren
- Entscheidungen vorbereiten
- Ergebnisse erstellen
- Prozesse ausführen
- Ergebnisse dokumentieren

---

# Grenzen eines Agenten

Ein Agent besitzt keine Verantwortung für:

- Unternehmensstrategie
- Governance
- Architektur
- Technik
- Wissensverwaltung

Diese Bereiche werden durch andere Systemkomponenten geregelt.

---

# Zusammenarbeit

Agenten kommunizieren ausschließlich innerhalb definierter Prozesse.
Direkte, unstrukturierte Kommunikation ist nicht zulässig.

---

# Wissen

Agenten nutzen ausschließlich:

- Frameworks
- Expertenwissen
- Methoden
- Checklisten
- Vorlagen
- Unternehmenswissen

aus dem zentralen Wissensmodell.

---

# Erfahrungen

Erfahrungen entstehen durch Loops.
Sie dienen der kontinuierlichen Verbesserung des Agenten.
Erfahrungen ersetzen niemals die zentrale Wissensbasis.

Vertiefung (Erfahrung als eigenständige Artefaktklasse mit Confidence-Wert, Übernahme zu Knowledge nach Freigabe): `04_Doku/Infrastruktur/Q7_Wissens_Artefaktmodell_v1.md`

---

# Agententypen

Q7 unterscheidet grundsätzlich zwischen:

- Führungsagenten
- Spezialagenten
- Unterstützungsagenten

---

## Führungsagenten

Verantwortlich für:

- Priorisierung
- Koordination
- Qualitätskontrolle
- Entscheidungen

Die zentrale Koordinationsfunktion (A01, informell auch „Hermes" genannt, siehe L4) ist ein Führungsagent.

---

## Systemweite Überwachungsfunktion (A00)

A00 (Stab) besitzt zusätzlich zur GF-Unterstützung eine systemweite Überwachungsfunktion: A00 beobachtet die Tätigkeit aller anderen Agenten, einschließlich der Koordinationsfunktion (A01), auf Auffälligkeiten und Regelabweichungen.

Diese Funktion unterliegt denselben Transparenzanforderungen wie jede andere Systemkomponente:

- Jede Beobachtung und jede daraus resultierende Kontrollentscheidung von A00 wird vollständig protokolliert (siehe L2 Grundsatz 6, GUI-Modul PROTOKOLL).
- Der GF hat jederzeit uneingeschränkte Einsicht in diese Protokolle — A00 agiert in keinem Fall verdeckt gegenüber dem GF.
- Gegenüber anderen Agenten, Kunden und Lizenznehmern bleibt diese Funktion unsichtbar (Black-Box-Prinzip, siehe L1 Grundprinzip 1, L3 Architekturprinzip 3) — die Unsichtbarkeit gilt ausschließlich nach außen, nie gegenüber dem GF selbst.
- A00 trifft keine strukturellen, strategischen oder freigaberelevanten Entscheidungen eigenständig — auch nicht im Rahmen dieser Überwachungsfunktion (siehe L1 Grundprinzip 9, nicht delegierbare GF-Letztentscheidung). Erkannte Auffälligkeiten werden zur GF-Entscheidung eskaliert, nicht autonom durch A00 behoben.

---

## Spezialagenten

Verantwortlich für:

- Fachliche Bearbeitung
- Analysen
- Erstellung von Ergebnissen

---

## Unterstützungsagenten

Verantwortlich für:

- Servicefunktionen
- Administration
- technische Unterstützung

---

# Ausfallsicherheit (Failover)

Kritische Führungsagenten (insbesondere die zentrale Koordinationsfunktion, siehe L4) folgen dem Master/Backup-Prinzip:

- Jeder kritische Führungsagent besitzt einen definierten Backup-Agenten.
- Bei Ausfall des Master-Agenten übernimmt der Backup-Agent automatisch.
- Der Ausfall wird protokolliert und an die Governance-Ebene gemeldet (siehe L2 Nachvollziehbarkeit, Grundsatz 6).
- Rückkehr zum Master erfolgt nach Wiederherstellung, ohne Datenverlust im laufenden Prozess.

Spezial- und Unterstützungsagenten benötigen kein zwingendes Backup, sofern ihre Aufgaben durch andere Agenten desselben Typs vertretbar sind (siehe Erweiterbarkeit).

---

# Zugriffsrechte (RBAC)

Jeder Agententyp besitzt pauschale Zugriffsrechte entsprechend seiner Rolle:

| Agententyp | Zugriff |
|---|---|
| Führungsagenten | Eigene Abteilung, zugeordnete Prozesse, Koordinationsdaten |
| Spezialagenten | Eigene Abteilung, zentrale Wissensbasis (lesend) |
| Unterstützungsagenten | Servicebezogene Bereiche, keine fachlichen Inhalte |

Zugriffe außerhalb der eigenen Rolle sind nicht zulässig, unabhängig von der Aufgabe.

**Geschlossen (Q7-M-033/034):** Die attributbasierte Erweiterung dieser pauschalen Rollenlogik (ABAC — Zugriff abhängig von Kunde, Datenklasse oder Prozessstatus) ist spezifiziert in: `04_Doku/Infrastruktur/Q7_Policy_Engine_v1.md`. RBAC (diese Tabelle) bleibt die Basis; ABAC verfeinert, hebt sie aber nie auf.

---

# Qualitätsprinzip

Jeder Agent arbeitet nach denselben Qualitätsstandards.
Ergebnisse müssen:

- vollständig
- korrekt
- nachvollziehbar
- reproduzierbar

sein.

---

# Akzeptanzkriterien

- Jeder Agent besitzt die vollständige Standardstruktur (alle 6 Dateien) vor Inbetriebnahme.
- Jeder kritische Führungsagent hat einen dokumentierten, funktionsfähigen Backup-Agenten.
- Ein simulierter Ausfall eines Master-Agenten führt zu einer protokollierten, automatischen Übernahme durch den Backup-Agenten.
- Jeder Agent greift ausschließlich auf Bereiche innerhalb der für seinen Agententyp definierten Zugriffsrechte zu (kein Zugriff außerhalb der RBAC-Tabelle).
- Kein Agent speichert Fachwissen dauerhaft außerhalb der zentralen Wissensbasis.

---

# Erweiterbarkeit

Neue Agenten dürfen ergänzt werden, wenn:

- ein neuer Verantwortungsbereich entsteht,
- keine Überschneidung mit bestehenden Agenten vorliegt,
- die Standardstruktur eingehalten wird.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich das Agentenmodell.
Organisation wird in L4 beschrieben.
Prozesse werden in L5 beschrieben.
Wissen wird in L7 beschrieben.
Technik wird in L8 beschrieben.

---

# Änderungsregel

Neue Agenten dürfen bestehende Verantwortlichkeiten nicht verändern.
Jeder neue Agent ist vor der Einführung architektonisch zu prüfen.
Finale Freigabe liegt beim GF (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (Ausgangsfassung)
- v1.1 (08.07.2026): Abschnitt "Ausfallsicherheit (Failover)" ergänzt. Abschnitt "Zugriffsrechte (RBAC)" ergänzt. ABAC-Erweiterung als offener Punkt markiert. Hermes explizit als Führungsagent benannt. GF-Freigabe in Änderungsregel ergänzt.
- v1.2 (08.07.2026): Abschnitt "Akzeptanzkriterien" ergänzt (Q7-M-073).
- v1.3 (09.07.2026): Anschlusspunkt-Ergänzung. Q7-M-033/034 als geschlossen markiert, Verweis auf Q7_Policy_Engine_v1.md unter „Zugriffsrechte (RBAC)" ergänzt. Verweis auf Q7_Wissens_Artefaktmodell_v1.md unter „Erfahrungen" ergänzt.
- v1.4 (10.07.2026): Agentenmodell-Korrektur nach GF-Entscheidung. Koordinationsfunktion von "Hermes" auf "A01, informell auch Hermes" präzisiert (siehe Q7_KLAERUNGSBEDARF_Agentenmodell.md). Neuer Abschnitt "Systemweite Überwachungsfunktion (A00)" ergänzt — A00 überwacht alle Agenten inkl. A01, vollständig GF-transparent protokolliert, keine eigenständigen Entscheidungen (GF-Letztentscheidung bleibt unberührt, siehe L1 Grundprinzip 9). Bestätigt: kein Konflikt mit Black-Box-Prinzip, da Unsichtbarkeit nur nach außen gilt, nie gegenüber GF.

**Hinweis:** Failover- und RBAC-Modell basieren auf Annahmen (Master/Backup wie Altsystem, grobe statt feingranulare Rollenklassen) — noch nicht durch GF explizit bestätigt, nur implizit freigegeben.
