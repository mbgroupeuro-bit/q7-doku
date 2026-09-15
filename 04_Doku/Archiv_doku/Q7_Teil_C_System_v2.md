# Q7_Teil_C_System

Zugehörig zu: Q7_System  
Schwesterdateien: → Q7_Teil_A_System.md · → Q7_Teil_B_System.md  
Diese Datei wird NUR bearbeitet, wenn eine Haupt-Abteilung hinzukommt, wegfällt oder sich Haupt-Ordnerpfade ändern.

---

## 1. ROOT & HAUPTORDNER

```text
📁 ROOT
├── 📁 00_GUI (Infrastruktur, Sonderpräfix)
├── 📁 01_INPUT
│   ├── 📁 01_Quarantäne (A14 exklusiv, 3 Filter)
│   ├── 📁 02_Eingang (A14 liest, Hermes wartet auf Gate)
│   ├── 📁 03_In_Bearbeitung
│   ├── 📁 04_Wartend
│   └── 📁 05_Archiv
├── 📁 02_KI-UNTERNEHMEN (Siehe Abschnitt 2)
├── 📁 03_OUTPUT
│   ├── 📁 01_In_Arbeit
│   ├── 📁 02_Zur_Freigabe
│   ├── 📁 03_Freigegeben
│   ├── 📁 04_Abgelehnt
│   └── 📁 05_Archiv
├── 📁 04_TRESOR (Isoliert, verschlüsselt)
│   ├── 📁 K4_Personen (A14 hat Write-Only Zugriff auf KD_Neu/)
│   ├── 📁 K4_Zahlungen
│   ├── 📁 K4_Zugangsdaten
│   └── 📁 K4_SuperAgent
├── 📁 05_UNTERNEHMEN
│   ├── 📁 01_Produkte
│   ├── 📁 02_Prozesse
│   ├── 📁 03_Vertraege
│   ├── 📁 04_Finanzen
│   ├── 📁 05_Qualitaet
│   ├── 📁 06_Vorlagen (MATRIX1, DNA-Dreiteiler, Checklisten)
│   ├── 📁 08_Q7_Kultur (Werte, Code of Conduct, Geschäftsprinzipien)
│   └── 📁 09_Kunden
│       └── 📁 KD_[Nr]_[Name]/ (Flache Struktur: stammdaten.md, produkte.md etc.)
├── 📁 06_WISSEN (Flache Struktur — Wissensdateien frei ablegbar, z.B. mewes.md, limbicmap.md. Unterordner bei Bedarf.)
├── 📁 04_Doku (Meta-Ordner)
│   ├── 📁 Archiv (alte Versionen)
│   └── 📁 Erfahrungen_Testlaeufe
└── 📁 99_Gefaengnis (Isolierte Cells — Zielort für Dateien die A14-Sicherheitscheck nicht bestehen)
```

---

## 2. SYSTEMSTRUKTUR 02_KI-UNTERNEHMEN

```text
📁 02_KI-UNTERNEHMEN
├── 📁 A00_SuperAgent
├── 📁 A01_Planung_Vorbereitung
├── 📁 A02_Marketing
├── 📁 A03_Vertrieb
├── 📁 A04_PM
├── 📁 A05_QM
├── 📁 A06_Verwaltung
├── 📁 A07_Recht
├── 📁 A08_Finanzen
├── 📁 A09_Dokumentation
├── 📁 A10_KI-Center
├── 📁 A11_Systemcontrolling
├── 📁 A12_Zukunftsforschung
├── 📁 A13_Personal
└── 📁 A14_Sicherheit
```

---

## 3. ABTEILUNGS-ÜBERSICHT

| Ordner | Kürzel | Leiter | Abteilung | Notiz |
|--------|--------|--------|-----------|-------|
| A00 | ST | Super-Agent | Stab | Beobachtet, keine Entscheidungsbefugnis. |
| A01 | PV | Hermes | Planung & Vorbereitung | Koordiniert alle Aufträge. |
| A02 | 02M | Marketing-Leiter | Marketing | Führt Digital Audit durch. |
| A03 | 03V | Vertriebs-Leiter | Vertrieb | |
| A04 | 04PM | PM-Leiter | Projektmanagement | |
| A05 | 05QM | QM-Leiter | Qualitätsmanagement | Unabhängig, wie A14. |
| A06 | 06VW | Verwaltungs-Leiter | Verwaltung | |
| A07 | 07R | Rechts-Leiter | Recht | |
| A08 | 08F | Finanz-Leiter | Finanzen | Inkl. DRI-Gatekeeper für Tresor. |
| A09 | 09D | Doku-Leiter | Dokumentation | |
| A10 | 10KI | KI-Leiter | KI-Center | Technische Einrichtung von Agenten. |
| A11 | 11SC | SC-Leiter | Systemcontrolling | Überwacht System. |
| A12 | 12ZF | ZF-Leiter | Zukunftsforschung | Branchen-Benchmarks. |
| A13 | 13P | Personal-Leiter | Personal | Agenten-Lebenszyklus. |
| A14 | 14S | Sicherheits-Leiter | Sicherheit | PII-Trennung & Gate-Mechanismus. Unabhängig. |

---

Status: Aktiv
