# KI-UNTERNEHMEN — VOLLSTÄNDIGE SYSTEMDOKUMENTATION v16.0
**Erstellt:** 19.06.2026 | **System-Version:** v16.0 (2026-06-19) | **GUI-Version:** GUI_v2.0

---

## ÄNDERUNGSHISTORIE

| Version | Datum | Änderungen |
|---------|-------|------------|
| v12.0 | 29.05.2026 | Integration Backup-, Failover- und RBAC-Architektur |
| v13.0 | 16.06.2026 | Einführung DRI. Behebung K4-Sicherheitswiderspruch |
| v13.1 | 16.06.2026 | Hierarchie-Korrektur, SuperAgent, RBAC-Update, Systemcontrolling erweitert |
| v13.2 | 16.06.2026 | Unveränderlichkeits-Protokoll (Audit-Trail), Hash-Validierung |
| v14.0 | 16.06.2026 | MAJOR: Desktop-GUI als zentrale Schnittstelle, 4 Module, Anomalie-Erkennung |
| v15.0 | 16.06.2026 | MAJOR: Neue 6-Ordner-Grundarchitektur. Einführung A01_Planung_BackOffice mit Hermes-Agent. Quarantäne-Logik im Input. Checkpoint-System für Agenten. Onboarding-Phase 0. GUI erweitert auf 5 Module |
| **v16.0** | **19.06.2026** | **MAJOR: Quarantäne zur vollständigen Sicherheitsschleuse ausgebaut (3 Filterstufen gegen Viren/Malware/Spam). Neue Abteilung A13_Personal — vollständiger Agenten-Lebenszyklus (Stellenprofil → Onboarding → Probezeit → Bewertung → Verfahren → Kündigung). Hierarchie erweitert auf A02–A13.** |

---

## 1. GESAMT-HIERARCHIE

```
👑 GF — GESCHÄFTSFÜHRER
   (Mensch — höchste Instanz, alle Rechte)
   ↕
🖥️  DESKTOP-OBERFLÄCHE (GUI_v2.0)
   [INBOX] [AUFTRÄGE] [FREIGABEN] [AGENTEN] [PROTOKOLL]
   ↕
🧠 SUPER-AGENT (A00)
   (Beobachtet, lernt, schlägt vor — keine Entscheidungsbefugnis)
   ↓
🎯 HERMES-AGENT — A01_Planung_BackOffice
   (Koordination, Arbeitsvorbereitung, Qualitätskontrolle)
   ↓
🤖 MASTER-AGENT (Primär) + BACKUP-AGENT (Sekundär)
   ↓
📁 A02–A13 FACHABTEILUNGEN
```

### Hierarchie-Regeln

- **GF** = einziger Mensch, vollständige Kontrolle, kann jeden Agenten abschalten
- **GUI** = einzige Schnittstelle zwischen GF und System — kein direkter Ordnerzugriff
- **Super-Agent** = beobachtet alles, bereitet Entscheidungen vor, hat KEINE Entscheidungsbefugnis
- **Hermes** = Abteilungsleiter Planung & BackOffice, koordiniert alle Aufträge, erstellt Workflows
- **Master-Agent** fällt aus → Backup-Agent springt automatisch ein
- Beide ausgefallen → Systemcontrolling schlägt Alarm → GF entscheidet manuell via GUI

### Die vier Ebenen im Vergleich

| Ebene | Wer | Funktion |
|-------|-----|----------|
| Kontrolle | GF (Mensch) | Entscheidet, freigibt, stoppt |
| Beobachtung | Super-Agent | Überwacht, lernt, schlägt vor |
| Koordination | Hermes-Agent | Plant, verteilt, prüft |
| Ausführung | Fachabteilungen A02–A13 | Spezialisierte Arbeit |

---

## 2. GRUNDARCHITEKTUR — 6 HAUPT-ORDNER

```
📁 ROOT
│
├── 📁 01_INPUT          ← Alles von der Außenwelt
├── 📁 02_KI-UNTERNEHMEN ← Das KI-Betriebssystem
├── 📁 03_OUTPUT         ← Alles was Agenten erstellt haben
├── 📁 04_TRESOR         ← Nur sensible Daten (verschlüsselt)
├── 📁 05_UNTERNEHMEN    ← Unternehmensdaten & Betriebswissen
└── 📁 06_WISSEN         ← Allgemeines & spezielles Wissen
```

### Logik der 6 Ordner

| Ordner | Frage | Inhalt |
|--------|-------|--------|
| 01_INPUT | Was kommt rein? | Alles von der Außenwelt |
| 02_KI-UNTERNEHMEN | Wer arbeitet? | Das gesamte KI-System |
| 03_OUTPUT | Was geht raus? | Alle Agenten-Ergebnisse |
| 04_TRESOR | Was ist geheim? | Personenbezogene & sicherheitskritische Daten |
| 05_UNTERNEHMEN | Wer sind wir? | Betriebliches Wissen & Dokumentation |
| 06_WISSEN | Was wissen wir? | Externes & allgemeines Wissen |

### Wichtige Trennlinie: 04_TRESOR vs. 05_UNTERNEHMEN

- **04_TRESOR:** Name, Adresse, Bankdaten eines Kunden → personenbezogen, sicherheitskritisch, verschlüsselt, nur via DRI
- **05_UNTERNEHMEN:** Produktkatalog, Lieferantenverträge, Produktionsprozesse, Preislisten → betriebliches Wissen, intern zugänglich

---

## 3. ORDNER 01_INPUT — DETAILSTRUKTUR & SICHERHEITSSCHLEUSE

Alles von der Außenwelt landet zuerst hier. Kein Agent, kein Prozess, kein System
berührt einen eingehenden Input, bevor er die Quarantäne vollständig durchlaufen hat.

```
📁 01_INPUT
│
├── 📁 01_Quarantäne          ← PFLICHTSTATION — ALLES von außen landet hier
│   └── (H-01 ist der einzige Agent mit Zugriff auf diesen Ordner)
│
├── 📁 02_Eingang             ← Freigegeben, IT-ID vergeben, bereit zur Verarbeitung
│
├── 📁 03_In_Bearbeitung      ← Aktive Aufträge, Hermes hat Workflow erstellt
│
├── 📁 04_Wartend             ← Wartet auf: Kundenantwort / GF-Freigabe / externe Info
│
└── 📁 05_Archiv              ← Abgeschlossene Eingänge (IT-ID bleibt, verknüpft mit OT-ID)
```

### 3.1 Was ist die Quarantäne?

Die Quarantäne ist die **Außenstelle des Unternehmens** — der einzige Punkt,
an dem die Außenwelt mit dem internen System in Berührung kommt.

Alle eingehenden Kanäle landen hier:

| Kanal | Beispiele |
|-------|-----------|
| E-Mail | Kundenanfragen, Bestellungen, Bewerbungen, Newsletter |
| WhatsApp / Messenger | Kundenanfragen, Bilder, Sprachnachrichten |
| Webformulare | Kontaktformular, Bestellformular, Support-Ticket |
| Post / Scan | Briefe, Verträge, Rechnungen (eingescannt) |
| Telefon / Voicemail | Transkribierte Nachrichten, Notizen |
| Uploads / Anhänge | PDFs, Bilder, Dokumente jeglicher Art |

**Grundregel:** Kein Inhalt verlässt die Quarantäne, bis alle Filter bestanden sind.
Kein anderer Agent darf `01_Quarantäne/` lesen oder schreiben — ausschließlich H-01.

---

### 3.2 H-01 — Die drei Sicherheitsfilter

H-01 führt jeden eingehenden Input sequenziell durch drei Filter.
**Alle drei müssen bestanden werden.** Scheitert ein Filter → Input bleibt blockiert.

**SLA: max. 15 Minuten** für den gesamten Durchlauf.
Überwachung: 11SC-01 Monitoring.

---

#### Filter 1 — Technische Sicherheitsprüfung

**Ziel:** Viren, Trojaner, Malware und schadhafter Code werden erkannt
und blockiert, bevor sie das System erreichen.

