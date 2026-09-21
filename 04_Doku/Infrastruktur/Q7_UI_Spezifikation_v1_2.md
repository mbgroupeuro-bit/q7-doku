# Q7 – UI-Spezifikation

**Version:** 1.2
**Status:** Verbindlich
**Referenziert von:** L3_Q7_Architektur (Randschicht/Adapter)
**Löst:** Q7-M-061, Q7-M-062, Q7-M-063, Q7-M-064

---

# Zweck

Dieses Dokument vertieft L3 (Randschicht/Adapter, Q7-M-009) um die konkrete Spezifikation der Kunden-UI und deren Trennung von administrativen Funktionen.
Es definiert, welche Systemzustände sichtbar gemacht werden, wie Kunden-UI und Admin-Konsole getrennt sind und wie Freigaben/Eskalationen im UI abgebildet werden — ohne das Black-Box-Prinzip (L1 Grundprinzip 1, L3 Architekturprinzip 3) zu verletzen.

---

# Grundprinzipien

## 1. UI zeigt Zustände, nicht Systemlogik

Die Kunden-UI macht Prozesszustände, Verantwortlichkeiten und Freigabebedarf sichtbar — nie Agentennamen, Prozess-IDs oder interne Systemlogik (siehe L1 Black-Box-Prinzip).

## 2. Rollenbasierte Trennung als Sofortmaßnahme

Kunden-UI und Admin-Konsole sind rollenbasiert getrennte Ansichten derselben Plattform (V2). Eine physisch separate Admin-Konsole (V3) ist spätere Ausbaustufe, nicht Bestandteil dieser Version.

## 3. Keine Agentensteuerung in der Kunden-UI

Direkte Steuerung, Zuweisung oder Konfiguration von Agenten ist ausschließlich in Admin-/Operator-Kontext verfügbar, niemals in der Kunden-UI.

## 4. Freigaben und Eskalationen sind Standardfunktionen

Jeder Case, der eine Freigabe oder Eskalation durchläuft (siehe Q7_Workflow_Detailmodell_v1_2.md), zeigt dies im UI als Standardzustand, nicht als Sonderfall.

---

# Sichtbare Zustände (Kunden-UI)

Ergänzend zum bestehenden GUI-Modell (Inbox → Processing → Output) zeigt die Kunden-UI je Vorgang:

| Anzeige | Quelle | Beispiel |
|---|---|---|
| Status | Case-Zustand (siehe Q7_Workflow_Detailmodell_v1_2.md) | „In Bearbeitung", „Wartet auf Freigabe" |
| Review-Hinweis | Human-in-the-Loop-Entscheidung (Policy Engine) | „Wird fachlich geprüft" (ohne Nennung des prüfenden Agenten) |
| Verantwortlichkeit | Rolle, nicht Agentenname | „In Bearbeitung durch Fachabteilung", „Wartet auf Freigabe durch Admin" |

Es wird ausschließlich die Rolle angezeigt (z. B. „Fachabteilung", „Admin"), niemals der interne Agentencode (z. B. A05-QM) oder Agentenname — dies wäre ein Verstoß gegen das Black-Box-Prinzip.

---

# Trennung Kunden-UI / Admin-Konsole

```text
Q7-Plattform
│
├── Kunden-UI (Standardzugriff)
│     ├── Inbox
│     ├── Processing (Status, Review-Hinweis, Verantwortlichkeit)
│     └── Output
│
└── Admin-/Operator-Konsole (nur interne/berechtigte Rollen)
      ├── Agentensteuerung
      ├── Prozess-IDs, Protokoll (vollständig, inkl. Agentendetails)
      └── Systemkonfiguration
```

Zugriff auf die Admin-Konsole unterliegt derselben Policy-Prüfung wie jeder andere kritische Zugriff (siehe Q7_Policy_Engine_v1_3.md). Die Trennung ist in dieser Version rollenbasiert innerhalb derselben Anwendung; eine physische Trennung (eigene Anwendung/Domain) ist als spätere Ausbaustufe vorgesehen (V3), sobald Kapazität dafür freigegeben wird.

---

# Auswirkung auf bestehendes Frontend

Das bestehende `q7-app`-Frontend (Chat, Input, Spaces, Output, Agenten, Protokoll, Einstellungen) enthält aktuell eine „Agenten"-Seite ohne Rollentrennung.

