# Q7 – Technisches Architekturhandbuch

**Version:** 1.2
**Status:** Verbindlich
**Referenziert von:** L8_Q7_Technik (Erweiterbarkeit)
**Löst:** Q7-M-047, Q7-M-048, Q7-M-049, Q7-M-050, Q7-M-051, Q7-M-052, Q7-M-053, Q7-M-060

---

# Zweck

Dieses Dokument ist die von L8 abgegrenzte technische Zielarchitektur (siehe Q7-M-047: „L8 zu prinzipienhaft" → eigenes Handbuch als Lösung). L8 bleibt Prinzipienebene; dieses Dokument definiert Datenarchitektur, Integrationsarchitektur, Deployment, Resilienz, Observability und Restore-Strategie konkret.

---

# Grundprinzipien

## 1. Prinzip vs. Umsetzung bleibt getrennt

L8 definiert, dass es Datenhaltung, Integrationen, Sicherheit gibt. Dieses Dokument definiert, wie sie konkret aufgebaut sind. Änderungen hier erfordern keine Änderung von L8, solange die Prinzipien eingehalten werden.

## 2. Datenklasse bestimmt Speicherort

Jede Datenklasse wird einem passenden Store zugeordnet, nicht pauschal einer einzigen Datenbank.

## 3. Integrationen sind Connectors mit Lifecycle

Jede externe Anbindung (siehe L8 Integrationen) ist ein Connector mit definiertem Lebenszyklus, nicht Ad-hoc-Code.

## 4. Resilienz ist komponentenspezifisch

Nicht jede Komponente benötigt denselben Resilienzgrad; Anforderungen werden je Komponente definiert.

---

# Datenarchitektur

| Datenklasse | Store-Typ | Beispiel |
|---|---|---|
| Relationale Geschäftsdaten | PostgreSQL | Lizenznehmer, Cases, Lizenzen |
| Wissens-/Artefakt-Embeddings | Vektor-DB | Retrieval für Q7_Wissens_Artefaktmodell_v1_2.md |
| Dokumente/Dateien | Objektspeicher | Outputs, hochgeladene Dateien |
| Audit-/Protokolldaten | Append-only Store | Protokoll-Modul, Evidence Records (siehe Q7-M-060) |
| Secrets | Secret Manager | siehe Q7_Sicherheitsmodell_v1_6.md |

Jede Datenklasse besitzt genau einen zuständigen Store-Typ; Mischablage derselben Klasse über mehrere Store-Typen ist nicht zulässig (Konsistenz, siehe L7 Grundprinzip 4).

---

# Integrationsarchitektur (Connector Framework)

Jeder Connector (siehe L8 Integrationen) durchläuft:

```text
Registrierung (Connector-ID, Zielsystem, unterstützte Operationen)
↓
Konfiguration je Lizenznehmer (siehe Q7_Tenant_Modell_v1_2.md)
↓
Aktiver Betrieb (inkl. DLP-Prüfung ausgehender Daten, siehe Q7_Sicherheitsmodell_v1_6.md)
↓
Deaktivierung / Außerbetriebnahme (Daten-Handling bei Abschaltung definiert)
```

Kein Connector greift direkt auf interne Q7-Datenstrukturen zu; jeder Connector kommuniziert ausschließlich über das Tool Gateway (siehe Q7_Sicherheitsmodell_v1_6.md).

---

# Deployment

Q7 wird in zwei Deployment-Modi angeboten:

| Modus | Zielgruppe | Merkmal |
|---|---|---|
| SaaS | Standard-Lizenznehmer (Solo, Team) | Von Anbieter betriebene Multi-Tenant-Plattform (siehe Q7_Tenant_Modell_v1_2.md) |
| Private Cloud | Enterprise, Regulated Enterprise | Dedizierte Instanz, EU-Hosting (siehe Q7_Lizenz_und_Deployment_v1_2.md, Editionen) |

Hosting-Entscheidung (z. B. Hetzner, EU-basiert) ist Teil der Infrastruktur-Umsetzung, nicht dieses Architekturhandbuchs — dieses Dokument definiert nur, dass beide Modi architektonisch unterstützt werden müssen.

---

# Resilienzmodell

| Komponente | Resilienzanforderung |
|---|---|
| Policy Engine | Hoch — kein Systembetrieb ohne funktionierende Policy-Prüfung (Fail-Closed, nicht Fail-Open) |
| Workflow-Ausführung (Cases) | Hoch — kein Case-Datenverlust bei Ausfall (siehe L6 Technische Resilienz, rufeKIAn()) |
| Wissensbasis (Retrieval) | Mittel — kurzzeitige Nichtverfügbarkeit tolerierbar, kein Datenverlust |
| Connectors | Niedrig-Mittel — einzelner Connector-Ausfall darf Kernsystem nicht blockieren |

Fail-Closed-Prinzip: Bei Ausfall der Policy Engine werden Zugriffe verweigert, nie automatisch zugelassen.

---

# AI Observability

Ergänzend zu L8 „Protokollierung" werden KI-spezifische Ereignisse erfasst:

- Traces (vollständiger Ausführungspfad eines Agenten-Aufrufs)
- Kosten (Token-/API-Verbrauch je Case, Lizenznehmer)
- Retrieval-Nachvollziehbarkeit (welche Artefaktversionen abgerufen wurden, siehe Execution Evidence Record)
- Tool-Aufrufe (siehe Q7_Sicherheitsmodell_v1_6.md, Tool Gateway Audit)

Diese Daten dienen sowohl Debugging als auch Abrechnung (siehe Q7_Lizenz_und_Deployment_v1_2.md, Nutzungsmetriken).

---

# Restore-Strategie

| Parameter | Zielwert |
|---|---|
| RPO (Recovery Point Objective) | Maximal tolerierbarer Datenverlust — je Store-Typ zu definieren, kritische Stores (PostgreSQL, Audit Store) niedrigster RPO |
| RTO (Recovery Time Objective) | Maximale Wiederherstellungszeit — je Komponente entsprechend Resilienzanforderung (siehe „Resilienzmodell") |
| Restore-Tests | Regelmäßig durchzuführen, Ergebnis protokolliert; ungetestete Backups gelten als nicht existent |

Konkrete RPO/RTO-Zielwerte werden je nach Hosting-Umgebung in der Infrastruktur-Dokumentation (`04_Doku/Infrastruktur/`) festgelegt — dieses Dokument definiert die Pflicht zur Festlegung, nicht die konkreten Werte selbst.

---

# Akzeptanzkriterien

- Jede im System vorkommende Datenklasse ist eindeutig einem der definierten Store-Typen zugeordnet.
- Kein Connector greift nachweislich direkt auf interne Datenstrukturen zu (ausschließlich über Tool Gateway).
- Beide Deployment-Modi (SaaS, Private Cloud) sind architektonisch ohne Grundüberarbeitung des Kernsystems umsetzbar.
- Bei simuliertem Ausfall der Policy Engine werden Zugriffe nachweislich verweigert (Fail-Closed), nicht zugelassen.
- Für jede Kernkomponente existiert ein definierter RPO/RTO-Zielwert, und mindestens ein dokumentierter Restore-Test liegt vor.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich Datenarchitektur, Integrationsarchitektur, Deployment, Resilienz, Observability und Restore-Strategie.
Es vertieft L8 (Technik) und verweist auf Q7_Tenant_Modell_v1_2.md, Q7_Sicherheitsmodell_v1_6.md und Q7_Lizenz_und_Deployment_v1_2.md.
Konkrete Infrastruktur-Werte (Hosting, RPO/RTO-Zahlen) → separate Infrastruktur-Dokumentation.
Es ersetzt keine Inhalte dieser Dokumente und dupliziert sie nicht (SSOT, siehe L2 Dokumentenregeln).

---

# Änderungsregel

Änderungen am technischen Architekturhandbuch dürfen den Prinzipien aus L8 nicht widersprechen.
Jede Änderung ist auf Auswirkungen für Datenarchitektur, Connectors und Resilienz zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (09.07.2026): Ausgangsfassung. Löst Q7-M-047–053, Q7-M-060.
- v1.1 (27.07.2026): Terminologie „GF" → „Admin" (Q7-VERT-006). Resilienzmodell-Referenz auf L6 „Technische Resilienz" aktualisiert (statt veraltetem Failover/Master-Backup). Verweise auf Sicherheitsmodell und Lizenzmodell auf v1.5/v1.1 aktualisiert.
- v1.2 (19.09.2026): "Mandanten" (Datenarchitektur-Beispiel) → "Lizenznehmer". Interne Querverweise auf reale Dateinamen mit Minor-Version korrigiert (Q7_Wissens_Artefaktmodell_v1_2.md, Q7_Sicherheitsmodell_v1_6.md, Q7_Tenant_Modell_v1_2.md, Q7_Lizenz_und_Deployment_v1_2.md).
