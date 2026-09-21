# Q7 – Tenant-Modell

**Version:** 1.2
**Status:** Verbindlich
**Referenziert von:** L4_Q7_Organisation (Modulare Abteilungen / Buchungsprinzip)
**Löst:** Q7-M-011, Q7-M-013, Q7-M-014, Q7-M-059

---

# Zweck

Dieses Dokument definiert das Lizenznehmer-(Tenant-)Modell von Q7: wie Lizenznehmer voneinander isoliert werden, wie Unterstrukturen innerhalb eines Lizenznehmers abgebildet werden und nach welchem Kriterium der Isolationsgrad bestimmt wird.
Es vertieft L4 (Organisation) um die technisch-organisatorische Lizenznehmer-Dimension, ohne eine neue Architekturebene einzuführen (siehe L3, Architekturregeln).

---

# Grundprinzipien

## 1. Plattform-Multi-Tenancy als Standard

Q7 wird als Multi-Tenant-Plattform betrieben. Alle Lizenznehmer teilen sich dieselbe Plattforminstanz (Platform Core), sofern nicht Grundsatz 2 greift.

## 2. Optionale Single-Tenancy für sensible Daten

Lizenznehmer mit erhöhtem Schutzbedarf (z. B. regulierte Branchen, besonders sensible personenbezogene Daten ihrer eigenen Endkunden) können für definierte Datenklassen eine physisch getrennte Ablage beziehen. Dies ist eine Konfigurationsoption je Lizenznehmer, keine separate Systemvariante.

*(Offener Punkt Q7-VERT2-001: "besonders sensible personenbezogene Daten ihrer eigenen Endkunden" war im Vorgängerstand als "Kunden-PII" formuliert — Admin-Klärung ausstehend, ob damit tatsächlich die Endkunden des Lizenznehmers gemeint sind oder ein anderer Sachverhalt.)*

## 3. Risikobasierte Isolation

