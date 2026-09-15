# Q7 – Tenant-Modell

**Version:** 1.1
**Status:** Verbindlich
**Referenziert von:** L4_Q7_Organisation (Modulare Abteilungen / Buchungsprinzip)
**Löst:** Q7-M-011, Q7-M-013, Q7-M-014, Q7-M-059

---

# Zweck

Dieses Dokument definiert das Mandanten-(Tenant-)Modell von Q7: wie Lizenznehmer voneinander isoliert werden, wie Unterstrukturen innerhalb eines Mandanten abgebildet werden und nach welchem Kriterium der Isolationsgrad bestimmt wird.
Es vertieft L4 (Organisation) um die technisch-organisatorische Mandantendimension, ohne eine neue Architekturebene einzuführen (siehe L3, Architekturregeln).

---

# Grundprinzipien

## 1. Plattform-Multi-Tenancy als Standard

Q7 wird als Multi-Tenant-Plattform betrieben. Alle Lizenznehmer teilen sich dieselbe Plattforminstanz (Platform Core), sofern nicht Grundsatz 2 greift.

## 2. Optionale Single-Tenancy für sensible Daten

Lizenznehmer mit erhöhtem Schutzbedarf (z. B. regulierte Branchen, Kunden-PII in hoher Sensibilität) können für definierte Datenklassen eine physisch getrennte Ablage beziehen. Dies ist eine Konfigurationsoption je Mandant, keine separate Systemvariante.

## 3. Risikobasierte Isolation

Der Isolationsgrad (logisch vs. physisch) wird nicht pauschal, sondern je Datenklasse und Mandant anhand einer Risikobewertung festgelegt (siehe Abschnitt „Isolationsentscheidung").

## 4. Hierarchische Mandantenstruktur

Ein Mandant kann Sub-Mandanten besitzen (z. B. Filialen, Tochtergesellschaften, Franchise-Einheiten). Sub-Mandanten erben Grundkonfiguration vom übergeordneten Mandanten, können definierte Attribute überschreiben.

## 5. Flexible Datenräume

Innerhalb eines Mandanten (oder Sub-Mandanten) können mehrere Datenräume existieren (z. B. je Abteilung, Projekt oder Kundenbeziehung), die eigene Zugriffsgrenzen definieren, ohne einen neuen Mandanten zu erfordern.

---

# Mandantenstruktur

```text
Plattform (Platform Core)
│
├── Mandant (Tenant)
│     │
│     ├── Konfiguration (geerbt/überschreibbar)
│     ├── Sub-Mandant (optional, beliebig tief)
│     │     └── ... (erbt von übergeordnetem Mandanten)
│     │
│     └── Datenräume
│           ├── Datenraum A (z. B. Abteilung)
│           ├── Datenraum B (z. B. Projekt)
│           └── Datenraum C (z. B. Kundenbeziehung)
```

Jeder Mandant und Sub-Mandant besitzt eine eindeutige Tenant-ID. Datenräume besitzen eine eindeutige Datenraum-ID innerhalb ihres Mandanten.

---

# Isolationsentscheidung

Die Isolationsstufe wird je Datenklasse anhand folgender Kriterien bestimmt:

| Kriterium | Logische Isolation (Standard) | Physische Isolation (Option) |
|---|---|---|
| Schutzbedarf der Datenklasse | Normal | Hoch (z. B. Gesundheitsdaten, Finanzdaten mit regulatorischer Auflage) |
| Vertragliche/regulatorische Anforderung | Keine | Vorhanden (z. B. Datenresidenz-Pflicht) |
| Mandantengröße/-risiko | Standard-Lizenznehmer | Enterprise/Regulated Enterprise (siehe Q7-M-071 Editionen) |

Die Entscheidung wird pro Mandant und Datenklasse dokumentiert und ist Teil der Mandantenkonfiguration. Eine Änderung der Isolationsstufe nach Aktivierung erfordert Admin-Freigabe (siehe L1 Grundprinzip 9, L2 Grundsatz 8) sowie eine dokumentierte Migration.

---

# Zugriffsgrenzen

- Zugriffe über Mandantengrenzen hinweg sind grundsätzlich nicht zulässig.
- Zugriffe über Datenraumgrenzen hinweg innerhalb desselben Mandanten erfordern eine explizite Berechtigung (siehe L6 Agentenmodell, Zugriffsrechte).
- Sub-Mandanten haben standardmäßig keinen Zugriff auf Daten anderer Sub-Mandanten desselben übergeordneten Mandanten, auch nicht lesend, sofern nicht explizit konfiguriert.
- Plattformseitige Auswertungen (z. B. Produktverbesserung, Aggregat-Statistiken) erfolgen ausschließlich auf anonymisierten oder mandantenfreigegebenen Daten.

---

# Bezug zu Lizenzierung

Die Tenant-Struktur ist unabhängig von, aber verknüpft mit dem Lizenzmodell (siehe Q7-M-065, `Q7_Lizenz_und_Deployment_v1.1.md`): Edition und Buchungsstatus (siehe L4, Modulare Abteilungen) bestimmen, welche Isolationsoptionen einem Mandanten zur Verfügung stehen, nicht umgekehrt.

---

# Akzeptanzkriterien

- Jeder Mandant besitzt eine eindeutige Tenant-ID, jeder Sub-Mandant eine eindeutige, dem übergeordneten Mandanten zuordenbare ID.
- Für jede im System vorhandene Datenklasse ist je Mandant eine dokumentierte Isolationsstufe hinterlegt (keine undokumentierten Standardannahmen).
- Kein Zugriff über Mandantengrenzen ist im System technisch möglich, unabhängig von der Rolle des zugreifenden Agenten.
- Jede Änderung einer Isolationsstufe ist im Protokoll mit Admin-Freigabe und Migrationsverweis nachvollziehbar.
- Ein Sub-Mandant kann angelegt werden, ohne dass der übergeordnete Mandant oder Geschwister-Sub-Mandanten manuell angepasst werden müssen.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich das Tenant-Modell.
Es vertieft L4 (Organisation) und verweist auf L6 (Zugriffsrechte) und L8 (technische Umsetzung der Isolation).
Es ersetzt keine Inhalte dieser Dokumente und dupliziert sie nicht (SSOT, siehe L2 Dokumentenregeln).

---

# Änderungsregel

Änderungen am Tenant-Modell dürfen bestehende Mandantenzuordnungen nicht brechen.
Jede Änderung ist auf Auswirkungen für Lizenzierung, Zugriffsrechte und Datenhaltung zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (09.07.2026): Ausgangsfassung. Löst Q7-M-011, Q7-M-013, Q7-M-014, Q7-M-059.
- v1.1 (27.07.2026): Terminologie „GF" → „Admin" durchgängig (Q7-VERT-007). Isolationsentscheidung um Admin-Freigabe präzisiert.
