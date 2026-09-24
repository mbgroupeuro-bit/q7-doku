# Q7-Input-Schleuse – Finale Architektur

> Konsolidiertes Prozessdokument. Ersetzt: `gefahr_input.md`, `sicherheit_verbindung_externe_anbieter.md` (Abschnitt Quarantäne), sowie alle vorherigen Diagramm-Entwürfe.
> Stand: 2026-07-24

---

## 1. Datenfluss

```
E-Mail / WhatsApp / API-Upload
        │
        ▼
c_Q7_datenbank/01_INPUT/01_Quarantaene/
        │
        ├── [No-Exec-Ordner] ──► Nur A14 hat Schreibrecht
        │                          Keine Ausführung möglich
        │
        ├── Speicherung als isolierte temporäre Datei
        ├── Virenscan (ClamAV o. ä.)
        └── A14-Filter (Spam, Prompt-Injection, schädliche Links, MIME/Magic-Bytes)
                │
           ┌────┴────┐
           ▼         ▼
        SAUBER    VERDACHT / GEFAHR
           │         │
           │         ▼
           │    01_Quarantaene/01_Verdacht/ → Prüfung
           │         │
           │         ▼
           │    01_Quarantaene/02_isolation_zelle/
           │    ├── Metadaten protokollieren (Audit)
           │    └── Rohdatei SOFORT LÖSCHEN
           │         │
           │         ▼
           │    A14 meldet an A01 (Hermes)
           │         │
           │         ▼
           │    Hermes benachrichtigt Admin
           │    ├── Input-Ordner-Hinweis
           │    ├── Chat-Benachrichtigung
           │    └── E-Mail-Warnung
           │
           ▼
    Freigabe-Token (A14, kryptografisch)
    Format: AUD_[TIMESTAMP]_[Q-ID]_14S_FREIGABE
           │
           ▼
c_Q7_datenbank/
    ├── 02_Eingang
    ├── 03_In_Bearbeitung
    ├── 04_Wartend
    └── 05_Archiv
```

---

## 2. Ordnerstruktur (entspricht dem realen Dateisystem-Stand)

```
c_Q7_datenbank/
│
└── 01_INPUT/
    ├── 01_Quarantaene/            ← No-Exec, nur A14 schreibt
    │   ├── [temporäre Scan-Dateien]   ← werden sofort gelöscht
    │   ├── 01_Verdacht/               ← Datei in Prüfung
    │   └── 02_isolation_zelle/        ← nur Metadaten, keine Rohdatei
    │
    ├── 02_Eingang/                ← freigegebene, saubere Daten
    ├── 03_In_Bearbeitung/
    ├── 04_Wartend/
    └── 05_Archiv/
```

---

## 3. Sicherheitsmerkmale der Schleuse

| Merkmal | Bedeutung |
|---|---|
| **No-Exec-Ordner** | In `01_Quarantaene` kann nichts ausgeführt werden – Schadcode kann nicht starten |
| **A14 exklusives Schreibrecht** | Nur A14 darf schreiben. Kein anderer Agent, kein Mitarbeiter, kein Admin |
| **Temporäre Datei** | Rohdatei existiert nur für den Scan-Zeitraum (Sekunden bis Minuten) |
| **Sofortlöschung bei Verdacht** | Gefährliche Datei wird sofort entfernt, nachdem Metadaten protokolliert wurden |
| **Nur Metadaten in `02_isolation_zelle`** | Absender, Zeit, Hash, Befund, Q-ID – nie die Payload |
| **Kryptografischer Freigabe-Token** | Saubere Daten erhalten einen eindeutigen, fälschungssicheren Token |

---

## 4. Der Freigabe-Token

| Eigenschaft | Beschreibung |
|---|---|
| Format | `AUD_[TIMESTAMP]_[Q-ID]_14S_FREIGABE` |
| Beispiel | `AUD_20260724_143217_Q001_14S_FREIGABE` |
| Ersteller | A14, nach erfolgreichem Scan |
| Eigenschaft | Signiert, nicht fälschbar, einmalig gültig, zeitlich begrenzt (z. B. 5 Minuten) |
| Protokollierung | in `audit_log_api` |

