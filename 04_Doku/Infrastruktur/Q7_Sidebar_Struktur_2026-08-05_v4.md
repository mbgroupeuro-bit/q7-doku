---
titel: Q7 Sidebar-Struktur
version: 4.0
datum: 2026-08-05
status: Final freigegeben
ersetzt: Q7_Sidebar_Struktur_2026-08-01_v3.md
---

# Q7 — Sidebar-Struktur (final)

## Menüpunkte

| Position | Menüpunkt (DE) | Alte Bezeichnung (EN) | Änderung ggü. v3 |
|---|---|---|---|
| 1 | Überblick | Dashboard/Home | **Neu in v4** — war in v3 nicht gelistet, existiert im Ist-Zustand bereits |
| 2 | Posteingang | Inbox | Umbenannt aus "Eingang" (Q7-A-047 damit erledigt) und um Kanal-Tabs erweitert (siehe Konzeptdokument Abschnitt 5) |
| 3 | Aufgaben | Tasks | unverändert |
| 4 | Kalender | Calendar | unverändert |
| 5 | Entwicklung | Studio | unverändert |
| 6 | Arbeitsbereiche | Workspaces | unverändert |
| 7 | Ausgabe | Output | unverändert |
| — | *(Trennlinie)* | — | unverändert |
| 8 | Chronik | Protocol | unverändert |
| 9 | Bibliothek | Library | unverändert |
| 10 | Einstellungen | Settings | unverändert |

## ERP — bewusst kein eigener Menüpunkt (Entscheidung 05.08.2026)

Im Ist-Zustand war kurzzeitig ein Punkt "ERP" (mit "Neu"-Badge) zwischen
Ausgabe und Chronik sichtbar. **Entscheidung: wird zurückgebaut, kein
dauerhafter Sidebar-Punkt.** Begründung: ERP-Zugriff deckt sich
vollständig über bestehende Bereiche ab — Studio (schreibend), Dashboard/
Überblick (KPI-Kacheln, lesend), KI-Assistent (Ad-hoc-Abfrage, lesend).
Ein viertes, paralleles ERP-Cockpit wäre Doppelstruktur. Details siehe
`Q7_ERP_und_Integrationsplattform.md`, Abschnitt "Q7-seitige
Zugriffswege". Technische Umsetzung (Sidebar.tsx-Eintrag entfernen)
offen, siehe Aufgabenliste Q7-A-112.

## Begründung Position 6 — Arbeitsbereiche (unverändert aus v3)

| Vorschlag | EN-Referenz | Ton |
|---|---|---|
| Arbeitsbereiche | Workspaces | Funktional-neutral, im Software-Kontext etabliert (analog "Workspace" in Slack/Notion) |
| Arbeitsräume | Workspaces/Rooms | Bildhafter, etwas physischer/räumlicher Klang |

**Entscheidung: Arbeitsbereiche** — direktere Übersetzung von "Workspaces", in Business-Software gängiger Begriff, harmoniert besser mit "Aufgaben", "Ausgabe" (alle drei Substantive, funktional statt räumlich-metaphorisch).

## Trennlinien-Position
Trennung zwischen Position 7 (Ausgabe) und 8 (Chronik) — trennt aktive Arbeitsbereiche (Überblick bis Ausgabe) von Referenz-/Verwaltungsbereichen (Chronik, Bibliothek, Einstellungen).

## Bezug zu KI-Terminologie (unverändert aus v3)
Regel "keine KI-Terminologie in der UI" ist durch Master-Doku v1.2 (23.07.2026) überholt: Licensees sehen den KI-Modellnamen pro Agent (außer A01) und können ihn wechseln (z.B. Haiku→Opus). Agent-Kürzel (A00–A14) und Prozess-IDs bleiben weiterhin Black-Box, unsichtbar für den Licensee.

## Anknüpfungspunkt an Kanal-Intake-Prozess
Position 2 (Posteingang) und Position 3 (Aufgaben) sind die UI-Bereiche, in denen normalisierte Tasks aus dem Kanal-Intake-Prozess (E-Mail, WhatsApp, ...) sichtbar werden. **Stand 05.08.2026: real angebunden** (nicht mehr offen wie in v3) — `app/input/page.tsx` liest live aus der `aufgaben`-Tabelle, `VerlegenButton` verlegt nach "Aufgaben". Kanal-Tabs (Team/Mail/WhatsApp/Telegram/Facebook) im Posteingang ergänzt.

## Offene Punkte
- Sidebar.tsx: "ERP"-Eintrag entfernen (siehe oben, Q7-A-112)
- Aktuell nur Kanal "email" real befüllt (Gmail-Poll-Pipeline) — Team/WhatsApp/Telegram/Facebook-Tabs zeigen bis zu deren Anbindung leer
