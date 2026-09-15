# Optimierung Expertendateien – Nächste Schritte

**Kontext:** Zusammenfassung der offenen Verbesserungspotenziale nach der Optimierung von WERBETEXT_SCHABLONEN_v3.1, WERBETEXT_PRAXIS_v3.1 und haeusel_limbic_v1.1 für Mr. Kouzina.

---

## 1. Sofort umsetzbar – ohne neue Daten

### Emotionale Tiefe im Mittelteil
Aktuelle Texte (z. B. Agent 11) sind sachlich-präzise, aber wenig bildhaft. Die VT-P-Garantien wirken eher als Aufzählung denn als Erlebnis.
**Maßnahme:** In WERBETEXT_SCHABLONEN ein Beispiel/Regel ergänzen, wie die Balance-System-Sicherheit sinnlich statt listenartig kommuniziert wird (konkrete Alltagsszene statt reiner Aufzählung).

### A/B-Varianten systematisch erzeugen
Bisher entstand Variation eher zufällig über unterschiedliche Setups/Tools, nicht gezielt.
**Maßnahme:** Bewusst 2–3 Versionen mit unterschiedlichem Sekundärsystem anfordern (Balance+Dominanz vs. Balance+Stimulanz) und gegeneinander testen. Das Limbic-Framework unterstützt das bereits strukturell.

### Plattform-Spezifika nutzen
WERBETEXT_SCHABLONEN Kapitel 2 enthält bereits Regeln für Facebook/Instagram/LinkedIn/E-Mail/WhatsApp – bisher wurde in der Praxis fast ausschließlich die Facebook-Ad-Länge erzeugt.
**Maßnahme:** Denselben Kernbaustein-Satz gleichzeitig in 3–4 Kanal-Längen anfordern, um das vorhandene Kapitel tatsächlich zu nutzen.

---

## 2. Mittelfristig – braucht neue echte Daten

### Reale Kundenzitate/Cases sammeln
ST-006 (Story) und EW-006 (Einwand) mussten in Beispiel 1B komplett entfallen, da keine echten Referenzen vorliegen. Das ist aktuell die größte inhaltliche Lücke – ohne echte Story fehlt die stärkste Überzeugungsform.
**Maßnahme:** Sobald ein erstes zufriedenes Kundenprojekt mit Freigabe vorliegt, eine neue Datei `ECHTE_KUNDENFAELLE.md` anlegen – analog zur VT-P-Logik in WERBETEXT_SCHABLONEN.

### Echte Kundenzahl ergänzen, sobald verfügbar
VT-006 (zahlenbasierter Sozialbeweis) bleibt aktuell gesperrt, da keine verifizierte Kundenzahl vorliegt.
**Maßnahme:** Sobald eine belastbare Zahl existiert, Wechsel von VT-P zurück auf VT-006 mit echten Werten – reine Datenfrage, keine strukturelle Änderung nötig.

---

## 3. Strukturell – für Konsistenz über viele Läufe

### Wiederholungstests durchführen
Agent 11 ist bisher ein einzelner guter Lauf. Ob die Dateikorrekturen (insb. Schritt 9 „Vollständigkeits-Stopp" und VT-P-Nutzung) zuverlässig greifen oder nur zufällig einmal gut liefen, ist offen.
**Maßnahme:** 5–10 Wiederholungen mit identischem Prompt und identischen Dateien durchführen und auf Konsistenz prüfen. **Priorität:** Das ist der wichtigste nächste Schritt, um zu verifizieren, ob ein verlässliches System vorliegt – nicht nur ein guter Einzeltreffer.

### Automatisierte statt nur promptbasierte Prüfung
Schritt 9 (Platzhalter-Check) verlässt sich aktuell darauf, dass der Agent sich selbst daran hält.
**Maßnahme:** Zusätzlich einen technischen Nachbearbeitungsschritt in Q7 einbauen – ein Regex-Check auf offene `[...]`-Platzhalter und auf gesperrte Musterwerte (z. B. „47", „Marie", „Thomas") –, der unabhängig vom Prompt-Verhalten greift.

---

## Priorisierung

Wenn nur ein Punkt zuerst umgesetzt wird: **Wiederholungstests (Abschnitt 3)**. Sie beantworten, ob aktuell ein verlässliches System vorliegt oder nur ein guter Einzeltreffer – das ist Voraussetzung für alle weiteren Optimierungsentscheidungen.