```
Eingehender Input
   ↓
Virusscan (alle Anhänge, alle Dateien)
   ↓
Malware-Erkennung (ausführbare Dateien, Skripte, Makros)
   ↓
Link-Prüfung (URLs auf Phishing / bekannte Schadseiten)
   ↓
Absender-Verifikation (bekannte Spam-Quellen, Blacklist-Abgleich)
   ↓
Dateiformat-Prüfung (nur erlaubte Formate passieren)
```

**Erlaubte Dateiformate (Whitelist):**

| Kategorie | Erlaubt |
|-----------|---------|
| Dokumente | .pdf, .docx, .xlsx, .txt |
| Bilder | .jpg, .jpeg, .png, .webp |
| Tabellen | .csv |
| Sonstige | nach GF-Freigabe erweiterbar |

**Verboten (automatische Blockierung):**
`.exe`, `.bat`, `.sh`, `.js`, `.vbs`, `.ps1`, Passwortgeschützte `.zip`-Archive,
Makro-aktivierte Office-Dateien (`.xlsm`, `.docm`), verschlüsselte Archive.

**Bei Fund:**
```
Schadcode / Virus erkannt
   ↓
Input wird sofort isoliert (bleibt in 01_Quarantäne, gesperrt)
   ↓
GF-Alarm via GUI-Modul INBOX (Anomalie A6 — Level HIGH)
   ↓
11SC-04 Sicherheitsaudit übernimmt Analyse
   ↓
Audit-Trail-Eintrag: AUD_..._H-01, Aktion: SICHERHEITSALARM
   ↓
GF entscheidet: löschen / weiter analysieren / Behörde informieren
```

**Verantwortlich für Regelpflege:** A10_KI-Center pflegt Whitelist und Scan-Regeln.
Änderungen nur mit GF-Freigabe.

---

#### Filter 2 — Inhaltliche Legitimität

**Ziel:** Nur relevante, legitime Inhalte kommen ins System.
Spam, Werbung, Irrelevantes wird aussortiert.

```
Input hat Filter 1 bestanden
   ↓
Ist es Spam oder automatisch generierte Werbung?    → Ablehnen + protokollieren
   ↓
Ist der Absender erkennbar und nachvollziehbar?     → weiter
   ↓
Hat der Inhalt einen klaren Bezug zum Unternehmen? → weiter
   ↓
Ist die Sprache/Intention verständlich?             → weiter
   ↓
Filter 2 bestanden
```

**Grenzfälle → GF-Alarm:**
Inhalte, die nicht eindeutig einzuordnen sind (z.B. drohende Sprache,
rechtlich sensible Formulierungen, unbekannte Absender mit unklarer Intention)
werden nicht abgelehnt und nicht freigegeben — sie warten auf GF-Entscheidung
in `01_INPUT/04_Wartend`.

---

#### Filter 3 — Vollständigkeit & Verarbeitbarkeit

**Ziel:** Nur Inputs, die vollständig genug sind, um verarbeitet zu werden,
gelangen ins System. Unvollständige Inputs bekommen eine Rückfrage.

```
Input hat Filter 1 + 2 bestanden
   ↓
Sind die Mindestinformationen vorhanden?
(Kontaktweg + Anliegen = Minimum für jeden Input-Typ)
   ↓
NEIN → Rückfrage an Absender (siehe Rückfrage-Prozess)
   ↓
JA  → Filter 3 bestanden → Freigabe
```

**Mindestinformationen je Input-Typ** (definiert durch A05_QM):

| Input-Typ | Minimum |
|-----------|---------|
| Bestellung | Produkt, Menge, Kontaktweg |
| Anfrage / Anliegen | Thema, Kontaktweg |
| Beschwerde | Problem, Bestellreferenz oder Datum, Kontaktweg |
| Bewerbung | Position, Lebenslauf oder Erfahrung, Kontaktweg |
| Kooperation | Art der Kooperation, Unternehmen, Kontaktweg |

---

### 3.3 Rückfrage-Prozess (Filter 3 nicht bestanden)

```
H-01 erkennt fehlende Mindestinformation
   ↓
Rückfrage wird generiert (Template aus 05_UNTERNEHMEN/02_Prozesse/)
   ↓
Versand über denselben Kanal, über den der Input kam
(E-Mail → E-Mail-Antwort, WhatsApp → WhatsApp-Antwort)
   ↓
Input wechselt in 01_INPUT/04_Wartend
   ↓
Frist: 48 Stunden
   ↓
Antwort eingegangen → Filter 3 erneut prüfen
Keine Antwort nach 48h → automatische Ablehnung + Protokollierung
```

**Dateiname der Rückfrage:**
`Rueckfrage_[Kanal]_[Datum]_[lfd.Nr.].md`
Beispiel: `Rueckfrage_Email_17_06_2026_003.md`

**Speicherort:** `02_KI-UNTERNEHMEN/A01_Planung_BackOffice/05_SubAgenten/H-01_Auftragsannahme/`

---

### 3.4 Freigabe — Was passiert nach bestandenen Filtern?

```
Alle drei Filter bestanden
   ↓
H-01 gibt Input frei
   ↓
H-05 (Koordination) vergibt IT-ID
Format: IT_TT_MM_JJJJ_Nr  (z.B. IT_19_06_2026_004)
   ↓
Input wird in 01_INPUT/02_Eingang verschoben
   ↓
H-00 (Hermes) erstellt Workflow → Verarbeitung beginnt
   ↓
Eintrag im Dashboard: "Neuer validierter Input" (GUI-Modul AUFTRÄGE)
   ↓
Audit-Trail: AUD_..._H-01, Aktion: Freigabe
```

---

### 3.5 Protokollierung aller H-01 Entscheidungen

Jede Entscheidung wird automatisch im Audit-Trail erfasst (Kap. 17):

| Entscheidung | Audit-Aktion | Weiterleitung |
|-------------|--------------|---------------|
| Freigegeben | Freigabe | → 02_Eingang, IT-ID durch H-05 |
| Rückfrage | Rückfrage | → 04_Wartend, 48h-Frist |
| Abgelehnt (Spam) | Ablehnung + Grund | → 11SC-01 Statistik |
| Abgelehnt (Timeout) | Timeout-Ablehnung | → 11SC-01 Statistik |
| Sicherheitsalarm | SICHERHEITSALARM | → GF-Alarm + 11SC-04 |
| GF-Alarm (Grenzfall) | GF-Vorlage | → 04_Wartend, GF entscheidet |

**Tagesbericht** — 11SC-01 erstellt täglich um 09:00 Uhr:
- Anzahl freigegebener Inputs pro Kanal (E-Mail, WhatsApp, etc.)
- Anzahl blockierter Sicherheitsalarme
- Anzahl Rückfragen (offen / beantwortet / abgelaufen)
- Anzahl Ablehnungen + häufigste Gründe
- Durchschnittliche Durchlaufzeit (Ziel: unter 15 Min.)
- Quarantäne-Rückstau > 10 offen → automatischer GF-Alarm (Kap. 23)

**Mustererkennung:** Bei mehr als 5 Alarmen desselben Typs innerhalb von 7 Tagen
→ H-01 meldet Muster an Super-Agent (A00) → A00 schlägt GF Gegenmaßnahme vor.

---

## 4. ORDNER 03_OUTPUT — DETAILSTRUKTUR

```
📁 03_OUTPUT
│
├── 📁 01_In_Arbeit           ← Agenten arbeiten noch daran
│
├── 📁 02_Zur_Freigabe        ← Fertig, wartet auf GF oder Hermes-Freigabe
│
├── 📁 03_Freigegeben         ← GF hat freigegeben, bereit zum Versand
│
├── 📁 04_Versendet           ← Rausgegangen an Außenwelt
│
└── 📁 05_Archiv              ← Abgeschlossen, verknüpft mit IT-ID
```

---

## 5. ORDNER 04_TRESOR — DATENSCHUTZ & DRI

**Position:** Separater Bereich — physisch und logisch isoliert vom normalen System.

