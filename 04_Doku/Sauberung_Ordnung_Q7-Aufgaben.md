# Sauberung & Ordnung – Q7-Aufgaben

**Erstellt:** 2026-08-07
**Zweck:** Zentrale, verbindliche Übersicht aller Terminologie- und Namenskonventions-Bereinigungen im Q7-System. Ersetzt keine bestehenden Governance-Dokumente (`Q7_Änderung_1.md` bleibt Aufgaben-Master), sondern bündelt speziell die Naming-Bereinigung als Teilprojekt.

**Status-Legende:** 🔴 offen | 🟡 in Arbeit | 🟢 erledigt | ⚪ Admin-Entscheidung ausstehend

---

## 1. Grundregel

**Verbot interner/technischer Begriffe auf sichtbarer bzw. dokumentarischer Ebene:**
- Kein "GF" → ausschließlich **"Admin"**
- Keine internen Agenten-Klarnamen (z.B. "Hermes") → ausschließlich **Agentencodes A00–A14** in der Doku, und **"der Assistent"** auf Lizenznehmer-Ebene
- Kein "Kunde" / "Mandant" → ausschließlich **"Lizenznehmer"**

Diese Regel gilt für: Code (Variablen, Funktionen, Dateinamen, Kommentare), DB-Schema (Tabellen, Spalten), Dokumentation (alle .md-Dateien), UI-Texte, System-Prompts, Ordnerstruktur.

---

## 2. Begriffs-Mapping (verbindlich)

| Alt / Falsch | Neu / Korrekt | Geltungsbereich |
|---|---|---|
| GF | **Admin** | global, ausnahmslos |
| Kunde | **Lizenznehmer** | global, ausnahmslos |
| Mandant / mandant | **Lizenznehmer / lizenznehmer** | global, ausnahmslos |
| Hermes (o.ä. interne Agentennamen) | **A01** ("der Assistent" auf LN-Ebene) | Code + interne Doku |
| Sonstige interne Agenten-Klarnamen | **A00–A14** (je nach Zuordnung) | Code + interne Doku |
| Workflow-Builder / Drag-and-Drop | *(kein Ersatz – dauerhaft verworfen)* | – |

> **Hinweis:** Weitere Alt-Begriffe werden ergänzt, sobald sie bei der Bestandsaufnahme (Abschnitt 4) auftauchen.

---

## 3. Betroffene Bereiche – Übersicht

| Bereich | Pfad | Status |
|---|---|---|
| DB-Schema | `c_Q7_datenbank\01_Mandanten_Datenbank\mandanten_schema.sql` | 🔴 |
| DB-Layer Code | `a_Q7-code\lib\db\mandantenDb.ts` | 🔴 |
| DB-Layer Code | `a_Q7-code\lib\db\agentenDb.ts` (Kapselungsprüfung, ggf. Namensfunde) | 🔴 |
| Zentrale Libs | `a_Q7-code\lib\ablage.ts`, `auth.ts`, `store.tsx`, `types.ts`, `wissen.ts` | 🔴 |
| API-Routen | `a_Q7-code\app\api\chat\route.ts`, `app\api\compare\route.ts` | 🔴 |
| Ordnerstruktur DB | `01_Mandanten_Datenbank` → ggf. `01_Lizenznehmer_Datenbank` | ⚪ Admin-Entscheidung |
| Governance-Doku | `00_Q7_MASTER.md`, L1–L8, `01_Q7_ARCHITECTURE.md` | 🔴 |
| System-Prompts (extern eingebracht) | z.B. Prompts mit "GF" | 🔴 |
| Q7-ERP Doku | `Q7ERP_Chat-Anweisung_v1_0.md`, `Q7ERP_MASTER_v1_0.md`, `schema.prisma` | 🔴 |

---

## 4. Vorgehen (Reihenfolge)

1. **Bestandsaufnahme (Read-Only)**
   Vollständige Suche im gesamten Repo (Code + Doku) nach: `GF`, `Kunde`, `kunde`, `Mandant`, `mandant`, sowie bekannten internen Agenten-Klarnamen.
   → Ergebnis: Trefferliste pro Datei, **vor** jeder Änderung zur Prüfung vorlegen.

2. **DB-Schema zuerst**
   `mandanten_schema.sql` – Tabellen-/Spaltennamen umbenennen. Höchstes Risiko bei Inkonsistenz mit Code.

3. **DB-Layer**
   `mandantenDb.ts` (Funktionen, Typen, Variablennamen) → ggf. Datei selbst umbenennen zu `lizenznehmerDb.ts`.

4. **Restlicher Code**
   Alle Treffer aus Schritt 1 in `lib/`, `app/api/` etc. einzeln durchgehen.

5. **Governance- & Projektdokumentation**
   `00_Q7_MASTER.md`, L1–L8, `01_Q7_ARCHITECTURE.md`, Q7-ERP-Dokumente.

6. **Externe/mitgebrachte Prompts**
   Jeder von außen eingebrachte System-Prompt (z.B. mit "GF") wird vor Nutzung korrigiert oder zurückgewiesen.

7. **Validierung**
   Erneuter Suchlauf über gesamtes Repo – Ziel: 0 Treffer für Alt-Begriffe (außer in Kommentaren, die den historischen Rename explizit dokumentieren, falls gewünscht).

---

## 5. Sicherheitsregeln bei der Durchführung

- **Kein Blind-Replace** über den gesamten Code – jede Datei mit Treffern wird einzeln geprüft.
- Trefferliste wird **vor** Änderung präsentiert, nicht danach (Reality-First-Prinzip).
- Änderungen erst nach expliziter Admin-Freigabe je Abschnitt (Collect-then-Execute).
- Bei Unsicherheit, ob ein Treffer inhaltlich relevant ist (z.B. "Kunde" in einem reinen Beispieltext ohne Systembezug): **Rückfrage an Admin**, keine eigenmächtige Entscheidung.

---

## 6. Offene Admin-Entscheidungen

| # | Entscheidung | Status |
|---|---|---|
| 1 | Ordnerumbenennung `01_Mandanten_Datenbank` → `01_Lizenznehmer_Datenbank`? | ⚪ offen |
| 2 | Sollen historische Commit-Messages/Git-Historie kommentiert werden, oder bleibt Alt-Terminologie dort unangetastet? | ⚪ offen |
| 3 | Umgang mit `A15`-Konflikt (Buchhaltung vs. Design) – separates Thema, aber ggf. relevant für Namensvergabe während dieser Bereinigung | ⚪ offen (separat dokumentiert) |

---

## 7. Nächster Schritt

Bestandsaufnahme (Abschnitt 4, Schritt 1) via Claude Code im Projektverzeichnis `D:\Projekt2027\Q7_Entwicklung\` durchführen, Trefferliste erzeugen, hier bzw. im Chat zur Freigabe vorlegen.
