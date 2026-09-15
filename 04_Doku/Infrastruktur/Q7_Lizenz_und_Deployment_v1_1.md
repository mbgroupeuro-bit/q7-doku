# Q7 – Lizenz- und Deployment-Modell

**Version:** 1.1
**Status:** Verbindlich
**Referenziert von:** L4_Q7_Organisation (Modulare Abteilungen/Buchungsprinzip), L8_Q7_Technik (Erweiterbarkeit)
**Löst:** Q7-M-065, Q7-M-066, Q7-M-067, Q7-M-068, Q7-M-071

---

# Zweck

Dieses Dokument vertieft L4 (Buchungsprinzip) und L8 (technische Erweiterbarkeit) um das Lizenzmodell, die technische Durchsetzung von Buchungsstatus über Feature Flags, die Trennung von Anbieter-IP und Kundendaten sowie das Update-/Rollback-Modell.

---

# Grundprinzipien

## 1. Lizenz bestimmt Aktivierung, nicht Existenz

Alle Abteilungen und Module sind strukturell immer vorhanden (siehe L4, Modulare Abteilungen); die Lizenz bestimmt ausschließlich, welche davon aktiv nutzbar sind.

## 2. Durchsetzung technisch, nicht vertraglich allein

Lizenzgrenzen (Module, Seats, Nutzungslimits) werden durch das Feature-Flag-/Entitlement-System technisch erzwungen, nicht nur vertraglich vereinbart.

## 3. IP-Schichtung ist bindend

Anbieter-IP und Kundendaten sind in getrennten, klar definierten Schichten geführt. Keine Schicht vermischt Inhalte einer anderen.

## 4. Kein Update ohne Rückweg

Jede Systemaktualisierung ist versioniert und rückrollbar, bevor sie produktiv wird.

---

# Licensing Service

Der Licensing Service verwaltet je Mandant (siehe Q7_Tenant_Modell_v1.md):

| Attribut | Beschreibung |
|---|---|
| Edition | z. B. Q7 Solo, Q7 Team, Q7 Enterprise (siehe Q7-M-071, Ausbaustufen) |
| Gebuchte Module | Liste aktivierter Abteilungen (siehe L4, Modulare Abteilungen) |
| Seats | Anzahl lizenzierter Nutzerzugänge |
| Nutzungslimits | z. B. Case-Volumen, Speicher, Tool-Aufrufe pro Zeitraum |
| Vertragslaufzeit | Gültigkeitszeitraum der Lizenz |

## Editionen

| Edition | Zielgruppe | Charakteristik |
|---|---|---|
| Q7 Solo | Kleinstunternehmen, Einzelunternehmer | Begrenzte Modulauswahl, geringe Seat-/Nutzungslimits, logische Mandantenisolation (Standard) |
| Q7 Team | Kleine bis mittlere Unternehmen | Erweiterte Modulauswahl, Sub-Mandanten optional (siehe Q7_Tenant_Modell_v1.md) |
| Q7 Enterprise | Größere Unternehmen, Konzerne | Vollständige Modulauswahl, hierarchische Sub-Mandanten, physische Isolation optional buchbar |
| Q7 Regulated Enterprise | Regulierte Branchen | Wie Q7 Enterprise, zusätzlich physische Isolation verpflichtend für definierte Datenklassen (siehe Q7_Tenant_Modell_v1.md, Isolationsentscheidung) |

Die Edition ist ein Attribut des Licensing Service und bestimmt die verfügbaren Obergrenzen für Module, Seats und Isolationsoptionen — sie bucht diese nicht automatisch, sondern definiert den maximal möglichen Rahmen je Mandant.

---

# Feature-Flag- und Entitlement-System

```text
Zugriffsversuch auf Modul/Funktion
↓
Entitlement-Prüfung (ist Modul/Funktion für diesen Mandanten gebucht?)
↓
Limit-Prüfung (ist Nutzungslimit erreicht?)
↓
Freigabe / Blockierung mit Hinweis auf Upgrade-Möglichkeit
```

