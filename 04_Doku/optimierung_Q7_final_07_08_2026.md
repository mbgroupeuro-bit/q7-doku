# Q7 — Optimierungsvorschläge (final, konsolidiert)
**Datum:** 07.08.2026
**Ersetzt:** `optimierung_Q7_07_08_2026.md` + `optimierung_Q7_vertiefung_07_08_2026.md` (beide Inhalte hier zusammengeführt, korrigiert und aktualisiert)
**Quellen:** mattpocock/skills (ZIP), mattpocock/sandcastle, mattpocock/dictionary-of-ai-coding, mattpocock/evalite, mattpocock GitHub-Kanal gesamt
**Status:** Zur Freigabe durch Admin — keiner der Punkte ist umgesetzt

---

## 0. Namenskorrektur (Grundlage für alles Weitere)

**Entscheidung (07.08.2026):** Eigenname der zentralen Koordinationsabteilung ist ab sofort **ausschließlich A01**. "Hermes", "Tamza Assistent" und "Hannes" sind verworfen/ungültig.

- A01 übernimmt: Planung/Vorbereitung aller Tätigkeiten, Weiterleitung an Fachagenten, Organisation des Gesamtablaufs.
- Die technische Einordnung (Agent/Harness/etc.) läuft **nicht** über den Eigennamen, sondern über die agenteneigenen Dateien.
- **Verifizierte reale Struktur** (Screenshot 07.08.2026): `A0X_Planung_Vorbereitung/01_Grundlagen/` mit Dateien `A0X_agentenbeschreibung.md`, `A0X_loop.md`, `A0X_README.md`, `A0X_regeln.md`, `A0X_Skills.md` — pro Agent (A00–A14).

**Konsequenz für L1–L8-Doku:** Wie bei GF→Admin muss "Hermes" in allen L1–L8-Dokumenten durch "A01" ersetzt werden. Sollte in den ohnehin offenen Punkt "GF→Admin-Terminologie nachziehen" (Backlog) mit aufgenommen werden — gleiche Baustelle, gleicher Aufwand.

**Wichtiger Hinweis zur Quellenlage:** Eine separat erhaltene Zusammenfassung (NestJS/LangGraph-Backend, Agentennamen "Tamza"/"Hannes", Ordnerstruktur `/identity /boundaries /skills /knowledge`, Vektordatenbank pgvector/Qdrant) wurde gegen den verifizierten Screenshot geprüft und **weicht ab** — weder die Namen noch die exakte Ordnerstruktur stimmen mit dem realen Q7-Stand überein. Diese Zusammenfassung gilt **nicht** als bestätigter Q7-Stand. Details siehe Abschnitt 8.

---

## 1. Primärquelle-Regel (Governance, L2)

**Problem:** Seit 19.07.2026 entwickelt sich `q7-app` unabhängig von der ruhenden L1–L8-Doku. Dadurch können Code und Doku auseinanderlaufen — bereits eingetreten bei `pruefeMitA14()` ("A14 (Sicherheit)" vs. Doku-Stand A14 = Unternehmensentwicklung) und jetzt erneut beim A01-Namen ("Hermes" vs. "A01").

**Vorschlag — Ergänzung zu L2 Grundsatz 8:**
> *"Bei Widerspruch zwischen Code und L1–L8-Dokumentation gilt der Code als aktueller Stand. Die Dokumentation ist als veraltet zu kennzeichnen und nachzuziehen — nicht umgekehrt."*

**Aufwand:** Ein Satz in L2. Kein Code-Eingriff.

---

## 2. Triage-Statemaschine (Mängelregister, Phase 5)

**Problem:** Mängelregister läuft aktuell im Freitext-Sammelmodus.

**Vorschlag — zwei orthogonale Pflichtachsen pro Eintrag:**

| Achse | Werte |
|---|---|
| Kategorie | `bug` \| `enhancement` |
| Status | `needs-triage` → `needs-info` → `ready-for-agent` → `ready-for-human` \| `wontfix` |

**Beispiel-Einordnung:** Paralleler-Fetch-Timeout in `ChatWindow.tsx` (~Zeile 288) → `bug` / `ready-for-agent`.

**Aufwand:** Reine Prozessstruktur, kein Code-Eingriff.

---

## 3. Fail-Safe statt Fail-Closed (SEC-GATE / `rufeKIAn()`)

**Problem:** Aktuelles Verhalten bei Unsicherheit ist harte Blockade + Fehlermeldung. Bereits aufgetreten beim `OPENROUTER_MODEL_A14`-Bug (auskommentierte Env-Variable blockierte alle Hermes/A01-Antworten).