**Inhalt:** Ausschließlich sensible, personenbezogene Daten.

```
📁 04_TRESOR (Isoliert, verschlüsselt)
│
├── 📁 K4_Personen
│   ├── telefonnummern.enc
│   └── adressen.enc
│
├── 📁 K4_Zahlungen
│   └── bankdaten.enc
│
├── 📁 K4_Zugangsdaten
│   └── api_keys.enc
│
├── 📁 K4_SuperAgent
│   └── lernprotokoll_v1.enc
│
└── zugriffsprotokoll_v1.md   ← Jeder DRI- und GF-Zugriff protokolliert
```

### Dynamic Request Interface (DRI)

- Kein Agent hat direkten Zugriff auf den Tresor
- Zugriff nur über DRI: punktuelle, validierte Einzelanfrage pro Vorgang
- Exklusiv autorisiert: **08F-02_Invoicing** (nur für Rechnungsstellung)
- K4-Daten werden nur im RAM zusammengeführt → direkte PDF-Generierung → Cache sofort überschrieben
- Jede nicht-autorisierte DRI-Anfrage wird abgelehnt und an 11SC-04 gemeldet

---

## 6. ORDNER 05_UNTERNEHMEN — BETRIEBSWISSEN

Alles was das Unternehmen ausmacht — kein personenbezogenes Material, das kommt in den Tresor.

```
📁 05_UNTERNEHMEN
│
├── 📁 01_Produkte            ← Produktkatalog, Spezifikationen, Pläne
├── 📁 02_Prozesse            ← Wie wir arbeiten, Workflows, Abläufe
├── 📁 03_Vertraege           ← Lieferanten-, Kunden-, Partnerverträge
├── 📁 04_Finanzen            ← Preislisten, Kalkulationen, Budgets
├── 📁 05_Qualitaet           ← Standards, Normen, Qualitätsvorgaben
├── 📁 06_Marketing           ← Markenidentität, Kommunikationsrichtlinien
└── 📁 07_Onboarding          ← Unternehmens-DNA (aus Phase 0 aufgebaut)
    ├── unternehmen_profil_v1.md
    ├── produkte_v1.md
    ├── kundenprofil_v1.md
    ├── qualitaetsstandards_v1.md
    ├── kommunikation_ton_v1.md
    └── haeufige_sonderfaelle_v1.md
```

---

## 7. ORDNER 06_WISSEN — WISSENSBASIS

Externes, allgemeines und branchenspezifisches Wissen — unabhängig vom eigenen Unternehmen.

```
📁 06_WISSEN
│
├── 📁 01_Allgemeines_Wirtschaft   ← BWL, Management, Strategie, Recht
├── 📁 02_Branchenwissen           ← Spezifisch für die eigene Branche
├── 📁 03_Marktdaten               ← Wettbewerb, Trends, Marktanalysen
├── 📁 04_Technologie              ← KI, Digitalisierung, Tools
├── 📁 05_Recht_Compliance         ← Relevante Gesetze, DSGVO, Normen
└── 📁 06_Best_Practices           ← Bewährte Methoden, Fallstudien
```

---
## 8. ORDNER 02_KI-UNTERNEHMEN — SYSTEMSTRUKTUR

```
📁 02_KI-UNTERNEHMEN
│
├── 📁 00_GUI                 ← Desktop-Oberfläche (Konfig, Logs, Snapshots)
├── 📁 00_Shared              ← Temporäre abteilungsübergreifende Zusammenarbeit
├── 📁 00_Input-Validator     ← Qualitätsprüfung (unter Hermes)
├── 📁 A00_SuperAgent         ← Super-Agent Arbeitsbereich
├── 📁 A01_Planung_BackOffice ← Hermes + Sachbearbeiter
├── 📁 A02_Marketing          ← Marketing (17 Sub-Agenten)
├── 📁 A03_Vertrieb           ← Vertrieb (6 Sub-Agenten)
├── 📁 A04_PM                 ← Projektmanagement
├── 📁 A05_QM                 ← Qualitätsmanagement
├── 📁 A06_Verwaltung         ← Verwaltung
├── 📁 A07_Recht              ← Recht
├── 📁 A08_Finanzen           ← Finanzen (inkl. Rechnungs-Gatekeeper)
├── 📁 A09_Dokumentation      ← Dokumentation
├── 📁 A10_KI-Center          ← KI-Center
├── 📁 A11_Systemcontrolling  ← Systemcontrolling (5 Sub-Agenten)
├── 📁 A12_Zukunftsforschung  ← Zukunftsforschung
└── 📁 A13_Personal           ← Personal — Agenten-Lebenszyklus (NEU v16.0)
```

---

## 9. A01_PLANUNG_BACKOFFICE — HERMES-ABTEILUNG

### 9.1 Position und Zweck

A01_Planung_BackOffice ist die **zentrale Koordinationsabteilung** des KI-Unternehmens.

**Abteilungsleiter:** Hermes-Agent — analysiert, plant, koordiniert, lernt.

**Analogie:** Wie in einem reellen Unternehmen die Auftragsbearbeitung / Arbeitsvorbereitung — ein Auftrag kommt rein, wird geplant, vorbereitet, verteilt und nachverfolgt, bevor er in die Fachabteilungen geht.

### 9.2 Struktur

```
📁 A01_Planung_BackOffice
│
├── 📄 README.md
├── 📁 02_Grundlagen
│   ├── hermes_wissensbasis_v1.md     ← wächst mit jeder Entscheidung
│   ├── workflow_bibliothek_v1.md     ← alle bewährten Workflows gespeichert
│   └── entscheidungsprotokoll_v1.md  ← GF-Entscheidungen + Kontext
│
├── 📁 03_Prozesse
│
└── 📁 05_SubAgenten
    ├── 📁 H-00_Hermes               ← Abteilungsleiter
    ├── 📁 H-01_Auftragsannahme      ← Quarantäne-Prüfung & Analyse
    ├── 📁 H-02_Arbeitsvorbereitung  ← Workflow-Erstellung & Planung
    ├── 📁 H-03_Projektmanagement    ← Zeitplan, Fortschritt, Eskalation
    ├── 📁 H-04_Qualitaetskontrolle  ← Output-Prüfung vor Freigabe
    └── 📁 H-05_Koordination         ← Schnittstelle zu Fachabteilungen
```

### 9.3 Agenten-Kürzel

| Kürzel | Rolle | Aufgabe |
|--------|-------|---------|
| H-00 | Hermes (Abteilungsleiter) | Analysiert, erstellt Workflows, lernt, passt an |
| H-01 | Auftragsannahme & Analyse | Was kommt rein? Welche Art? Vollständig? Quarantäne |
| H-02 | Arbeitsvorbereitung | Wie wird es bearbeitet? Welche Schritte? Welche Abteilung? |
| H-03 | Projektmanagement | Zeitplan, Abhängigkeiten, Fortschritt, Eskalation bei Verzug |
| H-04 | Qualitätskontrolle | Prüft Output bevor er GF erreicht oder nach außen geht |
| H-05 | Koordination & BackOffice | Schnittstelle zu Fachabteilungen, IT-IDs verteilen, OT-IDs einsammeln |

### 9.4 Auftragsablauf

```
01_INPUT/01_Quarantäne
   ↓
H-01: Annehmen & analysieren (Was ist das? Legitim? Vollständig?)
   ↓
H-00 (Hermes): Workflow erstellen (Welche Schritte? Welche Abteilung? Reihenfolge?)
   ↓
H-02: Arbeitsvorbereitung (Unterlagen, Kontext, Wissensbasis bereitstellen)
   ↓
H-03: Koordinieren & überwachen (OT-IDs pünktlich? Eskalation bei Verzug?)
   ↓
Fachabteilungen A02–A13: Facharbeit ausführen
   ↓
H-04: Qualitätskontrolle (Output vollständig und korrekt?)
   ↓
H-05: Abschließen & melden (Ergebnis an GF via GUI)
```

### 9.5 Hermes als intelligenter Koordinator

Hermes ist **nicht starr** — er erstellt immer neue, situationsgerechte Workflows:

