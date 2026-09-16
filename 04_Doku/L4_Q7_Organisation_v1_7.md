# Q7 – Organisationsmodell

**Version:** 1.8
**Status:** Verbindlich

---

# Zweck

Das Organisationsmodell definiert den organisatorischen Aufbau von Q7.
Es beschreibt die Struktur des digitalen Unternehmens sowie die Verantwortlichkeiten aller Organisationseinheiten.
Technische Implementierungen sind nicht Bestandteil dieses Dokuments.

---

# Organisationsprinzipien

## 1. Unternehmensorientierung

Q7 bildet ein reales Unternehmen digital ab.
Jede Organisationseinheit besitzt eine klar definierte Aufgabe.

---

## 2. Klare Verantwortlichkeiten

Jede Aufgabe besitzt genau einen Verantwortlichen.
Doppelte Zuständigkeiten sind nicht zulässig.

---

## 3. Hierarchische Struktur

Das Unternehmen besitzt eine eindeutige Führungsstruktur.
Entscheidungen werden entlang der Organisationsstruktur getroffen.

---

## 4. Spezialisierung

Jede Abteilung besteht aus spezialisierten Rollen.
Jede Rolle besitzt einen klar abgegrenzten Verantwortungsbereich.

---

## 5. Zusammenarbeit

Abteilungen arbeiten standardisiert über definierte Prozesse zusammen.
Direkte Abhängigkeiten zwischen Fachbereichen sind zu vermeiden.

---

# Admin-Einheit (00_Admin)

Die Geschäftsführung (Admin) besitzt eine eigene organisatorische Einheit, strukturell auf derselben Ebene wie die Koordinationsebene, aber keine Abteilung im Sinne des Abteilungsmodells (siehe unten) und kein Agent im Sinne von L6.

```text
00_Admin
├── Eingang
├── Priorität
└── Freigaben
     └── Archiv
```

