# Q7 – Agentenmodell

**Version:** 1.7
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

Jeder Agent besitzt dieselbe Grundstruktur unter `01_Grundlagen/`:

```text
A0X_[Name]/01_Grundlagen/
├── README.md
├── agentenbeschreibung.md
├── regeln.md
├── Skills.md
└── loop.md
```

Der Ordnername (`A0X_[Name]`) trägt den Agentencode; die Dateien selbst sind einheitlich benannt (siehe L4, Standardstruktur jeder Abteilung).

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

Die zentrale Koordinationsfunktion (A01) ist ein Führungsagent (Kundensicht: „Persönlicher Assistent", siehe L4 Namenskonvention).

---

## Systemweite Überwachungsfunktion (A00)

A00 (Stab) besitzt zusätzlich zur Admin-Unterstützung eine systemweite Überwachungsfunktion: A00 beobachtet die Tätigkeit aller anderen Agenten, einschließlich der Koordinationsfunktion (A01), auf Auffälligkeiten und Regelabweichungen.

Diese Funktion unterliegt denselben Transparenzanforderungen wie jede andere Systemkomponente:

- Jede Beobachtung und jede daraus resultierende Kontrollentscheidung von A00 wird vollständig protokolliert (siehe L2 Grundsatz 6, GUI-Modul PROTOKOLL).
- Der Admin hat jederzeit uneingeschränkte Einsicht in diese Protokolle — A00 agiert in keinem Fall verdeckt gegenüber dem Admin.
- Gegenüber anderen Agenten, Kunden und Lizenznehmern bleibt diese Funktion unsichtbar (Black-Box-Prinzip, siehe L1 Grundprinzip 1, L3 Architekturprinzip 3) — die Unsichtbarkeit gilt ausschließlich nach außen, nie gegenüber dem Admin selbst.
- A00 trifft keine strukturellen, strategischen oder freigaberelevanten Entscheidungen eigenständig — auch nicht im Rahmen dieser Überwachungsfunktion (siehe L1 Grundprinzip 9, nicht delegierbare Admin-Letztentscheidung). Erkannte Auffälligkeiten werden zur Admin-Entscheidung eskaliert, nicht autonom durch A00 behoben.

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

# Technische Resilienz (statt Agenten-Failover)

Agenten sind statische Definitionsordner, keine dauerhaft laufenden Prozesse (siehe Standardaufbau) — es gibt daher keinen "Agentenausfall" im klassischen Sinn, der einen Backup-*Agenten* erfordern würde. Störungen sind ausschließlich technischer Natur (Provider-Timeout, Modellfehler, App-Layer-Fehler) und werden auf dieser Ebene behandelt:

- Retry mit demselben Modell bei transientem Fehler.
- Bei wiederholtem Fehler: automatischer Fallback auf ein anderes Modell innerhalb `rufeKIAn()` (technisch identisch mit der bestätigten Modell-Wechsel-Funktion, siehe Master v1.2).
- A00 protokolliert Ausfallhäufigkeit und Muster, eskaliert bei Auffälligkeiten an den Admin (siehe „Systemweite Überwachungsfunktion (A00)") — A00 übernimmt in keinem Fall selbst die Aufgabe eines anderen Agenten, das widerspräche seiner nicht-autonomen Rolle.

Ein organisatorisches Master/Backup-Prinzip zwischen Agenten ist nicht vorgesehen.

---

# Zugriffsrechte (RBAC)

Jeder Agententyp besitzt pauschale Zugriffsrechte entsprechend seiner Rolle:

| Agententyp | Zugriff |
|---|---|
| Führungsagenten | Eigene Abteilung, zugeordnete Prozesse, Koordinationsdaten |
| Spezialagenten | Eigene Abteilung, zentrale Wissensbasis (lesend) |
| Unterstützungsagenten | Servicebezogene Bereiche, keine fachlichen Inhalte |

Zugriffe außerhalb der eigenen Rolle sind nicht zulässig, unabhängig von der Aufgabe.

**Geschlossen (Q7-M-033/034):** Die attributbasierte Erweiterung dieser pauschalen Rollenlogik (ABAC — Zugriff abhängig von Lizenznehmer, Datenklasse oder Prozessstatus) ist spezifiziert in: `04_Doku/Infrastruktur/Q7_Policy_Engine_v1.md`. RBAC (diese Tabelle) bleibt die Basis; ABAC verfeinert, hebt sie aber nie auf.

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

- Jeder Agent besitzt die vollständige Standardstruktur (alle 5 Dateien gemäß aktuellem Standardaufbau) vor Inbetriebnahme.
- Bei Provider-/Modellfehlern greift der Retry-/Fallback-Mechanismus in `rufeKIAn()` nachweisbar (Protokoll zeigt Retry bzw. Modellwechsel vor endgültigem Fehlschlag).
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
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (Ausgangsfassung)
- v1.1 (08.07.2026): Abschnitt "Ausfallsicherheit (Failover)" ergänzt. Abschnitt "Zugriffsrechte (RBAC)" ergänzt. ABAC-Erweiterung als offener Punkt markiert. Hermes explizit als Führungsagent benannt. GF-Freigabe in Änderungsregel ergänzt.
- v1.2 (08.07.2026): Abschnitt "Akzeptanzkriterien" ergänzt (Q7-M-073).
- v1.3 (09.07.2026): Anschlusspunkt-Ergänzung. Q7-M-033/034 als geschlossen markiert, Verweis auf Q7_Policy_Engine_v1.md unter „Zugriffsrechte (RBAC)" ergänzt. Verweis auf Q7_Wissens_Artefaktmodell_v1.md unter „Erfahrungen" ergänzt.
- v1.4 (10.07.2026): Agentenmodell-Korrektur nach GF-Entscheidung. Koordinationsfunktion von "Hermes" auf "A01, informell auch Hermes" präzisiert. Neuer Abschnitt "Systemweite Überwachungsfunktion (A00)" ergänzt.
- v1.5 (25.07.2026): Abschnitt "Standardaufbau eines Agenten" an reale Praxis angepasst (Q7-M-XXX, siehe Mängelliste). `identitaet.md` entfernt (5 statt 6 Dateien). Dateinamen präzisiert: `loops.md` → `loop.md`, `skills.md` → `Skills.md`, jeweils mit Agenten-Präfix `A0X_`. Akzeptanzkriterien entsprechend angepasst (5 statt 6 Dateien).

**Hinweis:** RBAC-Modell (grobe statt feingranulare Rollenklassen) basiert auf einer Annahme — noch nicht durch Admin explizit bestätigt, nur implizit freigegeben. Failover-Annahme (Q7-L6-004) entfällt — siehe „Technische Resilienz".

- v1.6 (26.07.2026): Terminologie "GF" → "Admin" durchgängig (Q7-L6-001). Standardaufbau-Abschnitt korrigiert: Agenten-Präfix (`A0X_`) vor Dateinamen entfernt, an L4 v1.7 angeglichen — nur Ordnername trägt Agentencode, Dateien einheitlich benannt (Q7-L6-002). „Hermes"-Referenz aktualisiert auf 3-Ebenen-Namenskonvention (L4), Kundensicht-Platzhalter „Persönlicher Assistent" (Q7-L6-003). Q7-L6-004 (Failover/RBAC-Bestätigungsstatus) weiterhin offen — Hinweis unverändert stehen gelassen.
- v1.7 (26.07.2026): Q7-L6-004 gelöst — Abschnitt "Ausfallsicherheit (Failover)" (Master/Backup-Agenten-Prinzip) vollständig entfernt und durch "Technische Resilienz (statt Agenten-Failover)" ersetzt: Agenten sind statische Definitionsordner ohne Laufzeitzustand, daher kein Agenten-Failover nötig — Resilienz erfolgt technisch über Retry/Modell-Fallback in `rufeKIAn()`, A00 bleibt rein beobachtend/eskalierend. Akzeptanzkriterien entsprechend angepasst. RBAC-Bestätigungsstatus bleibt offen (Admin-Bestätigung noch ausstehend).
