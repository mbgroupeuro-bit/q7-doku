# Q7 – Klärungsbedarf: Agentenmodell-Konflikt

**Erstellt:** 10.07.2026
**Status:** Größtenteils gelöst (GF-Entscheidungen 10.07.2026) — ein Restpunkt offen
**Betrifft:** L6_Q7_Agentenmodell, lib/types.ts (q7-app), 02_KI-UNTERNEHMEN (reale Struktur), Q7_Modell_Zuteilung_v1_1.md

---

# GF-Entscheidungen (10.07.2026)

| Frage | Entscheidung |
|---|---|
| Welche Quelle ist verbindlich? | **Reale Ordnerstruktur (`02_KI-UNTERNEHMEN`)** |
| A01 oder A01a? | **A01** (ohne Suffix) |
| „Sales" oder „Vertrieb"? | **Vertrieb** |
| Alle 15 Agenten aktivieren oder Testphase beibehalten? | **Alle 15 jetzt aktivieren** |
| `00_GF` als eigene Organisationseinheit dokumentieren? | **Ja** — umgesetzt in L4 v1.4 |

Umgesetzt in: `lib_types_AGENTS_update.ts`, `Q7_Modell_Zuteilung_v1_1.md`, `.env.local.ergaenzung.txt`, `route.ts.example`, `L4_Q7_Organisation_v1_4.md`.

---

**Status:** Vollständig gelöst (GF-Entscheidungen 10.07.2026)

## „Hermes" — final geklärt

GF-Entscheidung: „Hermes" bleibt als Zusatzbezeichnung für A01 bestehen (nicht Ersatz für „Planung & Vorbereitung"). Umgesetzt in L4 v1.5, L6 v1.4, `lib_types_AGENTS_update.ts`.

---

# Nachtrag: K4_SuperAgent = A00 (10.07.2026)

Im Rahmen des `04_TRESOR`-Abgleichs zusätzlich geklärt: `K4_SuperAgent` (Ordner in `04_TRESOR`) ist keine eigenständige, vierte Instanz, sondern **A00 (Stab)** mit einer bisher nicht in L4/L6 dokumentierten Zusatzfunktion: systemweite Überwachung aller Agenten inkl. A01.

**Bestätigt (GF):** Diese Funktion ist vollständig GF-transparent (protokolliert, jederzeit einsehbar), trifft keine eigenständigen Entscheidungen, delegiert Auffälligkeiten zur GF-Eskalation. Kein Konflikt mit L1 Grundprinzip 9 (nicht delegierbare GF-Letztentscheidung) oder dem Black-Box-Prinzip (Unsichtbarkeit gilt nur nach außen, nie gegenüber GF).

Umgesetzt in: L4 v1.5 (Organisationsdiagramm-Ergänzung), L6 v1.4 (neuer Abschnitt „Systemweite Überwachungsfunktion (A00)").