Diese Einheit bildet die in L1 Grundprinzip 9 und L2 Grundsatz 8 verankerte Letztentscheidungsbefugnis operativ ab: Eingehende Vorgänge, die eine Admin-Freigabe benötigen (siehe L5 Standardprozess, Schritt „Freigabe"), durchlaufen diese Pipeline. Die Admin-Einheit ist kein Agent und unterliegt nicht dem Agentenmodell (L6), da die Letztentscheidung laut L1 nicht delegierbar ist.

---

# Namenskonvention (3-Ebenen-Modell)

Jeder Agent besitzt drei unabhängige Bezeichnungsebenen, die nicht vermischt werden dürfen:

| Ebene | Bedeutung | Beispiel (A01) | Sichtbar für |
|---|---|---|---|
| 1 – Ordner-ID | Technische Struktur, physischer Ordnername | `A01_Planung_Vorbereitung` | System, Doku-Referenzen |
| 2 – Interne Fachbezeichnung | Abteilungsname im Unternehmensmodell | „A01 – Planung & Vorbereitung" | Admin, interne Architektur-/Prozessdoku (L4–L6) |
| 3 – Kundensicht (Black-Box) | Sichtbarer Name im Frontend des Lizenznehmers | „Persönlicher Assistent" (Platzhalter, Markenname offen) | Ausschließlich Lizenznehmer-UI |

Regel: Ebene-3-Namen dürfen nicht in internen Architektur- oder Prozessdokumenten (L1–L8) verwendet werden und umgekehrt — Ebene-1/2-Bezeichnungen (Agentencode, Abteilungsname) dürfen dem Lizenznehmer nie angezeigt werden (siehe Black-Box-Prinzip, L3 Architekturprinzip 3, Master v1.2 Model-Visibility-Ausnahme).

---

# Koordinationsebene

Zwischen Geschäftsführung und den Fachabteilungen besteht eine zentrale Koordinationsfunktion (A01, Funktionsbezeichnung „Planung & Vorbereitung"). Kundenseitig (Ebene 3, Black-Box) wird A01 aktuell als „Persönlicher Assistent" geführt — Platzhalter bis zur Markenname-Entscheidung (Marketing, siehe Namenskonvention unten).
Sie plant, verteilt und überwacht alle Aufträge, bevor Fachabteilungen Zugriff erhalten.

```text
Geschäftsführung (00_Admin)
│
├── A01 – Koordination (Planung & Vorbereitung)
│     │
│     ├── A02 – Marketing
│     ├── A03 – Vertrieb
│     ├── A04 – PM
│     ├── A05 – QM
│     ├── A06 – Verwaltung
│     ├── A07 – Recht
│     ├── A08 – Finanzen
│     ├── A09 – Dokumentation
│     ├── A10 – KI-Center
│     ├── A11 – Systemcontrolling
│     ├── A12 – Zukunftsforschung
│     └── A13 – Personal
│
└── A00 – Stab (direkte Admin-Unterstützung, außerhalb der A01-Koordination; zusätzlich systemweite Überwachungsfunktion, siehe L6 „Systemweite Überwachungsfunktion (A00)")
```

A14 (Sicherheit) steht als cross-funktionale Durchsetzungsebene außerhalb dieser Hierarchie (SEC-GATE, siehe Master Grundprinzip 6 und Entscheidungsregel 9 — inhaltliche SEC-GATE-Definition steht noch aus, siehe Arbeitsliste FS-07-Folgepunkt).

Kein Auftrag erreicht eine Fachabteilung ohne vorherige Koordination durch A01.
Ablaufdetails → L5 Prozessmodell.
Technische Resilienz der Koordinationsfunktion → siehe L6 Agentenmodell, Abschnitt „Technische Resilienz (statt Agenten-Failover)".

---

# Abteilungsmodell

Jede Abteilung folgt derselben Struktur.

```text
Abteilung
├── Leiter
├── Spezialagenten
├── Prozesse
├── Wissen
└── Ergebnisse
```

---

# Standardstruktur jeder Abteilung

Jede Abteilung besitzt mindestens folgende Bestandteile:

```text
01_Grundlagen
│
├── README.md
├── agentenbeschreibung.md
├── regeln.md
├── Skills.md
└── loop.md
```

Optional, je nach Agent:

```text
02_Sub_Agenten        (bei Abteilungen mit Sub-Agenten: A02, A03, A13)
02_Hermes_Prozesse    (nur A01, hohes Prozessvolumen)
```

Das Fachwissen befindet sich **nicht** innerhalb der Abteilung.

---

# Modulare Abteilungen (Buchungsprinzip)

Die Organisationsstruktur ist ein Katalog verfügbarer Abteilungen, kein fixes Set.
Lizenznehmer aktivieren Abteilungen entsprechend ihrer Edition und ihres Bedarfs
(siehe Q7-M-065 Licensing Service, Q7-M-066 Feature Flags/Entitlement, Q7-M-071 Editionen).
Nicht gebuchte Abteilungen sind inaktiv, aber strukturell vordefiniert und jederzeit aktivierbar.

Vertiefung (Mandantenstruktur, Isolationsgrade, Datenräume): `04_Doku/Infrastruktur/Q7_Tenant_Modell_v1.md`
Vertiefung (Licensing Service, Feature-Flag-System, Editionen, IP-Schichten): `04_Doku/Infrastruktur/Q7_Lizenz_und_Deployment_v1.md`

---

# Zentrale Wissensbasis

Frameworks
Expertenwissen
Methoden
Checklisten
Vorlagen
Best Practices

werden zentral im Wissensmodell verwaltet.
Alle Abteilungen greifen auf dieselbe Wissensbasis zu.

---

# Führungsprinzip

Jede Abteilung besitzt genau einen Leiter.
Der Leiter

- priorisiert Aufgaben
- koordiniert Ressourcen
- überwacht Qualität
- verantwortet Ergebnisse

---

# Spezialagenten

Spezialagenten besitzen keine Führungsverantwortung.
Sie bearbeiten ausschließlich Aufgaben ihres Fachgebiets.

---

# Organisationsregeln

- Eine Aufgabe besitzt genau einen Verantwortlichen.
- Wissen wird nicht mehrfach gespeichert.
- Prozesse sind organisationsübergreifend nutzbar.
- Abteilungen kommunizieren ausschließlich über definierte Prozesse.
- Rollen- und Berechtigungslogik (RBAC/ABAC) → siehe L6 Agentenmodell.
- Die Admin-Einheit (00_Admin) ist von der Abteilungsstruktur ausgenommen (siehe Abschnitt „Admin-Einheit").

---

# Akzeptanzkriterien

- Jede Abteilung hat genau einen benannten Leiter — keine Abteilung ohne Leiter, keine doppelte Leitung.
- Kein Auftrag erreicht eine Fachabteilung ohne vorherige A01-Koordination (prüfbar über Prozessprotokoll, siehe L5).
- Jede aktive Abteilung besitzt die vollständige Standardstruktur (README.md, agentenbeschreibung.md, regeln.md, Skills.md, loop.md).
- Nicht gebuchte Abteilungen sind im System als inaktiv erkennbar, aber strukturell vorhanden (kein manuelles Neuanlegen bei Buchung nötig).
- Kein Wissensinhalt ist innerhalb einer Abteilung dupliziert abgelegt.
- Die Admin-Einheit (00_Admin) ist eindeutig von A00–A14 unterscheidbar und nicht Teil des Agenten-RBAC (siehe L6).

---

# Erweiterbarkeit

Neue Abteilungen können hinzugefügt werden, sofern sie:

- einen klaren Unternehmenszweck besitzen,
- keine bestehenden Verantwortlichkeiten überschneiden,
- den Organisationsstandards entsprechen.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich die Organisationsstruktur von Q7.
Prozesse werden in L5 beschrieben.
Agenten werden in L6 beschrieben.
Wissen wird in L7 beschrieben.
Technische Komponenten werden in L8 beschrieben.

---

# Änderungsregel

Organisationsänderungen dürfen bestehende Verantwortlichkeiten nicht verletzen.
Jede Änderung ist auf Auswirkungen für Prozesse, Agenten und Wissen zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (Ausgangsfassung)
- v1.1 (08.07.2026): Koordinationsebene (Hermes) ergänzt. Buchungsprinzip ergänzt (Q7-M-065/066/071). Verweise auf L6 für Failover und RBAC/ABAC ergänzt. GF-Freigabe in Änderungsregel ergänzt.
- v1.2 (08.07.2026): Abschnitt "Akzeptanzkriterien" ergänzt (Q7-M-073).
- v1.3 (09.07.2026): Anschlusspunkt-Ergänzung. Fußzeile „Offene Anschlusspunkte für L6" entfernt. Verweise auf Q7_Tenant_Modell_v1.md und Q7_Lizenz_und_Deployment_v1.md ergänzt.
- v1.4 (10.07.2026): Agentenmodell-Korrektur nach GF-Entscheidung (reale Struktur 02_KI-UNTERNEHMEN verbindlich, siehe Q7_KLAERUNGSBEDARF_Agentenmodell.md). Koordinationsfunktion von generisch „Hermes" auf „A01 – Planung & Vorbereitung" präzisiert (Hermes als informelle Zusatzbezeichnung, bestätigt). Vollständige Abteilungsliste A02–A13 mit realen Namen ergänzt (vorher nur Beispiele). Neuer Abschnitt „GF-Einheit (00_GF)" ergänzt (GF-Entscheidung: als eigene Organisationseinheit dokumentieren). Pfadschreibweise auf `04_Doku` korrigiert (vorher `04_Doku`).
- v1.5 (10.07.2026): A00-Rolle um systemweite Überwachungsfunktion ergänzt (GF-bestätigt: A00 überwacht alle Agenten inkl. A01, vollständig GF-transparent, siehe L6 v1.4 für Details). Kein Widerspruch zu L1 Grundprinzip 9/L2 Grundsatz 8, da keine eigenständigen Entscheidungen durch A00 getroffen werden.
- v1.6 (26.07.2026): Terminologie + Struktur "GF-Einheit (00_GF)" → "Admin-Einheit (00_Admin)" durchgängig (Q7-L4-001, realer Ordner bestätigt 00_Admin). A02–A13-Abteilungsliste geprüft und bestätigt — unverändert korrekt (Q7-L4-002, Screenshot-Abgleich 26.07.2026: A05_QM, A13_Personal). Abschnitt "Standardstruktur jeder Abteilung" auf reales 5-Dateien-Schema aktualisiert (README, agentenbeschreibung, regeln, Skills, loop) — `01_Input`/`03_Output` entfernt (real gelöscht), optionale `02_Sub_Agenten`/`02_Hermes_Prozesse` ergänzt (Q7-L4-003).
- v1.7 (26.07.2026): Neuer Abschnitt "Namenskonvention (3-Ebenen-Modell)" ergänzt — trennt Ordner-ID, interne Fachbezeichnung und Kundensicht(Black-Box)-Name je Agent. "Hermes"-Referenz in Koordinationsebene korrigiert (Missverständnis aufgelöst: kein Produktname, sondern Verwechslung mit "Harness Agent"); Kundensicht-Platzhalter jetzt "Persönlicher Assistent". Verweis auf Q7_KLAERUNGSBEDARF_Agentenmodell.md entfernt (Klärung abgeschlossen).
- v1.8 (26.07.2026): Referenz auf L6-Abschnitt "Ausfallsicherheit (Failover)" korrigiert auf "Technische Resilienz (statt Agenten-Failover)" (Q7-L6-004: Backup-Agenten-Konzept in L6 durch technische Resilienz in `rufeKIAn()` ersetzt).
- v1.9 (15.09.2026): FS-07 - Kaputter Verweis 'siehe L6, SEC-GATE' korrigiert auf tatsaechliche Fundstellen in Master (Grundprinzip 6, Entscheidungsregel 9). Festgestellt: SEC-GATE wird in L1/L2/L6/Master an keiner Stelle inhaltlich definiert, nur erwaehnt - separater Backlog-Punkt angelegt.