**Vorschlag:** Bei nicht eindeutig entscheidbarer Sicherheitslage: Prüfung überspringen + protokollieren, statt harter Block. Harter Block bleibt reserviert für eindeutig erkannte Verstöße.

**Aufwand:** Anpassung der Fehlerbehandlung in `pruefeMitA14()` — sicherheitsrelevant, vor Umsetzung gesondert zu prüfen.

---

## 4. Domain Modeling — CONTEXT.md + ADRs

**Problem:** Begriffe wie "Admin", "A01" existieren verteilt (Chat-Historie, L-Doku-Fließtext, Agenten-eigene Dateien). Kein zentrales, systemweites Nachschlage-Artefakt für Begriffe, die *mehrere* Agenten betreffen. Die vorhandenen `A0X_agentenbeschreibung.md`-Dateien decken das nur pro Agent ab, nicht systemweit (z. B. wo wird "Admin" für alle A00–A14 einheitlich definiert?).

**Vorschlag:**

**a) Systemweite `CONTEXT.md`** (auf L1–L8-Ebene, nicht pro Agent) — reines Glossar:
```md
**Admin**:
Alleiniger Gründer, Betreiber und Entscheider von Q7. Nicht delegierbare Autorität (HART-Prinzip).
_Avoid_: GF, Geschäftsführer

**A01**:
Zentrale Koordinationsabteilung: Planung/Vorbereitung aller Tätigkeiten, Weiterleitung an Fachagenten, Organisation des Gesamtablaufs.
_Avoid_: Hermes, Tamza Assistent, Hannes, Koordinator
```
Format: Begriff, 1–2 Sätze WAS es ist, `_Avoid_`-Liste für verworfene/veraltete Synonyme.

**b) ADRs** — nur bei: schwer umkehrbar + überraschend ohne Kontext + echter Trade-off. Kandidaten:
- `0001-cloud-first-vor-local.md`
- `0002-rufeKIAn-pflichtabstraktion.md`
- `0003-a01-als-alleiniger-eigenname.md` (neu, aus heutiger Entscheidung)

**Aufwand:** Format übernehmen, nicht Ordnerstruktur — bestehende `A0X_*.md`-Dateien bleiben pro Agent, `CONTEXT.md` ergänzt systemweit.

---

## 5. Codebase Design — Vokabular für Module/Seams/Adapter

**Problem:** Keine einheitliche Sprache dafür, ob eine neue Komponente (z. B. Q7-ERP-Connector) ein sauberer Adapter ist oder nur durchreicht.

**Vorschlag — feste Begriffe:**

| Begriff | Bedeutung | Q7-Beispiel |
|---|---|---|
| Modul | Interface + Implementierung | `rufeKIAn()` |
| Interface | Alles, was ein Aufrufer wissen muss | Signatur von `rufeKIAn()` |
| Seam | Stelle, an der Verhalten austauschbar ist | Der `rufeKIAn()`-Aufrufpunkt |
| Adapter | Konkrete Umsetzung an einem Seam | OpenRouter heute, Ollama später |
| Deep Module | Kleines Interface, viel Implementierung dahinter | `rufeKIAn()` korrekt umgesetzt |

**Deletion-Test:** Modul gedanklich löschen — taucht Komplexität bei Aufrufern wieder auf, war es kein Pass-Through.

**Aufwand:** Reine Sprachkonvention, anwendbar bei nächster Connector-Entscheidung.

---

## 6. Context Pointer statt Vollausformulierung (überarbeitet)

**Ursprüngliches Problem:** `pruefeMitA14()` trägt einen eigenen, widersprüchlichen Namen statt auf die SEC-GATE-Definition zu verweisen.

**Präzisierung nach Screenshot-Abgleich:** Die bestehende `A0X_*.md`-Struktur (README/regeln/Skills/loop/agentenbeschreibung getrennt) erfüllt das Context-Pointer-Prinzip pro Agent bereits strukturell gut — getrennte Dateien statt einem Monolithen ist genau die richtige Richtung. Der eigentliche Rest-Bedarf liegt **nicht** in der Agentenstruktur, sondern in **Code-Funktionsnamen**, die auf agentenübergreifende Konzepte verweisen sollten, statt sie lokal umzubenennen — wie im `pruefeMitA14()`-Fall.

**Vorschlag:** Bei Funktionsnamen im Code, die sicherheits-/governance-relevante Konzepte berühren: Namen so wählen, dass sie auf die zentrale Definition (z. B. SEC-GATE) verweisen, statt einen eigenen Begriff zu prägen.

**Aufwand:** Betrifft nur Code-Namensgebung, kein Eingriff in die Agentenordner-Struktur.

---

## 7. Evalite-Prinzip — Eval-Schicht für Agenten-Antworten

