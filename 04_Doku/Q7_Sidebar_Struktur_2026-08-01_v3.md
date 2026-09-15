---
titel: Q7 Sidebar-Struktur
version: 3.0
datum: 2026-08-01
status: Final freigegeben
ersetzt: Q7_Sidebar_Struktur_2026-07-25_v2.md
---

# Q7 — Sidebar-Struktur (final)

## Menüpunkte

| Position | Menüpunkt (DE) | Alte Bezeichnung (EN) |
|---|---|---|
| 1 | Eingang | Inbox |
| 2 | Aufgaben | Tasks |
| 3 | Kalender | Calendar |
| 4 | Entwicklung | Studio |
| 5 | Arbeitsbereiche | Workspaces |
| 6 | Ausgabe | Output |
| — | *(Trennlinie)* | — |
| 7 | Chronik | Protocol |
| 8 | Bibliothek | Library |
| 9 | Einstellungen | Settings |

## Begründung Position 5 — Arbeitsbereiche

| Vorschlag | EN-Referenz | Ton |
|---|---|---|
| Arbeitsbereiche | Workspaces | Funktional-neutral, im Software-Kontext etabliert (analog "Workspace" in Slack/Notion) |
| Arbeitsräume | Workspaces/Rooms | Bildhafter, etwas physischer/räumlicher Klang |

**Entscheidung: Arbeitsbereiche** — direktere Übersetzung von "Workspaces", in Business-Software gängiger Begriff, harmoniert besser mit "Aufgaben", "Ausgabe" (alle drei Substantive, funktional statt räumlich-metaphorisch).

## Trennlinien-Position
Trennung zwischen Position 6 (Ausgabe) und 7 (Chronik) — trennt aktive Arbeitsbereiche (Eingang bis Ausgabe) von Referenz-/Verwaltungsbereichen (Chronik, Bibliothek, Einstellungen).

## Bezug zu KI-Terminologie (Korrektur ggü. v2)
Frühere Version dieser Datei enthielt die Regel "keine KI-Terminologie in der UI" — das ist durch Master-Doku v1.2 (23.07.2026) überholt: Licensees sehen den KI-Modellnamen pro Agent (außer Hermes) und können ihn wechseln (z.B. Haiku→Opus). Agent-Kürzel (A00–A14) und Prozess-IDs bleiben weiterhin Black-Box, unsichtbar für den Licensee.

## Anknüpfungspunkt an Kanal-Intake-Prozess
Position 1 (Eingang) und Position 2 (Aufgaben) sind die vorgesehenen UI-Bereiche, in denen normalisierte Tasks aus dem Kanal-Intake-Prozess (E-Mail, WhatsApp, ...) später sichtbar werden sollen. Aktuell (Stand 31.07.2026) landen eingehende Tasks nur in der Datenbank (`aufgaben`-Tabelle) und sind noch nicht an diese UI-Bereiche angebunden — offener technischer Punkt für eine spätere Sitzung.

## Offene Punkte
- Anbindung der Datenbank-Tabelle `aufgaben` an die UI-Bereiche "Eingang" und "Aufgaben" (technisch noch nicht umgesetzt)
