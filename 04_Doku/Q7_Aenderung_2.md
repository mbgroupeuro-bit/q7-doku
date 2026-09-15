# Q7_Änderung_2 — A15-Konfliktlösung & Agenten-Nummernvergabe

**Datum:** 07.08.2026
**Status:** Bindend, Admin-freigegeben
**Bezug:** Löst den in `00_Q7_MASTER.md` / Agentenregister dokumentierten A15-Doppelbelegungs-Konflikt ab

---

## 1. AUSGANGSLAGE (bisheriger Konflikt)

A15 war doppelt belegt:
- Buchhaltungs-/Belegverarbeitungs-Agent (ältere Definition)
- Design-Agent (Parallel-Session, 20.07.2026)

Im Zuge der Q7-ERP-Konzeption (siehe `Q7ERP_MASTER_v1_0.md`, Abschnitt 3.7) wurde zusätzlich ein neuer Q7-Agent für die Synchronisation zwischen Q7 und Q7-ERP benötigt — damit lag faktisch ein Dreifach-Konflikt auf A15 vor.

---

## 2. ENTSCHEIDUNG (Admin, final)

| Nummer | Agent | Zuständigkeit |
|---|---|---|
| **A15** | Q7-ERP-Synchronisations-Agent | Kommunikation/Datenabgleich zwischen Q7 und Q7-ERP (Domain Events, Kontext-Speicher-Aktualisierung — siehe `Q7ERP_MASTER_v1_0.md` Abschnitt 3.7) |
| **A16** | Buchhaltungs-/Belegverarbeitungs-Agent | Übernimmt die bisherige A15-Zuständigkeit unverändert, nur neue Nummer |
| **A17** | Design-Agent | Übernimmt die bisherige A15-Zuständigkeit (aus Parallel-Session 20.07.2026) unverändert, nur neue Nummer |

**Begründung der Reihenfolge:** A15 an den neuen Q7-ERP-Synchronisations-Agenten, da dieser im direkten Zusammenhang mit der aktuellen Q7-ERP-Konzeptionsphase steht. Buchhaltung und Design erhalten die nächsten freien, sequenziellen Nummern (A16, A17) — keine inhaltliche Priorisierung, rein technische Neuvergabe.

---

## 3. AUSWIRKUNGEN / FOLGE-AUFGABEN

- Alle bisherigen Referenzen auf "A15 = Buchhaltung" oder "A15 = Design" in bestehender Q7-Dokumentation sind auf A16 bzw. A17 zu aktualisieren
- `00_Q7_MASTER.md` bzw. das zentrale Agentenregister ist entsprechend zu korrigieren
- Q7-Baustelle "A15" (Bezug in `Q7ERP_MASTER_v1_0.md`, Phase 4 — Buchhaltungsmodul) ist künftig als **A16** zu referenzieren
- Black-Box-Prinzip (Grundprinzip 7) bleibt unberührt: Nummernvergabe ist rein interne Systematik, für Lizenznehmer ohnehin nicht sichtbar

---

## 4. ÄNDERUNGSHISTORIE

| Version | Datum | Änderung |
|---|---|---|
| 1 | 07.08.2026 | Ersterstellung, A15/A16/A17-Zuordnung final entschieden |