**Feststellung:** Dies widerspricht Grundprinzip 3 dieses Dokuments (keine Agentensteuerung in der Kunden-UI) sowie L1 Black-Box-Prinzip, sofern diese Seite für Kunden-Rollen sichtbar ist.

**Erforderliche Anpassung:** Die „Agenten"-Seite ist ausschließlich für Admin-/Operator-Rollen freizuschalten oder vollständig in einen separaten Admin-Bereich zu verschieben. Ebenso ist zu prüfen, ob „Protokoll" in der Kunden-Ansicht auf Case-relevante Einträge (Status, Freigaben) reduziert wird — vollständige Agenten-/Systemprotokolle gehören in die Admin-Konsole.

Diese Anpassung ist bei der Anbindung des Frontends an die Q7-Bridge umzusetzen, nicht nachträglich.

---

# Freigaben und Eskalationen im UI

Jeder Case, der den Zustand „Zur Freigabe vorgelegt" oder „Abgebrochen" (mit Eskalation) erreicht (siehe Q7_Workflow_Detailmodell_v1_2.md), zeigt in der jeweils berechtigten Ansicht:

- **Kunden-UI:** neutraler Status („Wartet auf Freigabe", „In Klärung") ohne Eskalationsdetails.
- **Admin-Konsole / Admin-Ansicht:** vollständige Freigabe-Warteschlange mit allen zur Entscheidung nötigen Informationen; vollständige Eskalationsdetails (Ursache, Frist, eskalierte Instanz).

Freigabe- und Eskalationsanzeige sind keine optionalen UI-Elemente, sondern verpflichtender Bestandteil jeder Case-Ansicht in der jeweils berechtigten Rolle.

---

# Akzeptanzkriterien

- Kein Kunden-UI-Screen zeigt einen internen Agentencode oder Agentennamen (Testfall: vollständige Durchsicht aller Kunden-sichtbaren Screens).
- Jeder Case-Status in der Kunden-UI ist eindeutig aus dem Case-Zustandsmodell (Q7_Workflow_Detailmodell_v1_2.md) ableitbar — keine frei erfundenen UI-Zustände.
- Zugriff auf die Admin-Konsole ist für keine Kunden-Rolle möglich, unabhängig von Navigationspfad oder direkter URL.
- Jeder Case im Zustand „Zur Freigabe vorgelegt" ist in der berechtigten Ansicht (Admin) sichtbar, ohne manuelle Suche.
- Die „Agenten"-Seite des bestehenden Frontends ist nachweislich nicht für Kunden-Rollen erreichbar.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich die UI-Spezifikation (Kunden-UI, Admin-Trennung, Zustandsanzeige).
Es vertieft L3 (Randschicht/Adapter) und verweist auf Q7_Workflow_Detailmodell_v1_2.md (Case-Zustände) und Q7_Policy_Engine_v1_3.md (Zugriffskontrolle Admin-Konsole).
Es ersetzt keine Inhalte dieser Dokumente und dupliziert sie nicht (SSOT, siehe L2 Dokumentenregeln).

---

# Änderungsregel

Änderungen an der UI-Spezifikation dürfen das Black-Box-Prinzip (L1, L3) nicht verletzen.
Jede Änderung ist auf Auswirkungen für Kunden-UI und Admin-Konsole getrennt zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (09.07.2026): Ausgangsfassung. Löst Q7-M-061–064.
- v1.1 (27.07.2026): Terminologie „GF"/„Geschäftsführung" → „Admin" durchgängig (Q7-VERT-009). Verweis auf Workflow-Detailmodell auf v1.1 aktualisiert. Verantwortlichkeitsanzeige „Geschäftsführung" → „Admin".
- v1.2 (19.09.2026): „Kunden-UI"/„Kunden-Rolle"/„Kundenfunktion" bewusst unverändert gelassen (Admin-Entscheidung, siehe Konsistenz-Check vom 19.09.2026) — diese Begriffe bezeichnen die Nutzeroberfläche/Zugriffsart, nicht den Lizenznehmer als Entität. Interne Querverweise auf reale Dateinamen mit Minor-Version korrigiert (Q7_Workflow_Detailmodell_v1_2.md, Q7_Policy_Engine_v1_3.md).
