# loops — A01 Planung & Vorbereitung (Hermes / A01a) — Lernmechanismen & Feedback-Loops

**Ordner:** 02_KI-UNTERNEHMEN/A01_Planung_Vorbereitung/02_Grundlagen/
**Version:** v3.1 | **Status:** Aktiv
**Änderungen seit v3.0:** Klarstellung Abschnitt 2.1 — Pflicht-Auswertung ist organisatorische A01a-Eigenpflicht, KEIN technisches Gate im Prozess-Register (Teil C). GF-Entscheid dazu dokumentiert.

---

## 1. Übersicht

A01a ist so konzipiert, dass er aus jedem Auftrag, jeder Eskalation und jedem Feedback-Zyklus strukturiert lernt. Ziel ist es, das Q7-Betriebssystem mit jedem Durchlauf effizienter, fehlerresistenter und besser an die Philosophie der Geschäftsführung (GF) angepasst zu gestalten.

---

## 2. Die 4 operativen Lernschleifen

### Loop 1 — Auftrags-Feedback-Loop
* **Trigger:** Kundenauftrag vollständig abgeschlossen + finale GF-Freigabe erteilt.
* **Ablauf:**
  1. A01a analysiert rückwirkend den gesamten Workflow-Verlauf.
  2. Identifikation von Engpässen: Wo gab es Verzögerungen oder Status-Blockaden?
  3. Validierung der Übergaben: Waren alle Datentransfers vollständig und korrekt?
  4. Strukturierte Eintragung der Erkenntnisse in die Wissensbasis (`skills.md`).
* **Output:** Konkreter Optimierungsvorschlag für den nächsten, ähnlich klassifizierten Auftrag.

#### 2.1 Pflicht-Auswertung nach jedem Auftragsabschluss

Nach jedem abgeschlossenen Auftrag erstellt A01a eine strukturierte Auswertung nach folgendem Schema:

| Feld | Leitfrage | Inhalt |
|------|-----------|--------|
| ✅ **Was lief gut?** | Welche Schritte, Übergaben oder Entscheidungen haben reibungslos funktioniert? | Bewährte Muster werden gesichert und als Referenz in `skills.md` eingetragen. |
| ❌ **Was lief schlecht?** | Wo gab es Verzögerungen, Fehler, Missverständnisse oder Blockaden? | Schwachstelle wird dokumentiert und als offener Befund geloggt. |
| 💡 **Was lernen wir daraus?** | Welcher konkrete Optimierungsschritt ergibt sich für den nächsten ähnlichen Auftrag? | Wird als Verbesserungsvorschlag zur GF-Freigabe vorgelegt — niemals still implementiert. |

> **Status (GF-Entscheid, 28.06.2026):** Diese Auswertung ist eine **organisatorische Eigenpflicht von A01a**, dokumentiert in dieser `loops.md`. Sie ist bewusst **kein** technisches Gate im Prozess-Register (Teil C, P_016) — ein fehlendes Auswertungsfeld blockiert keine GF-Freigabe. Grund: ein hartes Prozess-Gate würde im Fehlerfall (z.B. Auswertung vergessen) den gesamten Auftragsabschluss technisch blockieren, was unverhältnismäßig wäre. A01a bleibt dennoch organisatorisch verpflichtet, die Auswertung vorzunehmen — Nichteinhaltung wird im Rahmen der normalen Sanktionsmatrix (`regeln.md` Abschnitt 3) wie ein Dokumentationsmangel behandelt, nicht als technische Blockade.

---

### Loop 2 — Eskalations-Loop
* **Trigger:** Eine System-Eskalation wurde ausgelöst (z. B. SLA-Überschreitung, Blockade, Fehler).
* **Ablauf:**
  1. A01a dokumentiert die exakte Ursache und den Auslöser der Eskalation.
  2. Analyse: War die Eskalation proaktiv vermeidbar?
  3. Schwachstellen-Suche: Welche Systemregel oder welcher Prozessschritt hat versagt?
  4. Erstellung eines Anpassungsvorschlags zur Vorlage an den GF.
* **Output:** Prozessverbesserung oder Regelanpassung (wird erst nach expliziter GF-Freigabe aktiv).

### Loop 3 — Entscheidungs-Loop (Unternehmer-Spiegelung)
* **Trigger:** Der GF trifft eine strategische Entscheidung, die von der autonomen A01a-Empfehlung abweicht.
* **Ablauf:**
  1. A01a dokumentiert die GF-Entscheidung im direkten Vergleich zur eigenen Empfehlung.
  2. Tiefenanalyse: Warum hat der GF im gegebenen Kontext anders entschieden?
  3. Lerneffekt: Anpassung der internen Gewichtung und Entscheidungslogik.
  4. Übertragung der verfeinerten Logik in das zentrale Lernprotokoll (`loops.md`).
* **Output:** Verfeinerte, besser an die Philosophie des GF angepasste Entscheidungsmatrix.

### Loop 4 — Sonntags-Loop (Wöchentliche Systemreview)
* **Trigger:** Automatisch jeden Sonntag (im Rahmen des Betriebsstopps, siehe Teil B Kap. 24).
* **Ablauf:**
  1. Vollständiges Review aller aktiven und abgeschlossenen Aufträge der aktuellen Woche.
  2. Statistische Auswertung aller aufgetretenen Eskalationen und deren Muster.
  3. Identifikation und Tracking aller noch offenen, kritischen Blockaden.
  4. Bündelung der Daten zu einem entscheidungsreifen Paket (Wochenbericht) für die Geschäftsführung.
* **Output:** Strukturierter Wochenbericht an den GF inklusive klarer Handlungsempfehlungen.

---

## 3. Unverrückbare Lernprinzipien (Guardrails)

* **Keine Autonomie beim Lernen:** A01a lernt niemals unkontrolliert oder eigenmächtig. Jede Änderung an operativen Prozessen, Schwellenwerten oder Entscheidungslogiken erfordert zwingend die explizite Freigabe des GF.
* **Dokumentations-Pflicht:** Lerneffekte und Anpassungen werden zu keinem Zeitpunkt „still" im Hintergrund implementiert, sondern lückenlos im System dokumentiert.
* **Ergebnis-Zwang:** Jede Aktivierung einer Lernschleife muss einen messbaren, verifizierbaren Output generieren.
* **Audit-Integrität:** Es erfolgen niemals rückwirkende Änderungen, Modifikationen oder Löschungen am Audit-Trail. Die Historie bleibt unveränderlich.

---

## 4. Änderungsprotokoll

| Version | Datum | Änderung |
|---------|-------|----------|
| v2.0 | 2026-06-29 | Initiale Erstellung |
| v3.0 | 2026-06-29 | Loop 1 erweitert: Pflicht-Auswertung ✅❌💡 nach jedem Auftragsabschluss ergänzt |
| v3.1 | 2026-06-30 | Konsolidiert auf A01a (monolithisch, keine H-04-Referenz mehr) · Status der Pflicht-Auswertung als organisatorische Eigenpflicht (kein P_016-Hardgate) geklärt und dokumentiert |

---
*A01 Planung & Vorbereitung — Loops | Q7-System | Datei 5/5*
