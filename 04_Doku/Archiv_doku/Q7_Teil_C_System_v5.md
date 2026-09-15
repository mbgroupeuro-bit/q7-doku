# Q7_Teil_C_System_v5.md — STRUKTUR & PROZESS-REGISTER

**System-Version:** v5.0 | **Aktualisiert:** 02.07.2026  
**Änderungen seit v4.0:** C-10 Offener Punkt vermerkt: `07_Bedarfsanalyse/` ist noch kein definierter Unterordner — Einordnung steht aus (Voraussetzung für Teil-B-Entscheid P23-03, siehe Teil B Kap. 31) · C-06 Abschnitt 1 KD_Neu/ → KD_[Nr] direkt (Tresor-Pfad korrigiert) · C-07 Abschnitt 1 01_Quarantäne-Zugriff auf A14+GF präzisiert · C-08 Abschnitt 1 02_Eingang-Zeile korrigiert · C-09 Abschnitt 3 A14b ergänzt, A01 monolithisch-Notiz, A14-Beschreibung erweitert

Zugehörig zu: Q7_System  
Schwesterdateien: → Q7_Teil_A_System.md · → Q7_Teil_B_System.md  
Diese Datei wird NUR bearbeitet, wenn eine Haupt-Abteilung hinzukommt, wegfällt oder sich Haupt-Ordnerpfade ändern.

---

## 1. ROOT & HAUPTORDNER

```text
📁 ROOT
├── 📁 00_GUI (Infrastruktur, Sonderpräfix)
├── 📁 01_INPUT
│   ├── 📁 01_Quarantäne (A14 + GF exklusiv — Filter 1+2+PII, kein A01-Zugriff)
│   ├── 📁 02_Eingang (nach A14-Freigabe: A01a übernimmt Filter 3 + IT-ID)
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
│   ├── 📁 K4_Personen (A14 hat Write-Only Zugriff direkt auf KD_[Nr] — kein KD_Neu/ Zwischenschritt)
│   ├── 📁 K4_Zahlungen
│   └── 📁 K4_Zugangsdaten
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
├── 📁 A00_StabAgent
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
| A00 | ST | Stab-Agent | Stab | Beobachtet passiv alle Ebenen, keine Entscheidungsbefugnis. Vorschlagsrecht Kultur (S6). |
| A01 | PV | Hermes (A01a) | Planung & Vorbereitung | Koordiniert alle Aufträge. Aktuell monolithisch — kein Subagenten-Schema aktiv (H-01–H-05 vorgesehen, noch nicht umgesetzt). |
| A02 | 02M | Marketing-Leiter | Marketing | Führt Digital Audit durch. |
| A03 | 03V | Vertriebs-Leiter | Vertrieb | |
| A04 | 04PM | PM-Leiter | Projektmanagement | |
| A05 | 05QM | QM-Leiter | Qualitätsmanagement | Unabhängig, wie A14. Zusätzlich: Freigabe-Vorprüfung H-04b (→ Teil B Kap. 9). |
| A06 | 06VW | Verwaltungs-Leiter | Verwaltung | |
| A07 | 07R | Rechts-Leiter | Recht | |
| A08 | 08F | Finanz-Leiter | Finanzen | Inkl. DRI-Gatekeeper für Tresor. |
| A09 | 09D | Doku-Leiter | Dokumentation | |
| A10 | 10KI | KI-Leiter | KI-Center | Technische Einrichtung von Agenten. Pflegt A14-Whitelist. |
| A11 | 11SC | SC-Leiter | Systemcontrolling | Überwacht System. |
| A12 | 12ZF | ZF-Leiter | Zukunftsforschung | Branchen-Benchmarks. |
| A13 | 13P | Personal-Leiter | Personal | Agenten-Lebenszyklus. |
| A14 | 14S | A14a (Sicherheits-Leiter) | Sicherheit | Filter 1 (Schadsoftware) + Filter 2 (Spam) + PII-Trennung — vollständig in 01_Quarantäne. Unabhängig. Backup: A14b (10 Sek. automatischer Failover). |

---

## 4. OFFENE STRUKTURFRAGEN

| Punkt | Beschreibung | Verknüpft mit |
|---|---|---|
| `07_Bedarfsanalyse/` | Noch nicht als Unterordner definiert. Frage: unter `05_UNTERNEHMEN/02_Prozesse/` oder eigener Zweig? | Teil B Kap. 31, P23-03 |

---

*Teil C — Struktur & Prozess-Register | Basis: Q7 v5.0 | Überblick: Teil A | Detail: Teil B*

Status: Aktiv