Der Isolationsgrad (logisch vs. physisch) wird nicht pauschal, sondern je Datenklasse und Lizenznehmer anhand einer Risikobewertung festgelegt (siehe Abschnitt „Isolationsentscheidung").

## 4. Hierarchische Lizenznehmerstruktur

Ein Lizenznehmer kann Sub-Lizenznehmer besitzen (z. B. Filialen, Tochtergesellschaften, Franchise-Einheiten). Sub-Lizenznehmer erben Grundkonfiguration vom übergeordneten Lizenznehmer, können definierte Attribute überschreiben.

## 5. Flexible Datenräume

Innerhalb eines Lizenznehmers (oder Sub-Lizenznehmers) können mehrere Datenräume existieren (z. B. je Abteilung, Projekt oder Geschäftsbeziehung), die eigene Zugriffsgrenzen definieren, ohne einen neuen Lizenznehmer zu erfordern.

---

# Lizenznehmerstruktur

```text
Plattform (Platform Core)
│
├── Lizenznehmer (Tenant)
│     │
│     ├── Konfiguration (geerbt/überschreibbar)
│     ├── Sub-Lizenznehmer (optional, beliebig tief)
│     │     └── ... (erbt vom übergeordneten Lizenznehmer)
│     │
│     └── Datenräume
│           ├── Datenraum A (z. B. Abteilung)
│           ├── Datenraum B (z. B. Projekt)
│           └── Datenraum C (z. B. Geschäftsbeziehung)
```

Jeder Lizenznehmer und Sub-Lizenznehmer besitzt eine eindeutige Tenant-ID. Datenräume besitzen eine eindeutige Datenraum-ID innerhalb ihres Lizenznehmers.

---

# Isolationsentscheidung

Die Isolationsstufe wird je Datenklasse anhand folgender Kriterien bestimmt:

| Kriterium | Logische Isolation (Standard) | Physische Isolation (Option) |
|---|---|---|
| Schutzbedarf der Datenklasse | Normal | Hoch (z. B. Gesundheitsdaten, Finanzdaten mit regulatorischer Auflage) |
| Vertragliche/regulatorische Anforderung | Keine | Vorhanden (z. B. Datenresidenz-Pflicht) |
| Lizenznehmergröße/-risiko | Standard-Lizenznehmer | Enterprise/Regulated Enterprise (siehe Q7-M-071 Editionen) |

Die Entscheidung wird pro Lizenznehmer und Datenklasse dokumentiert und ist Teil der Lizenznehmerkonfiguration. Eine Änderung der Isolationsstufe nach Aktivierung erfordert Admin-Freigabe (siehe L1 Grundprinzip 9, L2 Grundsatz 8) sowie eine dokumentierte Migration.

---

# Zugriffsgrenzen

- Zugriffe über Lizenznehmergrenzen hinweg sind grundsätzlich nicht zulässig.
- Zugriffe über Datenraumgrenzen hinweg innerhalb desselben Lizenznehmers erfordern eine explizite Berechtigung (siehe L6 Agentenmodell, Zugriffsrechte).
- Sub-Lizenznehmer haben standardmäßig keinen Zugriff auf Daten anderer Sub-Lizenznehmer desselben übergeordneten Lizenznehmers, auch nicht lesend, sofern nicht explizit konfiguriert.
- Plattformseitige Auswertungen (z. B. Produktverbesserung, Aggregat-Statistiken) erfolgen ausschließlich auf anonymisierten oder vom Lizenznehmer freigegebenen Daten.

---

# Bezug zu Lizenzierung

Die Tenant-Struktur ist unabhängig von, aber verknüpft mit dem Lizenzmodell (siehe Q7-M-065, `Q7_Lizenz_und_Deployment_v1_1.md`): Edition und Buchungsstatus (siehe L4, Modulare Abteilungen) bestimmen, welche Isolationsoptionen einem Lizenznehmer zur Verfügung stehen, nicht umgekehrt.

---

# Akzeptanzkriterien

- Jeder Lizenznehmer besitzt eine eindeutige Tenant-ID, jeder Sub-Lizenznehmer eine eindeutige, dem übergeordneten Lizenznehmer zuordenbare ID.
- Für jede im System vorhandene Datenklasse ist je Lizenznehmer eine dokumentierte Isolationsstufe hinterlegt (keine undokumentierten Standardannahmen).
- Kein Zugriff über Lizenznehmergrenzen ist im System technisch möglich, unabhängig von der Rolle des zugreifenden Agenten.
- Jede Änderung einer Isolationsstufe ist im Protokoll mit Admin-Freigabe und Migrationsverweis nachvollziehbar.
- Ein Sub-Lizenznehmer kann angelegt werden, ohne dass der übergeordnete Lizenznehmer oder Geschwister-Sub-Lizenznehmer manuell angepasst werden müssen.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich das Tenant-Modell.
Es vertieft L4 (Organisation) und verweist auf L6 (Zugriffsrechte) und L8 (technische Umsetzung der Isolation).
Es ersetzt keine Inhalte dieser Dokumente und dupliziert sie nicht (SSOT, siehe L2 Dokumentenregeln).

---

# Änderungsregel

Änderungen am Tenant-Modell dürfen bestehende Lizenznehmerzuordnungen nicht brechen.
Jede Änderung ist auf Auswirkungen für Lizenzierung, Zugriffsrechte und Datenhaltung zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (09.07.2026): Ausgangsfassung. Löst Q7-M-011, Q7-M-013, Q7-M-014, Q7-M-059.
- v1.1 (27.07.2026): Terminologie „GF" → „Admin" durchgängig (Q7-VERT-007). Isolationsentscheidung um Admin-Freigabe präzisiert.
- v1.2 (19.09.2026): Terminologie „Mandant"/„Mandanten-"/„Sub-Mandant" → „Lizenznehmer"/„Lizenznehmer-"/„Sub-Lizenznehmer" durchgängig (Q7-VERT2-001), „Kundenbeziehung" → „Geschäftsbeziehung" (Datenraum-Beispiel). „Kunden-PII" in Grundsatz 2 umformuliert zu „besonders sensible personenbezogene Daten ihrer eigenen Endkunden" mit explizitem offenem Klärungspunkt (Admin-Bestätigung ausstehend, ob damit tatsächlich Endkunden des Lizenznehmers gemeint sind). Interner Querverweis auf `Q7_Lizenz_und_Deployment_v1.md` korrigiert auf reale Datei `Q7_Lizenz_und_Deployment_v1_1.md`.
