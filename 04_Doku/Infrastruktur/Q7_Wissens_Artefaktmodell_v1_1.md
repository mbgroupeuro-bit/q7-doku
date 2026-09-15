# Q7 – Wissens-Artefaktmodell

**Version:** 1.1
**Status:** Verbindlich
**Referenziert von:** L7_Q7_Wissensmodell (Wissensobjekte / Erfahrungen)
**Löst:** Q7-M-035, Q7-M-038, Q7-M-039, Q7-M-040, Q7-M-041, Q7-M-042, Q7-M-043, Q7-M-044, Q7-M-045, Q7-M-046

---

# Zweck

Dieses Dokument vertieft L7 um ein artefaktbasiertes Modell, das Wissen, Memory, Erfahrung und Policy als eigenständige, unterscheidbare Artefaktklassen führt, sowie um Versionierung, Retrieval, Konfliktregelung und Nachweisbarkeit (Evidence).
Es ersetzt nicht die in L7 definierten Grundprinzipien (zentrale Wissensbasis, Flachstruktur, Metadaten-Kategorisierung), sondern macht sie artefaktscharf umsetzbar.

---

# Grundprinzipien

## 1. Artefaktklassen statt Dokumentenmischung

Knowledge, Memory, Experience und Policy sind getrennte Artefaktklassen mit eigenen Regeln. Ein Artefakt gehört immer genau einer Klasse an.

## 2. Verbindlichkeit ist Pflichtattribut

Jedes Knowledge-Artefakt trägt eine von vier Verbindlichkeitsstufen: verbindlich, empfohlen, informativ, experimentell.

## 3. Erfahrung ist kein Wissen

Erfahrung entsteht aus praktischer Anwendung (siehe L6, Erfahrungen) und wird als eigenes Artefakt mit einem Confidence-Wert geführt. Erst nach Prüfung und Freigabe (siehe L7 Lebenszyklus) kann eine Erfahrung zu einem Knowledge-Artefakt werden.

## 4. Jede Version ist nachvollziehbar

