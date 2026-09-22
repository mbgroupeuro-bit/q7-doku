---
titel: Q7 ERP und Integrationsplattform
version: 1.1
datum: 2026-08-05
ersetzt: Q7_ERP_und_Integrationsplattform.md (v1.0, undatiert)
---

# Q7 ERP -- Eigenständiges ERP-System

## Ziel

Das Q7 ERP ist ein vollständig eigenständiges ERP-System. Es kann lokal
oder in der Cloud betrieben werden und benötigt Q7 nicht. Optional kann
es später über einen Connector an Q7 angebunden werden.

## Module

-   Dashboard
-   CRM
-   Verkauf
    -   Angebote
    -   Auftragsbestätigungen
    -   Lieferscheine
    -   Rechnungen
    -   Gutschriften
-   Einkauf
-   Lager
-   Finanzen (vereinfacht)
-   Personal (vereinfacht)
-   Einstellungen

## Architektur

``` text
ERP
├── Dashboard
├── CRM
├── Verkauf
├── Einkauf
├── Lager
├── Finanzen
├── Personal
└── Einstellungen
```

## Datenbank

-   Lokal: SQLite
-   Mehrbenutzer/Cloud: PostgreSQL

## Grundprinzipien

-   Eigenständig nutzbar
-   Offline-fähig
-   Einfache Bedienung
-   Kleine und mittlere Unternehmen
-   Erweiterbar durch Plugins und Connectoren
-   Keine Abhängigkeit von Q7

# Q7 Integrationsplattform

## Ziel

Die Integrationsplattform verbindet Q7 mit beliebigen Drittsystemen über
standardisierte Connectoren.

## Architektur

``` text
Q7
 │
Integrationsplattform
 ├── Eigenes ERP Connector
 ├── Odoo Connector
 ├── DATEV Connector
 ├── Microsoft Dynamics Connector
 ├── Shopify Connector
 └── Weitere Connectoren
```

## Standard-Schnittstellen

-   Kunden
-   Artikel
-   Angebote
-   Aufträge
-   Rechnungen
-   Lager
-   Lieferanten
-   Mitarbeiter

Jeder Connector übersetzt diese Funktionen in die jeweilige
Zielsoftware. Q7 kommuniziert ausschließlich mit der
Integrationsplattform und niemals direkt mit den einzelnen Systemen.

## Vorteile

-   Q7 bleibt unabhängig von ERP-Anbietern.
-   Das eigene ERP bleibt als eigenständiges Produkt nutzbar.
-   Neue Systeme können jederzeit über Connectoren ergänzt werden.
-   Einheitliche API für alle Integrationen.

## Q7-seitige Zugriffswege (ergänzt 05.08.2026)

**Entscheidung:** Q7 bekommt **keine eigene ERP-Sidebar-Rubrik**. Der
Zugriff auf die Integrationsplattform läuft ausschließlich über drei
bestehende Q7-Bereiche — kein viertes, paralleles System:

| Zugriffsweg | Richtung | Ort | Beispiel |
|---|---|---|---|
| Studio | Schreibend | Werkzeug → Agent → Output | "Angebot generieren" (A03 Vertrieb), "Lieferschein schreiben" (offen, siehe Aufgabenliste Q7-A-113) |
| Dashboard/Überblick | Lesend, passiv | KPI-Kacheln (siehe Konzeptdokument Abschnitt 3.1) | Umsatz heute, offene Rechnungen, offene Angebote |
| KI-Assistent | Lesend, aktiv (ad-hoc) | Chat | "Wie viele offene Angebote hat Kunde Müller GmbH?" |

Alle drei Wege sprechen dieselbe Integrationsplattform-Abstraktion an —
kein direkter Fremdsystem-Zugriff aus Studio, Dashboard oder Chat heraus.
Technischer Datenfluss für den Schreib- und den Ad-hoc-Lese-Pfad ist noch
nicht spezifiziert (siehe Aufgabenliste Q7-A-113/Q7-A-114).