**Problem:** Kein dokumentierter Mechanismus, um zu prüfen, ob A00–A14-Antworten nach Prompt-/Modelländerung noch korrekt sind. Relevant sobald das Model-Management-UI (Backlog 27.07., Schnell/Standard/Komplex-Tiers) Agenten zwischen Modellen verschiebt.

**Vorschlag:** Definierte Testfälle pro Agent (Input → erwarteter Output), automatisiert wiederholbar, Trace pro Modellaufruf — instrumentierbar an der zentralen Stelle `rufeKIAn()`.

**Aufwand:** Konzeptionelle Vorstufe zum Model-Management-UI, vor dessen Umsetzung sinnvoll.

---

## 8. Unverifizierte externe Zusammenfassung — Einordnung

Eine separat erhaltene Zusammenfassung (Quelle/Datum nicht angegeben) enthielt folgende Behauptungen, die **gegen den verifizierten Q7-Stand geprüft** wurden:

| Behauptung der Zusammenfassung | Prüfergebnis |
|---|---|
| Backend = NestJS + LangGraph, Vektordatenbank pgvector/Qdrant | **Widerspricht** bekanntem Stand (`q7-app` = Next.js/TypeScript). Nicht übernommen, nicht bestätigt. |
| Agentenname "Tamza Assistent" (früher Hermes) / "Hannes" | **Widerlegt** — Admin hat explizit klargestellt: nur "A01" gilt als Eigenname. |
| Ordnerstruktur `/identity /boundaries /skills /knowledge` | **Widerspricht** verifiziertem Screenshot (`A0X_Planung_Vorbereitung/01_Grundlagen/A0X_*.md`). |
| To-Spec-Framework (Parsing → Gap-Analysis/„Grill Me" → SPEC.json) | Konzeptionell verwandt mit bereits vorgeschlagener Frontier-Logik für Weiser Rat — **nicht verifiziert**, ob real bei Q7 vorhanden oder nur Vorschlag der fremden Quelle. |
| Match & Route (exakter Match/Fast-Path, Teil-Match/Delta, kein Match) | **Nicht verifiziert.** Eigenständige, potenziell nützliche Idee für A01-Posteingang — aber ungeprüft, ob bereits Teil des Q7-Konzepts. |
| Git-Branching-Strategie für Parallelentwicklung (Claude Code vs. ChatGPT) | **Nicht verifiziert**, aber unabhängig vom Rest plausibel und ggf. separat zu bewerten. |
| Modell-Tiering mit konkreten Modellnamen (Haiku/Sonnet/Opus-Zuordnung) | Bestätigt nur das **bereits bekannte** 3-Tier-Konzept (Backlog 27.07.), liefert lediglich Beispielnamen — kein neuer Fund. |

**Empfehlung:** Diese Zusammenfassung nicht als Q7-Stand übernehmen, bis Herkunft und Aktualität geklärt sind. Die konzeptionell eigenständigen Ideen (To-Spec-Framework, Match & Route, Git-Branching) können bei Bedarf **unabhängig von der fehlerhaften Quelle** separat bewertet werden, da sie unabhängig von Backend-Stack und Namensgebung Bestand haben könnten.

---

## Bewusst nicht übernommen (aus Skills-Analyse, kein Q7-Bezug oder redundant)

- Model-Invocation-Flags pro Agent, Sandcastle-Provider-Architektur (Sandbox-Orchestrierung) — zu früh/kein akuter Bedarf
- `xstate-catalogue`, `zod-fetch`, `sextant`, `agent-proxy`-Gist — redundant zu bereits erfassten Punkten (siehe Details in Vorgänger-Dateien)

---

## Freigabe-Status

| Nr. | Vorschlag | Freigegeben | Umgesetzt |
|---|---|---|---|
| 0 | Namenskorrektur A01 (Doku-Nachzug Hermes→A01) | ☐ | ☐ |
| 1 | Primärquelle-Regel (L2) | ☐ | ☐ |
| 2 | Triage-Statemaschine (Mängelregister) | ☐ | ☐ |
| 3 | Fail-Safe statt Fail-Closed (SEC-GATE) | ☐ | ☐ |
| 4 | Systemweite CONTEXT.md + ADRs | ☐ | ☐ |
| 5 | Codebase-Design-Vokabular | ☐ | ☐ |
| 6 | Context Pointer bei Code-Funktionsnamen | ☐ | ☐ |
| 7 | Evalite-Prinzip (Eval-Schicht) | ☐ | ☐ |
| 8 | Externe Zusammenfassung (To-Spec/Match&Route/Git-Branching) — gesonderte Prüfung nötig | ☐ | — |
