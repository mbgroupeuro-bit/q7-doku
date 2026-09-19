# SEC-GATE — Definition & Architekturentscheidung

**Ordner:** `b_Q7-doku/06_Sicherheit/`
**Version:** v1.0
**Status:** Entwurf — Admin-Freigabe ausstehend
**Stand:** 16.09.2026

---

## 1. Definition

**SEC-GATE** ist die Freigabeschicht, die bei jeder internen oder externen
Grenzüberschreitung eingreift, bevor eine Aktion ausgeführt wird. Kein
Sammelbegriff für "Sicherheit allgemein", sondern konkret: der Punkt, an dem
eine Aktion anhält und (im Einzelfall oder gemustert) eine Prüfung bzw.
menschliche Freigabe braucht.

Bezug im Master: Grundprinzip 6 ("Sicherheit vor Automatisierung", "SEC-GATE
bleibt unveränderbar") und Entscheidungsregel 9.

SEC-GATE gliedert sich in zwei Kanäle mit insgesamt drei Zuständigkeiten:

---

## 2. Kanal A — Input von außen

**Status:** bereits bestehend, unverändert durch diese Entscheidung.

- **Zuständig:** A14-Agent (First-Gate, exklusiver Zugriff auf `01_Quarantäne`)
- **Ablauf:** Filter 1 (Schadsoftware) → Filter 2 (Spam) → PII-Trennung →
  Freigabe-Token `AUD_[TIMESTAMP]_[Q-ID]_14S_FREIGABE`
- Danach Übergabe an A01 in `02_Eingang`
- **Technischer Ort:** `Agentenstruktur/A14/` (Agentenlogik), Prozessdoku in
  `c_Q7_datenbank/01_INPUT/01_Quarantaene/`

---

## 3. Kanal B — Intern

### 3.1 B1 — Nutzer-Berechtigungen (RBAC)

**Frage:** Darf dieser Nutzer (z. B. Azubi) diese Aktion/diesen Datenzugriff
ausführen (z. B. Kundendaten von Kunde X abfragen)?

| Punkt | Entscheidung |
|---|---|
| Umsetzung | **Kein Agent, keine KI** — deterministische Code-Middleware |
| Logik | `pruefeZugriff(nutzer, objekt) → erlaubt/verweigert` |
| Zeitpunkt der Prüfung | **Vor dem LLM-Call** (Hard-Block) — Daten ohne Zugriffsrecht gelangen nie in den Prompt-Kontext |
| Begründung Hard-Block | Entscheidend für Mandantentrennung (Master Grundprinzip 9); Filterung *nach* dem LLM-Call wäre zu spät, da das Modell die Daten dann schon gesehen hat |
| Rechte-Basis | Bestehende Rollenmatrix + Objekt-Einzelrechte aus `Q7_Rollenmodell_Lizenznehmer_v0_1.md` |
| Konfiguration | Durch den Admin des Lizenznehmers |
| Verhalten bei Verstoß | Keine Einzelfall-Eskalation pro Anfrage — direkte Ablehnung an den Nutzer ("dafür bist du nicht freigeschaltet") |
| Auffälligkeits-Meldung | Wiederholte/gemusterte Verstoßversuche werden protokolliert und ab Schwelle dem Admin gemeldet (analog A14-Sanktionsmatrix) |
| Abhängigkeit | Q7-A-024 (Multi-User-Auth-Layer) — Rechte-*Logik* wird bereits jetzt gebaut (Nutzer-Identität aktuell trivial, da Default-Zustand nur Admin aktiv); echte Logins werden später eingesteckt, ohne die Logik neu zu bauen |

### 3.2 B2 — Prompt-/Anweisungs-Schutz

**Frage:** Welche Prompt-Anweisungen/Manipulationsversuche dürfen im
laufenden System nicht durchgeführt werden?

| Punkt | Entscheidung |
|---|---|
| Umsetzung | Kein Sub-Agent gleichrangig zu B1 — eigene, mehrschichtige Verteidigung, da keine deterministische Ja/Nein-Prüfung möglich ist (Erkennung selbst unscharf) |
| Ansatzpunkte | System-Prompt-Härtung (schlank halten, nur nötiges Wissen laden), Input-Heuristik, ggf. Output-Check |
| Anschluss | Bestehende `q7_sicherheit_externe_schnittstellen.md`-Logik |

---

## 4. Bewusst verworfen

Keine "Sicherheitsabteilung" mit 3–4 gleichrangigen Sub-Agenten
(Loop/Eskalation wie A14) für B1/B2 — RBAC ist deterministisch und ohne
Agenten-Overhead lösbar (Master Grundprinzip 10: Qualität vor
Funktionsumfang); B2 ist kein Agent im A14-Sinn, sondern verteilte
Härtungsmaßnahmen.

---

## 5. Ablage-Struktur (Ordner `06_Sicherheit`)

**Entscheidung:** Zwei-Ebenen-Trennung.

- `06_Sicherheit` = menschlicher Überblicksordner (Konzepte, Prinzipien,
  Gesamtbild) — Admin/GF findet hier alles zum Thema Sicherheit auf einen
  Blick, ohne durch Code-Ordner suchen zu müssen.
- Technische Ausführungsdateien (A14-Agentenordner, RBAC-Middleware-Code,
  Prompt-Schutz-Code) bleiben an ihrem funktionalen Systemort.
- `06_Sicherheit` verweist mit klaren Pfad-Links auf die technischen Orte,
  statt sie zu duplizieren.

**Inhalt `06_Sicherheit` (Soll-Zustand):**

- Dieses Dokument (SEC-GATE-Definition)
- Master-Auszüge zu SEC-GATE (Grundprinzip 6, Entscheidungsregel 9)
- Kanal-A-Übersicht (Verweis auf A14-Agentenordner)
- B1-RBAC-Konzept (Verweis auf Rollenmodell + Middleware-Code)
- B2-Prompt-Schutz-Konzept
- `Q7_Sicherheitsarchitektur.md`
- `q7_sicherheit_externe_schnittstellen.md`
- `README_Sicherheit.md`

**Verworfen:** Alles (inkl. technischer Ausführungsdateien) in einen Ordner
packen — würde Systemreferenzen der A14-Agentendateien gefährden.

---

## 6. Offene Punkte

- RBAC-Middleware-Code technisch spezifizieren und implementieren
- B2-Prompt-Schutz-Maßnahmen konkret ausarbeiten
- `06_Sicherheit`-Ordner gemäß Abschnitt 5 befüllen/aufräumen
- Admin-Freigabe dieses Dokuments ausstehend

---

**Änderungsprotokoll:**
- v1.0 (16.09.2026): Ausgangsfassung — SEC-GATE-Definition (Ansatz B: Freigabeschicht statt Oberbegriff), Kanal A/B-Aufteilung, B1 als deterministische Middleware, B2 als mehrschichtige Verteidigung, Ablage-Entscheidung (Zwei-Ebenen-Trennung).