Die Entitlement-Prüfung ist ein Enforcement Point der Policy Engine (siehe Q7_Policy_Engine_v1.2.md) — Lizenzgrenzen werden wie Zugriffsrechte technisch durchgesetzt, nicht separat implementiert.

Nutzungsmetriken (Seats aktiv, Cases pro Zeitraum, Speicherverbrauch) werden fortlaufend erfasst und sind Grundlage für Abrechnung sowie für automatisierte Upgrade-Hinweise.

---

# IP-Schichten

| Schicht | Inhalt | Eigentümer |
|---|---|---|
| Platform Core | Q7-Systemlogik, Policy Engine, Workflow-Engine-Kern | Anbieter (Mokid) |
| Q7 Knowledge | Vorgefertigte Knowledge-Artefakte, SOPs, Standardprozesse | Anbieter (Mokid) |
| Tenant Config | Mandantenspezifische Konfiguration, gebuchte Module, angepasste Prozesse | Mandant (im Rahmen der Lizenz) |
| Customer Data | Kundendaten des Mandanten (Cases, Dokumente, Kommunikation) | Mandant, vollständig |

Zugriff auf „Platform Core" und „Q7 Knowledge" ist für keinen Mandanten und keine Kunden-Rolle möglich (siehe Q7_UI_Spezifikation_v1.md, Black-Box-Prinzip). Mandanten sehen und bearbeiten ausschließlich „Tenant Config" und „Customer Data" innerhalb der eigenen Isolationsgrenzen (siehe Q7_Tenant_Modell_v1.md).

---

# Update- und Rollback-Modell

```text
Neue Version (Platform Core / Q7 Knowledge)
↓
Staging-Prüfung (Kompatibilität mit bestehenden Tenant Configs)
↓
Versionierte Release-Freigabe (Admin, siehe L1 Grundprinzip 9)
↓
Migration (pro Mandant, siehe Q7_Workflow_Detailmodell_v1.1.md „Prozessversionen bei laufenden Cases" für betroffene Prozesse)
↓
Produktivsetzung
↓
Rollback-Option (definierter Zeitraum, vorherige Version bleibt abrufbar)
```

„Tenant Config" und „Customer Data" sind von Platform-Core-Updates strukturell entkoppelt: ein Rollback des Platform Core verändert keine mandantenspezifischen Daten.

---

# Akzeptanzkriterien

- Kein Mandant kann nachweislich auf ein nicht gebuchtes Modul zugreifen, auch nicht über direkte Navigation.
- Jedes erreichte Nutzungslimit blockiert die betroffene Funktion nachweislich, nicht nur informativ.
- Kein Kunden-Zugriff erreicht nachweislich die Schichten „Platform Core" oder „Q7 Knowledge".
- Jede Release-Version ist eindeutig versioniert und innerhalb des definierten Zeitraums rückrollbar, ohne Verlust von Tenant Config oder Customer Data.
- Jede Migrationsentscheidung im Rahmen eines Updates ist auditiert und Admin-freigegeben.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich Lizenzierung, Feature Flags, IP-Schichtung und Update-/Rollback-Modell.
Es vertieft L4 (Buchungsprinzip) und L8 (Erweiterbarkeit) und verweist auf Q7_Tenant_Modell_v1.md, Q7_Policy_Engine_v1.2.md und Q7_Workflow_Detailmodell_v1.1.md.
Es ersetzt keine Inhalte dieser Dokumente und dupliziert sie nicht (SSOT, siehe L2 Dokumentenregeln).

---

# Änderungsregel

Änderungen am Lizenz- und Deployment-Modell dürfen die IP-Schichtentrennung nicht aufweichen.
Jede Änderung ist auf Auswirkungen für bestehende Mandantenlizenzen zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (09.07.2026): Ausgangsfassung. Löst Q7-M-065–068, Q7-M-071.
- v1.1 (27.07.2026): Terminologie „GF" → „Admin" durchgängig (Q7-VERT-005). Release-Freigabe-Instanz präzisiert. Verweis auf Policy Engine auf v1.2 aktualisiert.
