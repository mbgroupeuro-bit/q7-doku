# Q7 – Datenbank-Architektur

**Version:** 1.2
**Status:** Verbindlich
**Referenziert von:** L8_Q7_Technik (Datenhaltung)
**Verwandte Dateien:** Agentenmodell v1.8, Q7_Policy_Engine_v1_2.md

---

# Zweck

Dieses Dokument definiert die verbindliche Trennung von Lizenznehmer- und Agentendaten innerhalb von `c_Q7_datenbank`, um strukturell auszuschließen, dass Agenten Zugriff auf Lizenznehmerdaten erhalten.

---

# 1. Struktur

```
c_Q7_datenbank/
├── mandanten_datenbank/
│   ├── Lizenznehmerdaten
│   ├── Verträge
│   ├── ABLAGE
│   └── Marken-IDs
└── agenten_datenbank/
    ├── agenten_input_queue (Aufträge/Delegationen)
    ├── Status (NEU / IN_BEARBEITUNG / ERLEDIGT / FEHLER)
    └── Ergebnisse
```

*(Offener Punkt Q7-VERT2-002: der Ordnername `mandanten_datenbank` ist ein realer physischer Pfad und wurde bewusst nicht umbenannt — siehe L8 v1.6, Q7-L8-007. Nur der Ordnerinhalt „Kundendaten" wurde zu „Lizenznehmerdaten" korrigiert, da dies ein beschreibender Inhaltsname und kein technischer Pfad ist.)*

Ein gemeinsamer Root (`c_Q7_datenbank`), zwei vollständig getrennte Schemas/Datenbanken darunter — kein gemeinsames Schema, keine Joins zwischen beiden Bereichen möglich.

---

# 2. Zugriffsregel (bindend)

| Akteur | mandanten_datenbank | agenten_datenbank |
|---|---|---|
| Agenten (A01–A13) | **Kein Zugriff** — weder lesend noch schreibend | Voller Zugriff im Rahmen RBAC (siehe Agentenmodell v1.8) |
| Zentraler App-Service (`a_Q7-code`) | Lesend/schreibend | Lesend/schreibend |

**Grundsatz:** Agenten haben technisch keine DB-Verbindung zu `mandanten_datenbank` — nicht nur durch Rechte verboten, sondern strukturell nicht erreichbar.

---

# 3. Ablauf bei Lizenznehmerdaten-Bedarf

Wenn ein Agent (z.B. A03 Marketing) Lizenznehmerdaten für eine Aufgabe benötigt (z.B. Marken-ID):

1. A01/Fachagent formuliert den Datenbedarf als Teil der Aufgabe
2. Der zentrale App-Service in `a_Q7-code` holt die benötigten Daten aus `mandanten_datenbank`
3. Der App-Service reicht die Daten als Kontext im Prompt an den Agenten weiter (bei `rufeKIAn()`)
4. Der Agent selbst sieht nie die Datenbank — nur die ihm zugeteilten Daten im Prompt

---

# 4. Begründung

Physische/logische Trennung, damit Agenten strukturell nie an Lizenznehmerdaten kommen können — unabhängig von Bugs oder Fehlkonfiguration in der Anwendungslogik.

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
- Umbenennung der physischen Ordnernamen (`mandanten_datenbank` → z. B. `lizenznehmer_datenbank`) — bewusst nicht Teil dieser Doku-Korrektur, separate technische Entscheidung (siehe Q7-VERT2-002)

---

**Änderungsprotokoll:**
- v1.0 (25.07.2026): Ausgangsfassung nach Admin-Freigabe.
- v1.1 (27.07.2026): Terminologie „GF" → „Admin" (Q7-VERT-011). Verweis auf Agentenmodell auf v1.7 aktualisiert. Admin-Freigabe-Instanz in Änderungsprotokoll präzisiert.
- v1.2 (19.09.2026): „Kundendaten"/„Mandantendaten" (Prosa) → „Lizenznehmerdaten" durchgängig (Q7-VERT2-002) — bestätigt: bezeichnet Daten über den Lizenznehmer selbst, nicht dessen Endkunden. Physischer Ordnername `mandanten_datenbank` bewusst unverändert gelassen, als offener Punkt ergänzt. Verweis auf Agentenmodell auf v1.8 aktualisiert.