| Auftragstyp | Hermes erstellt |
|-------------|-----------------|
| Bestellung | Workflow A: Bestätigung → Produktion → Rechnung → Versand |
| Beschwerde | Workflow B: Analyse → Stellungnahme → Lösung → Nachverfolgung |
| Presseanfrage | Workflow C: Prüfung → Abstimmung GF → Antwort → Archiv |
| Neues Projekt | Workflow D: Kickoff → Planung → Umsetzung → Review |

---

## 10. CHECKPOINT-SYSTEM FÜR AGENTEN

### 10.1 Prinzip

Kein Agent arbeitet blind durch einen komplexen Auftrag. Große Aufgaben werden in definierte Einzelschritte unterteilt. Nach jedem Schritt wird das Zwischenergebnis geliefert und freigegeben — erst dann geht es weiter.

**Ziel:** Verhindert Drift. Ein Agent kann nicht 10 Schritte in die falsche Richtung laufen.

### 10.2 Ablauf

```
Auftrag: "Erstelle Social-Media-Kampagne für Produktlaunch"
   ↓
Schritt 1: Zielgruppe & Botschaft definieren
           → Agent liefert Ergebnis
           → Hermes/GF prüft → [Freigabe / Korrektur / Neu]
   ↓
Schritt 2: Kanalstrategie entwickeln
           → Agent liefert Ergebnis
           → Hermes/GF prüft → [Freigabe / Korrektur / Neu]
   ↓
Schritt 3: Inhalte erstellen (Agent liefert 4 Varianten)
           → GF wählt Variante 4 → "Variante 4, weiter damit"
   ↓
Schritt 4: Zeitplan & Veröffentlichungsplan
           → Agent liefert Ergebnis
           → Hermes/GF prüft → [Freigabe]
   ↓
Schritt 5: Finales Paket → Qualitätskontrolle H-04 → GF-Freigabe
```

### 10.3 Varianten-Prinzip

Wenn ein Agent mehrere Varianten liefert (z.B. 4 Entwürfe), entscheidet GF oder Hermes welche weitergeführt wird. Diese Entscheidung wird im Entscheidungsprotokoll gespeichert.

---

## 11. LERNPHASEN — STÜCK FÜR STÜCK ABGEBEN

### 11.1 Das Prinzip

Am Anfang übernimmt der GF viele Freigaben manuell. Mit jeder Entscheidung lernt Hermes. Nach genügend gleichartigen Durchläufen übernimmt Hermes autonom.

```
Phase 1 — Manuell (Aufbau)
   GF entscheidet jeden Checkpoint selbst
   Hermes beobachtet und dokumentiert alles
   Dauer: erste 10–20 Aufträge je Auftragstyp

Phase 2 — Assistiert (Einarbeitung)
   Hermes schlägt vor, GF bestätigt meist nur noch
   GF korrigiert Ausnahmen → Hermes lernt daraus
   Dauer: weitere 10–20 Aufträge

Phase 3 — Autonom (Vertrauen aufgebaut)
   Hermes entscheidet Standard-Checkpoints selbst
   GF sieht nur noch Endergebnis zur Freigabe
   Ausnahmen und Sonderfälle → immer noch GF

Phase 4 — Optimiert (Reifes System)
   Hermes schlägt Workflow-Verbesserungen vor
   System wird kontinuierlich smarter
   GF steuert nur noch auf strategischer Ebene
```

### 11.2 Entscheidungsprotokoll

Jede GF-Entscheidung wird gespeichert:

```
Auftragstyp:     Content-Kampagne B2B
Schritt 3:       4 Varianten geliefert
GF-Wahl:         Variante 4
Begründung:      Direkter Ton, kürzer, klarer CTA
Konfidenz:       Nach 8 gleichen Fällen → Hermes entscheidet autonom
```

**Schwelle für Autonomie:** 20 gleichartige Aufträge mit konsistenten GF-Entscheidungen → Hermes übernimmt diesen Checkpoint autonom.

---

## 12. PHASE 0 — UNTERNEHMENS-ONBOARDING

### 12.1 Zweck

Bevor das System produktiv arbeitet, muss Hermes das Unternehmen kennenlernen. In Phase 0 stellt Hermes systematisch Fragen — der GF antwortet — und jede Antwort wird zur Wissensbasis.

**Analogie:** Wie ein neuer Mitarbeiter am ersten Tag, der alle wichtigen Fragen stellt.

### 12.2 Fragenkatalog (Hermes stellt diese Fragen)

**Produkte & Leistungen:**
- Was stellt ihr her / welche Leistungen bietet ihr an?
- Welche Varianten / Modelle gibt es?
- Was sind die meistverkauften Produkte?
- Gibt es Sonderanfertigungen? Wie läuft das ab?
- Welche Materialien / Lieferanten sind kritisch?

**Kunden:**
- Wer kauft bei euch? (B2B, B2C, Handel?)
- Wie läuft eine typische Bestellung ab?
- Was sind häufige Kundenanfragen?
- Gibt es Stammkunden mit Sonderkonditionen?

**Qualität & Standards:**
- Was ist ein gutes Ergebnis für euch?
- Was geht gar nicht (No-Gos)?
- Welche Fehler wurden in der Vergangenheit gemacht?
- Welche Normen / Zertifizierungen müssen eingehalten werden?

**Kommunikation & Ton:**
- Wie kommuniziert ihr mit Kunden? (formal, locker, persönlich?)
- Gibt es Vorlagen für Angebote, Rechnungen, E-Mails?
- Wie heißt ihr Kunden an?
- Was darf nie in der Außenkommunikation stehen?

**Prozesse & Abläufe:**
- Wie läuft ein Auftrag von Eingang bis Lieferung ab?
- Wer ist intern für was zuständig?
- Welche Schritte dauern am längsten?
- Wo entstehen die meisten Fehler?

### 12.3 Ergebnis der Phase 0