**Ablauf:**
1. A14 scannt → Ergebnis SAUBER
2. A14 generiert Token, speichert in `audit_log_api`
3. A14 verschiebt Daten von `01_Quarantaene` nach `02_Eingang`
4. Token wird an Q7-App übergeben, Daten werden verarbeitet
5. Token verfällt nach Verwendung

---

## 5. Agenten-Zuständigkeit (Black-Box-Prinzip beachtet)

| Agent | Rolle |
|---|---|
| **A14** | Erkennt, scannt, filtert, blockiert. Exklusives Schreibrecht auf `01_Quarantaene`. Erstellt Freigabe-Token. Meldet Ergebnis **intern** an A01. |
| **A01 (Hermes)** | Einzige kundensichtbare Kommunikationsschnittstelle. Benachrichtigt den Admin bei Verdacht über drei Kanäle. Kein anderer Agent tritt gegenüber dem Lizenznehmer namentlich auf. |

**Hermes-Benachrichtigung bei Verdacht:**

| Kanal | Inhalt |
|---|---|
| Input-Ordner-Hinweis | Visuelle Markierung im Admin-Panel |
| Chat | Direktnachricht an Admin im Q7-System |
| E-Mail | Detaillierte Warnung mit Q-ID, Verdachtsgrund, Sicherheitshinweisen |

*(Admin kann Benachrichtigungswege später selbst konfigurieren.)*

---

## 6. Datenhaltung & Fristen

| Was | Wo | Wie lange |
|---|---|---|
| Saubere Eingangsdaten | `02_Eingang` → `03_In_Bearbeitung` → `05_Archiv` | nach Unternehmensrichtlinie |
| Blockier-Metadaten | `01_Quarantaene/02_isolation_zelle` | 90 Tage, dann automatische Löschung |
| Rohdateien bei Verdacht | nirgends – sofort gelöscht | 0 Sekunden |
| Audit-Logs | `audit_log_api` | 1 Jahr (Compliance) |
| Freigabe-Tokens | `audit_log_api` | 1 Jahr |

---

## 7. Zuständigkeiten Q7-Team vs. Admin

| Aufgabe | Q7 Entwicklungs-Team | Admin (Lizenznehmer) |
|---|---|---|
| No-Exec-Ordner einrichten | ✅ | — |
| A14-Schreibrecht konfigurieren | ✅ | — |
| Virenscanner & A14-Filter programmieren | ✅ | — |
| Freigabe-Token generieren | ✅ | — |
| Hermes-Benachrichtigung versenden | ✅ | — |
| Verdachts-Metadaten prüfen | ✅ Interface | ✅ Admin entscheidet |
| Whitelist/Blacklist pflegen | ✅ System | ✅ Admin pflegt |
| Löschfristen anpassen | ✅ Standard | ✅ Admin kann anpassen |

---

## 8. Admin-Handlungsanweisung bei Verdacht

| Schritt | Aktion |
|---|---|
| 1 | Hermes-Warnung lesen – Verdachts-Kategorie notieren |
| 2 | Admin-Panel öffnen – nicht über Links in der Warn-E-Mail |
| 3 | Q-ID suchen (z. B. `Q-2026-07-24-001`) |
| 4 | Metadaten prüfen (Absender, Betreff, Befund – read-only) |
| 5 | Entscheiden: **Löschen** (bestätigt) oder **erneute Zustellung anfordern** (Falsch-Positiv) |
| 6 | Notiz hinterlassen |

> **Goldene Regel:** Bei Unsicherheit immer löschen. Der Absender kann erneut senden.

---

## 9. Ablageorte dieses Themenkomplexes

| Dokument/Inhalt | Ort |
|---|---|
| Dieses Prozessdokument (Admin-Sicht, Live-Referenz) | `c_Q7_datenbank/01_INPUT/01_Quarantaene/` |
| A14-Ausführungslogik (technischer Agenten-Prozess) | `Agentenstruktur/A14/` |
| Sicherheits-Rahmen (K1–K4, API-Sicherheit, Zuständigkeitsmatrix) | `b_Q7-doku/Sicherheit/` |
