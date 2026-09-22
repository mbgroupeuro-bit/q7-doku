# Q7 – Prozessmodell

**Version:** 1.5
**Status:** Verbindlich

---

# Zweck

Das Prozessmodell definiert die standardisierte Ausführung sämtlicher Geschäftsprozesse innerhalb von Q7.
Es beschreibt, wie Aufgaben entstehen, bearbeitet, übergeben und abgeschlossen werden.
Die organisatorischen Verantwortlichkeiten werden in L4 beschrieben.
Die technische Umsetzung wird in L8 beschrieben.

---

# Prozessprinzipien

## 1. Prozessorientierung

Alle Arbeiten erfolgen innerhalb definierter Prozesse.

---

## 2. Standardisierung

Jeder Prozess besitzt einen einheitlichen Aufbau.

---

## 3. Nachvollziehbarkeit

Jeder Prozess ist vollständig dokumentiert.

---

## 4. Wiederverwendbarkeit

Prozesse können mehrfach verwendet werden.

---

## 5. Qualität

Jeder Prozess besitzt definierte Qualitätskriterien.

---

## 6. Koordinationspflicht

Jeder Prozess durchläuft die A01-Koordination (Planung & Vorbereitung), bevor eine Fachabteilung Zugriff erhält (siehe L4, Koordinationsebene).
Dieser Schritt ist nicht überspringbar.

---

# Standardprozess

```text
Input
↓
A01-Koordination (Pflichtschritt — Analyse & Zuweisung an Fachabteilung)
↓
Analyse (fachlich, durch zugewiesene Abteilung)
↓
Planung
↓
Bearbeitung
↓
Qualitätsprüfung
↓
Freigabe (Admin — siehe L1 Grundprinzip 9, L2 Grundsatz 8)
↓
Output
```

Freigabe kann durch vorgelagerte Fachprüfung vorbereitet werden.
Die finale Entscheidung liegt immer beim Admin.

Ausführbares Detailmodell (Zustände, Case-Verwaltung, Fehlerpfade, Human-in-the-Loop, Prozessversionen bei laufenden Cases): `04_Doku/Infrastruktur/Q7_Workflow_Detailmodell_v1_2.md`

---

# Prozessbestandteile

Jeder Prozess besteht mindestens aus:

- Prozess-ID
- Prozessname
- Zweck
- Verantwortlicher
- Input
- Output
- Voraussetzungen
- Ablauf
- Qualitätskriterien
- Schnittstellen

---

# Prozess-ID

Jeder Prozess besitzt eine eindeutige Kennung.
Beispiel:

```text
P_001
P_002
P_003
```

---

# Input

Ein Prozess kann gestartet werden durch:

- Inbox
- Benutzer
- API
- E-Mail
- WhatsApp
- Website
- CRM
- ERP
- Automatisierung
- anderen Prozess

---

# Ablauf

Ein Prozess besteht aus einzelnen Prozessschritten.
Jeder Schritt besitzt:

- Ziel
- Verantwortlichen
- Eingaben
- Ausgaben

---

# Übergaben

Übergaben erfolgen ausschließlich innerhalb definierter Prozessschritte.
Direkte Übergaben außerhalb eines Prozesses sind nicht zulässig.

---

# Qualitätskontrolle

Vor Abschluss muss jeder Prozess geprüft werden.
Die Qualitätsprüfung umfasst mindestens:

- Vollständigkeit
- Korrektheit
- Konsistenz
- Einhaltung der Standards

Kritische Prozesse erfordern eine von der Bearbeitung unabhängige Zweitprüfung vor Freigabe (Vier-Augen-Prinzip, siehe Q7-M-021).
Welche Prozesse als kritisch gelten, wird je Prozess in der jeweiligen P_xxx-Definition festgelegt.

---

# Fehler & Eskalation