Alle Antworten werden als strukturierte Dokumente in **05_UNTERNEHMEN/07_Onboarding/** gespeichert und bilden die **DNA des Unternehmens** — die Grundlage für alle Agenten.

---

## 13. DESKTOP-OBERFLÄCHE (GUI_v2.0)

### 13.1 Position und Zweck

Die Desktop-Oberfläche ist die **EINZIGE** Schnittstelle zwischen GF und dem KI-System. Kein direkter Ordnerzugriff. Kein direkter Agenten-Kontakt. Alles läuft über die GUI.

**Technische Basis:** Lokale Web-App (HTML/CSS/JS) oder Desktop-App (Electron/Tauri). Läuft ausschließlich lokal, keine Cloud-Anbindung.

### 13.2 Fünf Module

```
┌─────────────────────────────────────────────────────────────────┐
│  KI-UNTERNEHMEN                          [GF: Name]  [🔒]      │
├──────────┬──────────┬──────────┬──────────┬────────────────────┤
│  INBOX   │ AUFTRÄGE │FREIGABEN │ AGENTEN  │    PROTOKOLL       │
└──────────┴──────────┴──────────┴──────────┴────────────────────┘
```

### 13.3 Modul INBOX

```
Neu eingegangen — wartet auf Einschätzung
──────────────────────────────────────────────────────
📥 Bestellung      KD-1042    19.06.2026    [Öffnen]
📥 Beschwerde      KD-1089    19.06.2026    [Öffnen]
📥 Presseanfrage   Unbekannt  19.06.2026    [Öffnen]

Heute: 3 neu  |  Woche: 12  |  Offen: 5
```

### 13.4 Modul AUFTRÄGE

```
Status-Übersicht aller aktiven Aufträge
──────────────────────────────────────────────────────────────────
ID               Art          Status           Agent    Datum
AUF_001_2026     Bestellung   🔄 In Bearbeitung H-02    19.06.
AUF_002_2026     Angebot      ⏳ Wartend        02M-04  19.06.
AUF_003_2026     Rechnung     ✅ Erledigt       08F-02  19.06.
AUF_004_2026     Kampagne     🔄 Schritt 3/5    02M-02  19.06.

Gesamt: 24  |  Laufend: 8  |  Erledigt: 14  |  Wartend: 2
```

### 13.5 Modul FREIGABEN

```
Hier entscheidet der GF — nichts geht ohne ihn weiter
──────────────────────────────────────────────────────────────────
⚠️  AUF_001  Angebot Bürostühle 40 Stück
    Hermes: "Variante 2 empfohlen — Preis 8.400 EUR"
    [Vorschau]  [✅ Freigeben]  [✏️ Überarbeiten]  [⛔ Stopp]

⚠️  AUF_004  Kampagne Q3 — Schritt 3 abgeschlossen
    Content-Agent: "4 Varianten bereit, Variante 4 empfohlen"
    [Vorschau]  [✅ Freigeben]  [✏️ Überarbeiten]  [⛔ Stopp]

Offen: 2 Freigaben
```

### 13.6 Modul AGENTEN

```
Systemstatus — alle Agenten auf einen Blick
──────────────────────────────────────────────────────────────────
Hermes (H-00)       🟢 Aktiv    3 Aufträge koordiniert
H-01 Annahme        🟢 Aktiv    1 in Quarantäne
H-04 QK             🟡 Prüfend  wartet auf Output
02M-02 Content      🟢 Aktiv    Schritt 3/5
08F-02 Invoicing    🟡 Wartend  wartet auf DRI
03V-01 LeadGen      ⚫ Inaktiv  kein Auftrag
13P-00 Personal     🟢 Aktiv    1 Verfahren laufend
Master-Agent        🟢 Aktiv
Backup-Agent        🟢 Bereit

Aktiv: 19/24  |  Warnungen: 0  |  Fehler: 0
```

### 13.7 Modul PROTOKOLL

```
Alle Tätigkeiten im System — lückenlos, unveränderlich
──────────────────────────────────────────────────────────────────
19.06  14:52  Hermes      Workflow erstellt für AUF_001
19.06  14:48  02M-02      Schritt 3: 4 Varianten geliefert
19.06  14:45  GF          Freigabe: AUF_002 Variante 2
19.06  14:12  08F-02      DRI-Anfrage KD-1101 abgelehnt
19.06  09:15  H-01        Quarantäne: Presseanfrage freigegeben
19.06  06:00  11SC-04     Hash-Validierung: ALLE OK

[Filter: Heute ▼]  [Agent ▼]  [Auftragstyp ▼]  [Suche...]
```

### 13.8 GUI-Sicherheit

- **Login:** Nur GF — kein weiterer Benutzer
- **Authentifizierung:** Hardware-Token (YubiKey) + PIN
- **Session-Timeout:** 15 Minuten Inaktivität
- **IP-Bindung:** Nur von definierter Workstation erreichbar
- **Keine Löschfunktion** für Audit-Trail oder abgeschlossene Aufträge
- **Read-Only** außer Auftragseingabe und Freigabe-Buttons

---

## 14. SUPER-AGENT (A00)

**Position:** Virtuelle Beobachtungsebene über allen Abteilungen.

**Aufgaben:**
- Überwacht das gesamte System in Echtzeit
- Bereitet alle strategischen Entscheidungen mit Empfehlung vor
- Lernt aus jeder GF-Entscheidung
- Erkennt wiederkehrende Muster → schlägt Verbesserungen vor
- Optimiert das System langfristig

**Abgrenzung zu Hermes:**

| | Super-Agent | Hermes |
|---|---|---|
| Ebene | Strategisch | Operativ |
| Fokus | Beobachten & lernen | Koordinieren & ausführen |
| Lerninhalt | GF-Entscheidungsmuster | Workflow-Muster je Auftragstyp |
| Schreibzugriff | Nur eigener Ordner | Kann IT-IDs in Abteilungen schreiben |

### Super-Agent Guardrails (S1–S5)

- **S1:** Keine eigenständige Entscheidungsbefugnis. Ausnahme: Systemnotfall (Master + Backup ausgefallen) → vorläufige Maßnahme + sofort GF-Alarm
- **S2:** Datenzugriff nur aggregiert. Kein K3/K4-Einzelzugriff
- **S3:** Keine Modifikation fremder Daten. Ausgaben nur in A00_SuperAgent oder Dashboard
- **S4:** Lernprotokoll-Pflicht. Jede gelernte Entscheidung protokolliert in K4_SuperAgent
- **S5:** Jederzeit durch GF deaktivierbar via GUI

---
## 15. ABTEILUNGSSTRUKTUR — ALLE ABTEILUNGEN

### 15.1 Interne Struktur jeder Abteilung

```
📁 [Abteilung]
│
├── 📄 README.md
├── 📁 01_Input
│   ├── IT_TT_MM_JJJJ_Nr.md      ← Aktuelle Eingänge
│   └── 📁 Archiv
│
├── 📁 02_Grundlagen
│   ├── regeln_v1.md
│   ├── stellenbeschreibung_v1.md
│   ├── wissensbasis_v1.md
│   ├── guardrails_v1.md
│   └── entscheidungsprinzipien_v1.md
│
├── 📁 03_Prozesse
│   └── Prozess_Fehler_v1.md     ← Pflicht in jeder Abteilung
│
└── 📁 04_Output
    ├── OT_TT_MM_JJJJ_Nr.md     ← Aktuelle Ausgänge
    └── 📁 Archiv
```

> **Hinweis v16.0:** Eine Erweiterung dieses Standard-Schemas um zusätzliche
> Grundlagen-Dateien (z.B. `aufgaben_v1.md`, `skills_v1.md`, `erfahrungen_v1.md`)
> wurde diskutiert, aber noch nicht final entschieden. Bis zur Klärung gilt
> für alle Abteilungen — einschließlich A13_Personal — weiterhin der
> obenstehende Standard-Satz aus fünf Dateien.

### 15.2 Abteilungs-Übersicht

| Ordner | Kürzel | Abteilung |
|--------|--------|-----------|
| A00_SuperAgent | 00SA | Super-Agent |
| A01_Planung_BackOffice | H | Hermes — Planung & BackOffice |
| A02_Marketing | 02M | Marketing (17 Sub-Agenten) |
| A03_Vertrieb | 03V | Vertrieb (6 Sub-Agenten) |
| A04_PM | 04PM | Projektmanagement |
| A05_QM | 05QM | Qualitätsmanagement |
| A06_Verwaltung | 06VW | Verwaltung |
| A07_Recht | 07R | Recht |
| A08_Finanzen | 08F | Finanzen (inkl. DRI-Gatekeeper) |
| A09_Dokumentation | 09D | Dokumentation |
| A10_KI-Center | 10KI | KI-Center |
| A11_Systemcontrolling | 11SC | Systemcontrolling (5 Sub-Agenten) |
| A12_Zukunftsforschung | 12ZF | Zukunftsforschung |
| A13_Personal | 13P | Personal — Agenten-Lebenszyklus (NEU v16.0) |

---

## 15a. A13_PERSONAL — AGENTEN-LEBENSZYKLUS (NEU v16.0)

### 15a.1 Position und Zweck

A13_Personal ist die eigenständige Fachabteilung für den gesamten Lebenszyklus
aller KI-Agenten im Unternehmen — von der Einstellung bis zur Kündigung.

**Warum eine eigene Abteilung statt Verteilung auf mehrere Stellen:**
Eine zentrale Stelle sorgt für klare Zuständigkeit. Wer etwas über einen
Agenten wissen will — wann wurde er eingestellt, wie entwickelt er sich,
gab es Probleme — findet alles an einem Ort. Das schafft auch eine saubere
Schnittstelle für die spätere Anbindung der realen (menschlichen) Personalabteilung.

**Kürzel:** `13P`

**Abgrenzung zu Nachbarabteilungen:**

| Abteilung | Zuständigkeit | Abgrenzung zu A13_Personal |
|-----------|---------------|----------------------------|
| A05_QM | Fachliche Fehlerbewertung, Qualitätsstandards | A05_QM bewertet WAS falsch lief, A13 begleitet den Agenten dabei |
| A10_KI-Center | Technische Umsetzung, KI-Training | A10 baut/trainiert den Agenten, A13 verwaltet ihn als "Mitarbeiter" |
| Hermes (A01) | Operative Koordination, Workflows | Hermes gibt Aufträge, A13 ist nicht in den operativen Ablauf eingebunden |
| A06_Verwaltung | Allgemeine Verwaltungsaufgaben | A06 bleibt für Sachverwaltung zuständig, Personalführung liegt vollständig bei A13 |

---

### 15a.2 Interne Struktur

```
📁 A13_Personal
│
├── 📄 README.md
│
├── 📁 01_Input                         ← Standard (wie jede Abteilung)
│   └── 📁 Archiv
│
├── 📁 02_Grundlagen                     ← Standard (wie jede Abteilung)
│   ├── regeln_v1.md
│   ├── stellenbeschreibung_v1.md
│   ├── wissensbasis_v1.md
│   ├── guardrails_v1.md
│   └── entscheidungsprinzipien_v1.md
│
├── 📁 03_Prozesse                       ← Standard (wie jede Abteilung)
│   └── Prozess_Fehler_v1.md
│
├── 📁 04_Output                         ← Standard (wie jede Abteilung)
│   └── 📁 Archiv
│
├── 📁 05_Personalakten                  ← Eine Akte pro Agent, dauerhaft
│   ├── 📁 02M-01_Strategie/
│   ├── 📁 02M-04_Social_Media/
│   ├── 📁 03V-02_.../
│   └── 📁 ... (eine Unterordner je Agent, Kürzel-basiert)
│
├── 📁 06_Stellenprofile                 ← Was ein Agent können muss
│   ├── 📁 Aktiv/
│   └── 📁 Archiv/                       ← alte Profilversionen
│
├── 📁 07_Onboarding                     ← Einarbeitung neuer Agenten
│   ├── 📁 Laufend/
│   └── 📁 Abgeschlossen/
│
├── 📁 08_Entwicklung_Bewertung          ← Laufende Leistungsbeurteilung
│   ├── 📁 Quartalsbewertungen/
│   └── 📁 Entwicklungsplaene/
│
└── 📁 09_Verfahren                      ← Mahnungen, Kündigung
    ├── 📁 Laufend/
    └── 📁 Archiv/
```

---

### 15a.3 Der volle Lebenszyklus eines Agenten

```
1. STELLENPROFIL          A13 + Fachabteilung definieren Anforderung
        ↓
2. EINSTELLUNG (Onboarding)   A13 begleitet Einrichtung + Einarbeitung
        ↓
3. PROBEZEIT               Engmaschige Beobachtung, erste Bewertung
        ↓
4. AKTIVER BETRIEB          Reguläre Quartalsbewertungen, Entwicklung
        ↓
   ┌─── läuft gut ──────────────────┐    ┌─── Auffälligkeiten ──────────┐
   │  Weiterentwicklung,            │    │  Verfahren (siehe 15a.7)      │
   │  ggf. neue Verantwortung       │    │  Mahnung → Gespräch →         │
   └─────────────────────────────────┘    │  Kündigung                    │
                                            └────────────────────────────────┘
        ↓
5. KÜNDIGUNG / DEAKTIVIERUNG    Geordneter Rückbau, Archivierung der Akte
```

---

### 15a.4 Phase 1 — Stellenprofil

Bevor ein neuer Agent eingerichtet wird, erstellt A13_Personal gemeinsam mit
der anfragenden Fachabteilung ein Stellenprofil.

**Inhalt eines Stellenprofils** (`06_Stellenprofile/[Kürzel]_Stellenprofil_v1.md`):

| Feld | Beschreibung |
|------|--------------|
| Bezeichnung | z. B. "Social Media Agent" |
| Vorgesehenes Kürzel | z. B. 02M-04 |
| Zugehörige Abteilung | z. B. A02_Marketing |
| Aufgabenbereich | konkrete, abgrenzbare Tätigkeiten |
| Erforderliche Fähigkeiten | Tools, Wissen, Schnittstellen |
| Entscheidungsbefugnis | was darf er allein, was braucht Freigabe |
| Erfolgskriterien | woran wird "gute Arbeit" gemessen |

**Freigabe:** Stellenprofile werden vom GF freigegeben, bevor A10_KI-Center
mit der technischen Einrichtung beginnt.

---

### 15a.5 Phase 2 — Onboarding (Einstellung)

Sobald A10_KI-Center den Agenten technisch eingerichtet hat, übernimmt
A13_Personal die Einarbeitung.

```
A10_KI-Center: technische Einrichtung abgeschlossen
   ↓
A13_Personal eröffnet Onboarding-Akte (07_Onboarding/Laufend/)
   ↓
Agent erhält Zugriff auf eigene 02_Grundlagen (regeln, wissensbasis, etc.)
   ↓
Testaufträge (von Hermes bereitgestellt, niedriges Risiko)
   ↓
A13_Personal + A05_QM bewerten Testaufträge
   ↓
Onboarding abgeschlossen → Verschiebung nach 07_Onboarding/Abgeschlossen/
   ↓
Agent wechselt in Probezeit (15a.6)
```

**Onboarding-Dauer:** Richtwert 14 Tage oder 10 abgeschlossene Testaufträge,
je nachdem was zuerst eintritt.

---

### 15a.6 Phase 3 — Probezeit

Nach dem Onboarding folgt eine Probezeit von **30 Tagen** im aktiven Betrieb,
mit engmaschigerer Beobachtung als im Normalbetrieb.

| Unterschied zum Normalbetrieb | Probezeit | Normalbetrieb |
|-------------------------------|-----------|----------------|
| Checkpoint-Frequenz | jeder Auftrag | risikobasiert (Kap. 10) |
| Bewertungsrhythmus | wöchentlich | quartalsweise |
| Eskalationsschwelle bei Fehlern | niedriger | Standard (Kap. 23) |

**Ende der Probezeit:** A13_Personal erstellt eine Abschlussbewertung,
A05_QM gibt fachliche Einschätzung dazu. GF bestätigt Übernahme in den
Normalbetrieb oder verlängert die Probezeit einmalig um 30 Tage.

---

### 15a.7 Phase 4 — Aktiver Betrieb: Entwicklung & Bewertung

**Quartalsbewertung** (`08_Entwicklung_Bewertung/Quartalsbewertungen/`):

Jeder Agent wird vierteljährlich bewertet — unabhängig davon, ob es
Auffälligkeiten gab. Das ist die Regel, nicht die Ausnahme.

| Kriterium | Bewertet durch |
|-----------|-----------------|
| Fachliche Qualität der Outputs | A05_QM |
| SLA-Einhaltung | 11SC-01 Monitoring |
| Regelkonformität (RBAC, Guardrails) | 11SC-02 Audit & Compliance |
| Zusammenarbeit mit anderen Agenten | Hermes (H-00) |

A13_Personal fasst die Einschätzungen zusammen, hält sie in der
Personalakte fest und erstellt bei Bedarf einen Entwicklungsplan
(`08_Entwicklung_Bewertung/Entwicklungsplaene/`) — z. B. zusätzliche
Trainingsaufträge über A10_KI-Center, oder Erweiterung der Zuständigkeit.

**Gute Bewertung über mehrere Quartale:** Kann Grundlage für höhere
Autonomiestufe sein (siehe Lernphasen, Kap. 11) — A13_Personal dokumentiert
dies, Hermes setzt die Phase technisch um.

---

### 15a.8 Phase 5 — Verfahren bei Auffälligkeiten

**Auslöser:**

| Auslöser | Gemeldet durch |
|----------|-----------------|
| Wiederholte Fehlerquote über Schwellenwert (Kap. 23) | A05_QM |
| RBAC-Verstoß (Anomalie A6) | 11SC-02 |
| Fachgebietsverstoß (Anomalie A1) | 11SC-01 |
| Negative Rückmeldung aus Fachabteilung, wiederholt | Betroffene Abteilung |
| Checkpoint-Überschreitungen, wiederholt | H-03 Projektmanagement |
| Agent dauerhaft ohne Auftrag / überflüssig | Hermes oder GF |

**Ablauf** (`09_Verfahren/Laufend/`):

```
STUFE 1 — Auffälligkeit dokumentiert
   A13_Personal eröffnet Verfahrensakte: 13P-Verfahren_[Kürzel]_[Datum].md
   ↓
STUFE 2 — Erste Mahnung
   Konkreter Vorfall + betroffene Regel + erwartete Korrektur
   Besserungsfrist: 14 Tage
   ↓
   Besserung erkennbar? → JA → Beobachtung 30 Tage → Abschluss, Akte bleibt als Historie
                         → NEIN → weiter
   ↓
STUFE 3 — Zweite Mahnung + Klärungsgespräch
   Agent gibt strukturierte Selbstauskunft (Ursache, Kontext, Verbesserungsvorschlag)
   A05_QM liefert fachliche Einschätzung dazu
   Besserungsfrist: 14 Tage
   ↓
   Besserung erkennbar? → JA → Beobachtung 30 Tage → Abschluss
                         → NEIN → weiter
   ↓
STUFE 4 — Empfehlung zur Kündigung
   A13_Personal fasst Verfahren zusammen → Empfehlung an GF
   ↓
STUFE 5 — Kündigung / Deaktivierung
   Nur mit GF-Freigabe (siehe 15a.9)
```

**Weg B — Überflüssiger Agent (kein Mahnverfahren):**
Wenn ein Agent nicht fehlerhaft, sondern schlicht nicht mehr gebraucht wird
(z. B. Aufgabenbereich entfällt), überspringt A13_Personal die Mahnstufen.
Hermes oder GF dokumentieren den Grund, A13_Personal bestätigt den Wegfall
des Bedarfs, GF gibt die Kündigung direkt frei.

**Sonderfall — fristlose Deaktivierung:**
Bei schweren Sicherheitsvorfällen (Anomalie A5/A6 Level HIGH, vorsätzlicher
Verstoß, Datenschutzverletzung) kann der GF das Stufenverfahren überspringen.
Die Begründung wird vollständig im Audit-Trail dokumentiert.

---

### 15a.9 Phase 6 — Kündigung / Deaktivierung

```
GF-Freigabe liegt vor
   ↓
A13_Personal schließt Verfahrensakte mit Enddatum + Begründung
   ↓
Agent wird auf inaktiv gesetzt (GUI-Modul AGENTEN: Status ⚫ Deaktiviert)
   ↓
Laufende Aufträge → H-03 verteilt sie an andere Agenten um
   ↓
Personalakte (gesamte Historie) wird archiviert nach:
A13_Personal/05_Personalakten/[Kürzel]/ → Status: Archiviert (bleibt dauerhaft erhalten)
   ↓
Ordnerstruktur des Agenten wird verschoben nach:
02_KI-UNTERNEHMEN/A09_Dokumentation/Archiv/Deaktivierte_Agenten/[Kürzel]_[Datum]/
   ↓
Audit-Trail-Eintrag: AUD_..._13P, Aktion: Kündigung, mit Verweis auf Verfahrensakte
   ↓
11SC-02 bestätigt vollständigen Rückbau (keine offenen Zugriffsrechte mehr)
```

---

### 15a.10 Reaktivierung

Ein deaktivierter Agent kann nur reaktiviert werden, wenn:

1. GF-Freigabe vorliegt, **und**
2. bei vorherigem Mahnverfahren: A05_QM bestätigt die ursprüngliche
   Fehlerursache als behoben, **und**
3. bei vorherigem Wegfall des Bedarfs: ein neuer, dokumentierter Bedarf besteht.

Die Personalakte wird wiedereröffnet (nicht neu angelegt) — die komplette
Historie bleibt sichtbar. Der Agent durchläuft erneut eine verkürzte
Probezeit von 14 Tagen.

---

### 15a.11 Personalakte — Pflichtinhalt

Jede Personalakte (`05_Personalakten/[Kürzel]/akte.md`) ist ein
durchgehendes, chronologisches Dokument über die gesamte Lebensdauer
des Agenten:

| Abschnitt | Inhalt |
|-----------|--------|
| Stammdaten | Kürzel, Abteilung, Stellenprofil-Version, Einstellungsdatum |
| Onboarding | Verlauf, Testaufträge, Abschlussdatum |
| Probezeit | Verlauf, Abschlussbewertung |
| Quartalsbewertungen | chronologische Liste aller Bewertungen |
| Entwicklungspläne | falls vorhanden, mit Ergebnis |
| Verfahren | falls vorhanden, vollständiger Stufenverlauf (siehe 15a.8) |
| Status | aktiv / Probezeit / in Verfahren / deaktiviert / archiviert |

**Unveränderlichkeit:** Wie alle Audit-relevanten Dokumente wird die Akte
nicht nachträglich verändert, nur durch neue, datierte Einträge ergänzt
(siehe Unveränderlichkeits-Protokoll, Kap. 17).

---

### 15a.12 Zugriffsrechte (RBAC-Ergänzung)

| Rolle | Berechtigung auf A13_Personal |
|-------|-------------------------------|
| A13_Personal (eigene Agenten) | Schreiben in eigene Bereiche (05–09) |
| GF | Lesen + Freigaben erteilen (über GUI) |
| A05_QM | Lesen + Schreiben in Bewertungsabschnitte (fachlicher Teil) |
| 11SC-02 Audit & Compliance | Lesen (für Audit-Zwecke) |
| Hermes (H-00) | Lesen (für Workflow-Planung, keine Akten-Details) |
| Andere Fachabteilungen | Kein Zugriff auf fremde Personalakten |
| Betroffener Agent selbst | Lesezugriff auf eigene Akte |

---

### 15a.13 Schnittstelle für spätere menschliche Personalabteilung

A13_Personal ist bewusst so aufgebaut, dass eine reale (menschliche)
Personalabteilung später andocken kann, ohne die Struktur umzubauen:

- Die Ordnerlogik (Stellenprofile, Onboarding, Bewertung, Verfahren)
  ist unternehmensüblich und überträgt sich direkt auf menschliche Mitarbeiter.
- Aktuell ausschließlich für Agenten vorgesehen — kein Mensch-Ordner existiert.
- Eine spätere Erweiterung würde einen parallelen Bereich
  `10_Personalakten_Mitarbeiter/` vorsehen, mit identischer Logik,
  aber getrennten Zugriffsrechten (Datenschutz, siehe Kap. 5 Tresor).
- Diese Erweiterung ist **nicht Teil von v16.0** und wird erst bei Bedarf umgesetzt.

---
## 16. ROLLEN- UND BERECHTIGUNGSMATRIX (RBAC)

| Aktion | GF | GUI-System | Hermes | 08F-02 | 13P | Alle anderen | Super-Agent |
|--------|----|----|--------|--------|-----|--------|------|
| Lesen (eigener Bereich) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ aggregiert |
| Lesen (fremder Bereich) | ✅ | ✅ | ✅ | ❌ | ⚠️ nur Akten-Metadaten | ❌ | ✅ aggregiert |
| Schreiben (eigener Bereich) | ✅ | ❌ | ✅ | ✅ Output | ✅ | ✅ Output | ❌ |
| IT-IDs in Abteilungen schreiben | ✅ | ❌ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Datenschutz-Tresor (K4) | ✅ | ❌ | ❌ | ⚠️ nur DRI | ❌ | ❌ | ❌ |
| DRI-Anfrage stellen | ❌ | ❌ | ❌ | ✅ exklusiv | ❌ | ❌ | ❌ |
| Systemänderungen | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |
| Auftrag erstellen (GUI) | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |
| Snapshot erstellen | ❌ | ✅ auto | ❌ | ❌ | ❌ | ❌ | ❌ |
| Workflow erstellen | ✅ | ❌ | ✅ | ❌ | ❌ | ❌ | ❌ |
| Agenten-Verfahren eröffnen | ❌ | ❌ | ❌ | ❌ | ✅ exklusiv | ❌ | ❌ |
| Agenten deaktivieren (final) | ✅ exklusiv | ❌ | ❌ | ❌ | ⚠️ nur Empfehlung | ❌ | ❌ |

---

## 17. UNVERÄNDERLICHKEITS-PROTOKOLL (AUDIT-TRAIL)

### 17.1 Grundprinzip

Jede Tätigkeit wird mit Pflichtfeldern dokumentiert:

- **ID:** AUD_YYYYMMDD_NNNN_AgentKürzel
- **Datum & Uhrzeit:** TT.MM.JJJJ / HH:MM:SS
- **Grundlage:** SOP-Referenz, GF-Freigabe oder autorisierte Anweisung
- **Handelnde Instanz:** Agenten-Kürzel oder GF
- **Aktion:** Erstellen / Lesen / Ändern / Löschen / DRI-Abfrage / Freigabe
- **Objekt:** Betroffene Datei / ID / Prozess
- **Ergebnis:** Erfolg / Fehler / Abbruch mit Begründung

### 17.2 Absolutes Verbot

Einmal erstellte Einträge dürfen von **niemandem** geändert oder gelöscht werden — auch nicht vom GF. Korrekturen erfolgen ausschließlich durch **neuen Eintrag** mit Verweis auf den fehlerhaften.

Dies gilt ausdrücklich auch für Personalakten und Verfahrensakten von A13_Personal (siehe 15a.11).

### 17.3 Automatische Protokollierung

Folgendes wird **immer automatisch** protokolliert:
- Jede DRI-Anfrage (erfolgreich oder abgelehnt)
- Jeder Checkpoint (Freigabe, Korrektur, Stopp)
- Jede GF-Entscheidung in der GUI
- Jeder Failover-Versuch
- Jeder Super-Agent-Vorschlag mit GF-Antwort
- Jede Quarantäne-Entscheidung durch H-01 (alle drei Filterstufen)
- Jede Workflow-Erstellung durch Hermes
- Jede Archivierung
- Jede Stufe eines A13_Personal-Verfahrens (Mahnung, Gespräch, Empfehlung, Kündigung)

### 17.4 Manipulationserkennung

11SC-04 führt täglich um 06:00 Uhr eine Hash-Validierung aller Einträge durch (SHA-256). Abweichung = Sofortalarm an GF + A00_SuperAgent.

---

## 18. ANOMALIE-ERKENNUNG (A1–A6)

| Code | Typ | Beschreibung | Level |
|------|-----|--------------|-------|
| A1 | Fachgebietsverstoß | Agent greift auf fremden Bereich zu | 🔴 HIGH |
| A2 | Zeitverstoß | Aktivität außerhalb Betriebszeiten | 🟠 MEDIUM |
| A3 | Doppelte DRI-Anfrage | Gleiche Kunden-ID 2x in 60 Min. | 🟠 MEDIUM |
| A4 | Fehlende Grundlage | Kein Grundlage-Feld im Audit-Eintrag | 🟡 LOW |
| A5 | Super-Agent-Deaktivierung | Ohne GF-Protokoll-Eintrag | 🔴 HIGH |
| A6 | RBAC-Verstoß | Agent führt nicht erlaubte Aktion aus | 🔴 HIGH |

**Level-Reaktionen:**
- 🟡 LOW → Protokollierung, täglicher Bericht
- 🟠 MEDIUM → Sofortalarm an GF + Super-Agent
- 🔴 HIGH → Sofortalarm + Systemstopp bis GF-Freigabe

---

## 19. BACKUP- UND FAILOVER-ARCHITEKTUR

### 19.1 Master / Backup

- **Aktiv/Passiv:** Master und Backup arbeiten niemals gleichzeitig (Split-Brain-Schutz via Lock-Token)
- **Heartbeat:** 60-Sekunden-Intervall. 3 Zyklen ohne Signal → Failover (max. 5 Min. SLA)
- **Failover-Koordination:** 11SC-03_FailoverManagement übernimmt Lock-Token-Übergabe

### 19.2 Backup-Typen

| Typ | Intervall | Zweck |
|-----|-----------|-------|
| Ereignis-Backup | Bei jeder Archivierung | Sofortsicherung |
| Stunden-Backup | Jede Stunde | Backup-Agent-Spiegelung |
| Tages-Backup | 23:59:59 | Vollständiger Snapshot |
| Wochen-Backup | Sonntag | Langzeitsicherung |

---

## 20. SYSTEMCONTROLLING — A11

| Kürzel | Rolle | Aufgabe |
|--------|-------|---------|
| 11SC-00 | Assistent | Koordination Systemcontrolling |
| 11SC-01 | Monitoring | Echtzeit-Monitoring & Alarme |
| 11SC-02 | Audit & Compliance | Compliance-Prüfung |
| 11SC-03 | Failover-Management | Backup-Agent-Steuerung, Lock-Token |
| 11SC-04 | Sicherheitsaudit | Hash-Validierung, DRI-Verstoß-Tracking |

---

## 21. NUMMERIERUNGS- UND VERSIONSSYSTEM

### 21.1 ID-Formate

| Typ | Format | Beispiel |
|-----|--------|---------|
| Input-Tracking | IT_TT_MM_JJJJ_Nr.md | IT_19_06_2026_042.md |
| Output-Tracking | OT_TT_MM_JJJJ_Nr.md | OT_19_06_2026_008.md |
| Auftrag | AUF_YYYYMMDD_NNN | AUF_20260619_001 |
| Audit-Eintrag | AUD_YYYYMMDD_NNNN_Kürzel | AUD_20260619_0042_H-00 |
| DRI-Freigabe | DRI_YYYYMMDD_NNNN | DRI_20260619_0012 |
| Snapshot | SS_YYYYMMDD_v16.0.zip | SS_20260619_v16.0.zip |
| Personalakte | [Agent-Kürzel]_Akte | 02M-04_Akte |
| Verfahrensakte | 13P-Verfahren_[Kürzel]_[Datum] | 13P-Verfahren_02M-04_19_06_2026 |

### 21.2 Versionsnummerierung

- **Minor** (v16.0 → v16.1): Korrekturen, Optimierungen, Klarstellungen
- **Major** (v16.x → v17.0): Strukturelle Änderungen, neue Abteilungen, neue Architektur

---

## 22. GUI-IMPLEMENTIERUNGSPFAD

| Phase | Inhalt | Dauer |
|-------|--------|-------|
| Phase 1 — Prototyp | Statische Mockups aller 5 Module, SQLite Demo | 1 Woche |
| Phase 2 — MVP | Lesender Zugriff auf Ordnerstruktur, echte Audit-Daten, Auftragsformular | 2 Wochen |
| Phase 3 — Vollversion | Anomalie-Erkennung, GF-Frage-Interface, Snapshots, Hash-Validierung | 4 Wochen |
| Phase 4 — Härtung | Hardware-Token, IP-Bindung, Session-Management, Penetration-Testing | 2 Wochen |

---

## 23. KOORDINATIONS-KPIs & SCHWELLENWERTE

| KPI | Schwellenwert | Automatische Reaktion |
|-----|--------------|----------------------|
| SLA-Einhaltung | < 90% | Stopp neuer Aufträge bis GF-Freigabe |
| Fehlerquote | > 5% | Stopp + QM-Analyse |
| Fehlerquote | > 10% | Super-Agent informiert GF direkt |
| Checkpoint-Überschreitung | > 48h ohne Freigabe | Hermes eskaliert an GF |
| Quarantäne-Rückstau | > 10 Einträge offen | GF-Alarm |
| Offene A13-Verfahren | > 3 gleichzeitig | A13 informiert GF zur Übersicht |
| Probezeit-Abschluss überfällig | > 35 Tage ohne Bewertung | A13-Alarm an GF |

---

*System-Version: v16.0 (2026-06-19) | GUI-Version: GUI_v2.0 | Erstellt: 19.06.2026*

*Das System steht stabil, datenschutzkonform und mit zentraler menschlicher Kontrolle für das lokale Obsidian-Netzwerk bereit.*
