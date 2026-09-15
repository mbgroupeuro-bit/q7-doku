Q7_Teil_C_System.md
Hier Stehen alle aktuellen Ordner, Abteilungen, Agenten, Prozesse, Vorlagen
Zugehörig zu: Q7_System.  Diese Datei wird NUR bearbeitet, wenn eine Haupt-Abteilung hinzukommt, wegfällt oder sich Haupt-Ordnerpfade ändern.


1. ROOT & HAUPTORDNER 📁 ROOT
├── 📁 01_INPUT│   ├── 📁 01_Quarantäne (H-01 exklusiv, 3 Filter, 99_Gefaengnis)│   
├── 📁 02_Eingang (A14 liest, Hermes wartet auf Gate)│ ├── 📁 03_In_Bearbeitung│   ├── 📁 04_Wartend│   └── 📁 05_Archiv│├── 📁 02_KI-UNTERNEHMEN (Siehe Abschnitt 2)│
├── 📁 03_OUTPUT│   └── 📁 01_In_Arbeit bis 05_Archiv│
├── 📁 04_TRESOR (Isoliert, verschlüsselt)│   ├── 📁 K4_Personen (A14 hat Write-Only Zugriff auf KD_Neu/)│   ├── 📁 K4_Zahlungen│   ├── 📁 K4_Zugangsdaten│   └── 📁 K4_SuperAgent│
├── 📁 05_UNTERNEHMEN│   ├── 📁 01_Produkte│   ├── 📁 02_Prozesse│   ├── 📁 03_Vertraege│   ├── 📁 04_Finanzen│   ├── 📁 05_Qualitaet│   ├── 📁 06_Vorlagen (MATRIX1, DNA-Dreiteiler, Checklisten)│   w--├── 📁 07_Onboarding│   ├── 📁 08_Q7_Kultur (Werte, Code of Conduct, Geschäftsprinzipien)│   └── 📁 09_Kunden│       └── 📁 KD_[Nr]_[Name]/ (Flache Struktur: stammdaten.md, produkte.md etc.)│
├── 📁 06_WISSEN│   └── 📁 01_Allgemeines_Wirtschaft bis 06_Best_Practices│
└── 📁 04_Doku (Meta-Ordner)    ├── 📁 Archiv (alte Versionen)    └── 📁 Erfahrungen_Testlaeufe


2. SYSTEMSTRUKTUR 02_KI-UNTERNEHMEN
text

📁 02_KI-UNTERNEHMEN
├── 📁 00_GUI
├── 📁 00_Shared
├── 📁 00_Input-Validator
├── 📁 A00_SuperAgent
├── 📁 A01_Planung_BackOffice
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


3. ABTEILUNGS-ÜBERSICHT
Ordner
Kürzel
Abteilung
Notiz
A00	00SA	Super-Agent	Beobachtet, keine Entscheidungsbefugnis.
A01	H	Hermes — Planung & BackOffice	Koordiniert alle Aufträge.
A02	02M	Marketing	Führt Digital Audit durch.
A03	03V	Vertrieb	
A04	04PM	Projektmanagement	
A05	05QM	Qualitätsmanagement	Unabhängig, wie A14.
A06	06VW	Verwaltung	
A07	07R	Recht	
A08	08F	Finanzen	Inkl. DRI-Gatekeeper für Tresor.
A09	09D	Dokumentation	
A10	10KI	KI-Center	Technische Einrichtung von Agenten.
A11	11SC	Systemcontrolling	Überwacht System.
A12	12ZF	Zukunftsforschung	Branchen-Benchmarks.
A13	13P	Personal	Agenten-Lebenszyklus.
A14	14S	Sicherheit	PII-Trennung & Gate-Mechanismus. Unabhängig.













Q7_Teil_C_System.md