Jedes Artefakt jeder Klasse wird in der Artifact Version Registry geführt (siehe Abschnitt „Version Registry").

## 5. Jeder Output ist rückverfolgbar

Zu jedem von einem Agenten erzeugten Output existiert ein Execution Evidence Record, der die verwendeten Artefaktversionen dokumentiert (siehe Q7-M-035, Q7-M-045).

---

# Artefaktklassen

| Klasse | Inhalt | Beispiele | Lebenszyklus |
|---|---|---|---|
| Knowledge | Verbindliches/empfohlenes Fachwissen | Frameworks, SOPs, Standards, Gesetze | siehe L7 Lebenszyklus |
| Memory | Kontextgebundene Zwischenstände eines laufenden Case | Case-Notizen, Zwischenergebnisse | an Case-Lebensdauer gebunden (siehe Q7_Workflow_Detailmodell_v1.1.md) |
| Experience | Aus Loops entstandene Erfahrungswerte (siehe L6) | „Vorgehen X führte in Fällen Y häufiger zu Nacharbeit" | Entstehung → Prüfung → ggf. Übernahme als Knowledge |
| Policy | Regeln der Policy Engine | Zugriffsregeln, Enforcement-Bedingungen | siehe Q7_Policy_Engine_v1.2.md |

Jede Klasse wird separat in der Wissensbasis abgelegt (weiterhin flach, siehe L7 Wissensstruktur), unterschieden über das Metadatenfeld `Artefaktklasse`.

---

# Verbindlichkeitsstufen (nur Knowledge-Artefakte)

| Stufe | Bedeutung |
|---|---|
| Verbindlich | Muss angewendet werden; Abweichung erfordert Admin-Freigabe |
| Empfohlen | Soll angewendet werden; Abweichung ist zu begründen und zu protokollieren |
| Informativ | Kontextwissen ohne Anwendungspflicht |
| Experimentell | Noch nicht validiert; Nutzung nur mit erhöhter Prüfpflicht |

---

# Metadatenmodell

Ergänzend zu den in L7 „Wissensobjekte" gelisteten Pflichtfeldern führt jedes Artefakt:

- Artefaktklasse (Knowledge / Memory / Experience / Policy)
- Verbindlichkeitsstufe (nur Knowledge)
- Confidence-Wert (nur Experience, 0–100 %)
- Authority Level (siehe „Konfliktregelung")
- Gültigkeitszeitraum
- Scope (z. B. mandantenweit, abteilungsweit, prozessspezifisch)

---

# Version Registry

Jedes Artefakt wird bei jeder inhaltlichen Änderung als neue Version geführt, nie überschrieben. Die Registry führt je Artefakt-ID:

- alle Versionen mit Zeitstempel
- Autor/auslösender Agent
- Änderungsgrund
- Freigabestatus je Version (siehe L7 Lebenszyklus)

Aktive Prozesse referenzieren immer eine konkrete Artefaktversion, nicht „die aktuelle Version" (siehe Bezug zu Q7_Workflow_Detailmodell_v1.1.md, Prozessversionen).

---

# Execution Evidence Record

Zu jedem von einem Agenten erzeugten Output wird automatisch ein Evidence Record erzeugt mit:

- Case-ID (siehe Q7_Workflow_Detailmodell_v1.1.md)
- verwendete Artefakt-IDs inkl. exakter Version
- verwendete Tools (siehe Q7-M-037 Tool Gateway)
- ausführender Agent
- Zeitstempel

Der Evidence Record ist Teil der Prozessdokumentation (siehe L5, Dokumentation) und ermöglicht die vollständige Rekonstruktion, auf welcher Wissensgrundlage ein Ergebnis entstand.

---

# Retrieval-Modell

Der Zugriff auf Wissen erfolgt hybrid, nicht ausschließlich über eine Methode:

- **Metadaten-Filter** (Artefaktklasse, Verbindlichkeit, Scope, Gültigkeit) — Vorfilterung
- **Volltextsuche** — für exakte Begriffe, IDs, Zitate
- **Vektorindex** — für semantische Ähnlichkeit

Die Vorfilterung über Metadaten erfolgt immer vor Volltext-/Vektorsuche, um Scope- und Berechtigungsgrenzen (siehe L6 RBAC, Q7_Policy_Engine_v1.2.md) einzuhalten, bevor inhaltlich gesucht wird.

---

# Konfliktregelung (widersprüchliches Wissen)

Bei inhaltlich widersprüchlichen Artefakten entscheidet, in dieser Reihenfolge:

1. **Authority Level** — höhere Autorität sticht (z. B. Admin-freigegebenes Knowledge-Artefakt vor Experience-Artefakt)
2. **Gültigkeit** — aktuelleres, noch gültiges Artefakt sticht bei gleichem Authority Level
3. **Scope** — spezifischerer Scope sticht bei gleichem Authority Level und gleicher Gültigkeit (z. B. mandantenspezifische Regel vor plattformweiter Regel)

Kann ein Konflikt nicht eindeutig anhand dieser Reihenfolge aufgelöst werden, wird er eskaliert (siehe Q7_Workflow_Detailmodell_v1.1.md, Fehlerpfade & Eskalation) statt automatisch entschieden.

---

# Qualitätsprüfung

Ergänzend zu L7 „Qualität" gilt je Artefaktklasse eine Review-Checkliste mit mindestens:

- Vollständigkeit der Pflichtfelder (siehe „Metadatenmodell")
- Plausibilität des Authority Level / der Verbindlichkeitsstufe
- Duplikatsprüfung gegen bestehende Artefakte derselben Klasse
- bei Experience: Mindestanzahl an Beobachtungen vor Confidence-Vergabe

Prüfkriterien werden je Artefaktklasse in einer eigenen Checkliste geführt (kein einheitliches Kriterienset für alle vier Klassen, da Anforderungen strukturell unterschiedlich sind).

---

# Akzeptanzkriterien

- Jedes Artefakt trägt eindeutig genau eine Artefaktklasse — keine Mischformen.
- Jedes Knowledge-Artefakt trägt eine der vier definierten Verbindlichkeitsstufen.
- Jede Artefaktänderung erzeugt eine neue Version in der Version Registry; keine Version wird überschrieben.
- Zu jedem erzeugten Output existiert ein vollständiger Execution Evidence Record mit exakten Artefaktversionen.
- Jede Retrieval-Anfrage durchläuft nachweislich zuerst die Metadaten-Vorfilterung, bevor Volltext-/Vektorsuche greift.
- Jeder erkannte Wissenskonflikt ist im Protokoll eindeutig einer der drei Konfliktregeln oder einer Eskalation zugeordnet.
- Keine Experience wird ohne Prüfung und Freigabe automatisch zu einem Knowledge-Artefakt.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich das Artefaktmodell, die Version Registry und den Execution Evidence Record.
Es vertieft L7 (Wissensmodell) und verweist auf L6 (Erfahrungen, RBAC), Q7_Policy_Engine_v1.2.md (Retrieval-Berechtigung) und Q7_Workflow_Detailmodell_v1.1.md (Case-/Evidence-Bezug).
Es ersetzt keine Inhalte dieser Dokumente und dupliziert sie nicht (SSOT, siehe L2 Dokumentenregeln).

---

# Änderungsregel

Änderungen am Artefaktmodell dürfen die in L7 definierten Grundprinzipien (zentrale Wissensbasis, Flachstruktur, Konsistenz) nicht verletzen.
Jede Änderung ist auf Auswirkungen für bestehende Artefakte und deren Versionshistorie zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (09.07.2026): Ausgangsfassung. Löst Q7-M-035–046.
- v1.1 (27.07.2026): Terminologie „GF" → „Admin" (Q7-VERT-010). Verbindlichkeitsstufe „Abweichung erfordert GF-Freigabe" → „Admin-Freigabe". Verweise auf Workflow-Detailmodell und Policy Engine auf v1.1/v1.2 aktualisiert.
