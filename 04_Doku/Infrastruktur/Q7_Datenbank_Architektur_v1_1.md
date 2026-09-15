# Q7 – Datenbank-Architektur

**Version:** 1.1
**Status:** Verbindlich
**Referenziert von:** L8_Q7_Technik (Datenhaltung)
**Verwandte Dateien:** Agentenmodell v1.7, Q7_Policy_Engine_v1.2.md

---

# Zweck

Dieses Dokument definiert die verbindliche Trennung von Mandanten- und Agentendaten innerhalb von `c_Q7_datenbank`, um strukturell auszuschließen, dass Agenten Zugriff auf Kundendaten erhalten.

---

# 1. Struktur

```
c_Q7_datenbank/
├── mandanten_datenbank/
│   ├── Kundendaten
│   ├── Verträge
│   ├── ABLAGE
│   └── Marken-IDs
└── agenten_datenbank/
    ├── agenten_input_queue (Aufträge/Delegationen)
    ├── Status (NEU / IN_BEARBEITUNG / ERLEDIGT / FEHLER)
    └── Ergebnisse
```

Ein gemeinsamer Root (`c_Q7_datenbank`), zwei vollständig getrennte Schemas/Datenbanken darunter — kein gemeinsames Schema, keine Joins zwischen beiden Bereichen möglich.

---

# 2. Zugriffsregel (bindend)

| Akteur | mandanten_datenbank | agenten_datenbank |
|---|---|---|
| Agenten (A01–A13) | **Kein Zugriff** — weder lesend noch schreibend | Voller Zugriff im Rahmen RBAC (siehe Agentenmodell v1.7) |
| Zentraler App-Service (`a_Q7-code`) | Lesend/schreibend | Lesend/schreibend |

**Grundsatz:** Agenten haben technisch keine DB-Verbindung zu `mandanten_datenbank` — nicht nur durch Rechte verboten, sondern strukturell nicht erreichbar.

---

# 3. Ablauf bei Mandantendaten-Bedarf

Wenn ein Agent (z.B. A03 Marketing) Kundendaten für eine Aufgabe benötigt (z.B. Marken-ID):

1. A01/Fachagent formuliert den Datenbedarf als Teil der Aufgabe
2. Der zentrale App-Service in `a_Q7-code` holt die benötigten Daten aus `mandanten_datenbank`
3. Der App-Service reicht die Daten als Kontext im Prompt an den Agenten weiter (bei `rufeKIAn()`)
4. Der Agent selbst sieht nie die Datenbank — nur die ihm zugeteilten Daten im Prompt

---

# 4. Begründung

Physische/logische Trennung, damit Agenten strukturell nie an Kundendaten kommen können — unabhängig von Bugs oder Fehlkonfiguration in der Anwendungslogik.

---

# 5. Geprüfte und verworfene Alternativen

| Option | Beschreibung | Verwerfungsgrund |
|---|---|---|
| A) Separate physische DB-Server | Zwei komplett getrennte DB-Instanzen | Zu hoher Infrastruktur-Overhead für aktuelle Größe |
| E) Redis (Live-Queue) + Postgres (Archiv) | Hybrid aus In-Memory-Queue und persistentem Archiv | Zu komplex für Testphase: Sync-Risiko zwischen beiden Systemen, zwei Fehlerquellen, Datenverlustrisiko bei Redis-Neustart ohne Persistenz-Konfiguration, hoher Wartungsaufwand für zwei Systeme |
| Datei-basierte Queue | JSON/Text-Dateien statt DB | Kein natives Locking → Race-Condition-Risiko bei parallelen Agenten |
| Gleiches Schema ohne Trennung | Ein Schema für alle Daten, Trennung nur über RBAC | Erreicht das Sicherheitsziel (strukturelle Unerreichbarkeit) nicht — Risiko bleibt bei Fehlkonfiguration bestehen |

---

# 6. Offene Punkte

- Technische Umsetzung: eine physische DB-Instanz mit zwei Schemas, oder zwei physisch getrennte DB-Server unter gemeinsamem `c_Q7_datenbank`-Dach? (Aktuell offen, keine Admin-Entscheidung dazu vorliegend)
- Konkretes Schema von `agenten_datenbank` (Tabellenstruktur) — Basis ist der Vorschlag aus `agenten_input_erkennung.md`, noch nicht final für Zwei-Bereich-Modell angepasst

---

**Änderungsprotokoll:**
- v1.0 (25.07.2026): Ausgangsfassung nach Admin-Freigabe.
- v1.1 (27.07.2026): Terminologie „GF" → „Admin" (Q7-VERT-011). Verweis auf Agentenmodell auf v1.7 aktualisiert. Admin-Freigabe-Instanz in Änderungsprotokoll präzisiert.