Fehlerhafte oder abgebrochene Prozesse werden eskaliert (siehe Prozessstatus „Abgebrochen").
Eskalationsregeln (Instanzen, Fristen) werden je Prozess in der jeweiligen P_xxx-Definition festgelegt (siehe Q7-M-026).

**Geschlossen (Q7-M-008):** Das Detailmodell zum Datenfluss, ergänzend zum linearen High-Level-Standardprozess hier, ist als eigenes Dokument angelegt: `04_Doku/Infrastruktur/Q7_Workflow_Detailmodell_v1_2.md`. Es definiert die maschinenlesbare State Machine, das Case-Modell und die generischen Fehler-/Eskalationsmechanismen.

---

# Output

Jeder Prozess erzeugt mindestens ein Ergebnis.
Beispiele:

- Dokument
- Angebot
- Analyse
- Bericht
- Präsentation
- Bild
- Datensatz

Alle Ergebnisse werden zentral im Output gespeichert.

---

# Prozessstatus

Jeder Prozess besitzt einen Status.
Beispiele:

- Neu
- In Bearbeitung
- Wartend
- In Prüfung
- Freigegeben
- Abgeschlossen
- Abgebrochen

Vollständige State Machine mit allen Übergängen: siehe Q7_Workflow_Detailmodell_v1_2.md, Abschnitt „Zustandsmodell".

---

# Dokumentation

Jeder Prozess wird vollständig protokolliert.
Dokumentiert werden mindestens:

- Start
- Bearbeitung
- Änderungen
- Freigaben
- Abschluss

---

# Akzeptanzkriterien

- Kein Prozess-Log zeigt einen Fachabteilungs-Zugriff ohne vorherigen A01-Koordinationsschritt.
- Jede Freigabe eines Prozesses ist im Protokoll eindeutig dem Admin zugeordnet (nicht einem Agenten oder einer Fachabteilung).
- Jeder als "kritisch" markierte Prozess weist im Protokoll eine von der Bearbeitung unabhängige Zweitprüfung nach.
- Jeder Prozessstatus "Abgebrochen" ist mit einem Eskalationseintrag verknüpft.
- Jede P_xxx-Prozessdefinition enthält alle in "Prozessbestandteile" gelisteten Pflichtfelder.

---

# Erweiterbarkeit

Neue Prozesse dürfen ergänzt werden, sofern sie:

- standardisiert aufgebaut sind,
- vorhandene Prozesse nicht duplizieren,
- den Prozessrichtlinien entsprechen.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich das Prozessmodell.
Organisation wird in L4 beschrieben.
Agenten werden in L6 beschrieben.
Technik wird in L8 beschrieben.

---

# Änderungsregel

Neue Prozesse müssen den definierten Prozessstandards entsprechen.
Bestehende Prozesse dürfen nur geändert werden, wenn Auswirkungen auf andere Prozesse geprüft wurden.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (Ausgangsfassung)
- v1.1 (08.07.2026): Prozessprinzip 6 "Koordinationspflicht" ergänzt. Standardprozess um Hermes-Pflichtschritt erweitert. Freigabe-Schritt mit GF-Instanz präzisiert. Vier-Augen-Hinweis ergänzt (Q7-M-021). Abschnitt „Fehler & Eskalation" neu (Q7-M-026). Q7-M-008-Detailmodell als offener Punkt markiert.
- v1.2 (08.07.2026): Abschnitt "Akzeptanzkriterien" ergänzt (Q7-M-073).
- v1.3 (09.07.2026): Anschlusspunkt-Ergänzung. Q7-M-008 als geschlossen markiert, Verweis auf Q7_Workflow_Detailmodell_v1.md ergänzt (Abschnitte „Standardprozess", „Fehler & Eskalation", „Prozessstatus"). Fußzeile „Offene Anschlusspunkte für L6" entfernt — beide dort genannten Punkte sind seit L6 v1.1/1.2 bereits umgesetzt, Hinweis war veraltet.
- v1.4 (26.07.2026): Terminologie "GF" → "Admin" (Q7-L5-001). "Hermes-Koordination" → "A01-Koordination (Planung & Vorbereitung)" — Klarstellung 3-Ebenen-Modell: A01 = interne Architektur-/Prozessbezeichnung (Ebene 1/2), Kundensicht-Name (Ebene 3, aktuell Platzhalter "Persönlicher Assistent") gehört nicht in interne Prozessdokumente (Q7-L5-002).
- v1.5 (21.09.2026): Querverweise korrigiert (2×): `Q7_Workflow_Detailmodell_v1.md` → `Q7_Workflow_Detailmodell_v1_2.md` (Q7-L5-003). Dokument war beim layerweiten Konsistenz-Check vom 19.09.2026 übersprungen worden — mit dieser Version nachgezogen.
