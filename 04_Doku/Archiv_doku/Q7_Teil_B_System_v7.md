# Q7_Teil_B_System_v7.md — TEIL B: DETAIL
**Basis:** v23.6 (2026-06-30) | **Typ:** Vollständige Regelreferenz
**Überblick:** → Teil A | **Agenten & Ordnerstruktur:** → Teil C

**Änderungen seit v6 (Basis v23.5 → v23.6, 30.06.2026):**
B-01 Kap. 3 komplett neu geschrieben — A14 übernimmt Filter 1+2+PII in Quarantäne, A01 nur noch Filter 3 in 02_Eingang, SLA getrennt (A14: 15 Min, A01: 5 Min) · B-02 Kap. 6a aktualisiert — PII-Trennung in Quarantäne vorgezogen, BUG_007 Schritt 1 erledigt · B-03 Kap. 9 A01 als monolithisch dokumentiert (kein Subagenten-Schema aktiv) · B-04 Kap. 16 RBAC korrigiert — A14 auf 01_Quarantäne, A01 kein Quarantäne-Zugriff · B-05 P_016.8a Scope A/C Folienzahlen getauscht (A=12/6M, C=21/12M) · B-06 Kap. 30 BUG_007 Status aktualisiert · B-07 Kap. 31 P23-01 als erledigt markiert

**Änderungen seit v5 (Testlauf-Freigaben 28.06.2026):**
TL-03 Kap. 9 H-04b/A05a-Zuordnung klargestellt · TL-04 Kap. 29 7→9-Ordner-Fehler korrigiert · TL-05 P_016.0c (Vorab-Scope-Indikation) neu eingeführt · TL-06 P_016.2 Mehrstandort-Regel ergänzt

---

Dieses Dokument enthält die detaillierten Mechanismen, Prozessinhalte, Sub-Agenten und Regeln.

---

## KAP. 0 — INHALTSVERZEICHNIS

| Kap. | Titel | Status |
|------|-------|--------|
| 1 | Hierarchie-Regeln (Detail) | 🚧 In Planung |
| 2 | GF-Schnittstelle & GUI-Regeln | 🚧 In Planung |
| 3 | Ordner 01_INPUT: Sicherheitsschleuse | ✅ Vorhanden |
| 4 | Ordner 03_OUTPUT | ✅ Vorhanden |
| 5 | Ordner 04_TRESOR | ✅ Vorhanden |
| 6 | Ordner 05_UNTERNEHMEN | ✅ Vorhanden |
| 6a | A14_SICHERHEIT | ✅ Vorhanden |
| 7 | Ordner 06_WISSEN | ✅ Vorhanden |
| 8 | Ordner 04_Doku | 🚧 In Planung |
| 9 | A01 — Abteilung Planung & Vorbereitung | ✅ Vorhanden |
| 10 | Checkpoint-System | ✅ Vorhanden |
| 11 | Lernphasen | ✅ Vorhanden |
| 12 | Phase 0: Unternehmens-Onboarding | ✅ Vorhanden |
| 13 | A13 — Personal: Agenten-Lebenszyklus | 🚧 In Planung |
| 14 | Stab-Agent (A00) | ✅ Vorhanden |
| 15 | 4-Säulen-Individualdokumentation | 🚧 In Planung |
| 16 | RBAC — Rollen- und Berechtigungsmatrix | ✅ Vorhanden |
| 17 | Unveränderlichkeits-Protokoll (Audit-Trail) | ✅ Vorhanden |
| 18 | Anomalie-Erkennung (A1–A7) | ✅ Vorhanden |
| 19 | Backup & Failover | ✅ Vorhanden |
| 20 | Systemcontrolling (A11) | ✅ Vorhanden |
| 21 | Nummerierungs- und Versionssystem | ✅ Vorhanden |
| 22 | Eskalations- und Alarmierungskette | 🚧 In Planung |
| 23 | Koordinations-KPIs & Schwellenwerte | ✅ Vorhanden |
| 24 | Sonntagsregel | ✅ Vorhanden |
| 25 | Trennzeichen-Konventionen | ✅ Vorhanden |
| 26 | Kunden-Feedback & Bewertungssystem | ✅ Vorhanden |
| 27 | Prozess-Inhalte | ✅ Vorhanden |
| 27a | DNA-Analyse-Framework | ✅ Vorhanden |
| 28 | Q7-Unternehmenskultur | ✅ Vorhanden |
| 29 | Change-Management | ✅ Vorhanden |
| 30 | Bug-Tracking | ✅ Vorhanden |
| 31 | GF-Entscheidungs-Queue | ✅ Vorhanden |

---

## KAP. 3 — ORDNER 01_INPUT: SICHERHEITSSCHLEUSE

Alles von der Außenwelt landet zuerst hier. Kein Agent, kein Prozess, kein System
berührt einen eingehenden Input, bevor er die vollständige Sicherheitsschleuse durchlaufen hat.

Die Schleuse ist zweistufig und auf zwei Abteilungen aufgeteilt:
- **A14 (Sicherheit):** Filter 1 + Filter 2 + PII-Trennung — vollständig in `01_Quarantäne`
- **A01 (Hermes):** Filter 3 (Vollständigkeit) + IT-ID-Vergabe — in `02_Eingang`, nach A14-Freigabe

```
📁 01_INPUT
│
├── 📁 01_Quarantäne     ← PFLICHTSTATION — ALLES von außen landet hier
│   └── Zugriff EXKLUSIV: A14 + GF — kein anderer Agent, auch nicht A01
│
├── 📁 02_Eingang        ← Nach A14-Freigabe: A01 prüft Filter 3, vergibt IT-ID
│
├── 📁 03_In_Bearbeitung ← Aktive Aufträge, A01a (Hermes) hat Workflow erstellt
│
├── 📁 04_Wartend        ← Wartet auf: Kundenantwort (Rückfrage) / GF-Freigabe / externe Info
│
└── 📁 05_Archiv         ← Abgeschlossene Eingänge (IT-ID bleibt, verknüpft mit OT-ID)
```

---

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

**Grundregel:** Kein Inhalt verlässt die Quarantäne, bis A14 alle drei Prüfschritte
(Filter 1 + Filter 2 + PII-Trennung) abgeschlossen und den Freigabe-Vermerk gesetzt hat.
Kein anderer Agent darf `01_Quarantäne/` lesen oder schreiben — ausschließlich A14 und GF.

**SLA A14 (Filter 1+2+PII):** max. 15 Minuten | Überwachung: 11SC-01 Monitoring.
**SLA A01 (Filter 3):** max. 5 Minuten nach Zugriff auf `02_Eingang` | Überwachung: 11SC-01.

---

### 3.2 A14 — Filter 1, Filter 2 und PII-Trennung (in 01_Quarantäne)

A14 führt jeden eingehenden Input sequenziell durch drei Prüfschritte,
vollständig innerhalb `01_Quarantäne`. Alle drei müssen bestanden werden.
Scheitert ein Schritt → Input bleibt blockiert, kein Weitertransport.

---

#### Filter 1 — Technische Sicherheitsprüfung (A14)

**Ziel:** Viren, Trojaner, Malware und schadhafter Code werden erkannt
und blockiert, bevor sie das System erreichen.

```
Eingehender Input (in 01_Quarantäne)
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

**Bei Fund — Isolierung in 99_Gefaengnis (Root-Ebene):**

```
📁 99_Gefaengnis (Root — isoliert, kein Kontakt zum normalen Datenfluss)
├── 📁 Zelle_01      ← Isoliert — kein Kontakt zu anderen Zellen
├── 📁 Zelle_02      ← Isoliert — kein Kontakt zu anderen Zellen
└── 📁 Zelle_03      ← Isoliert — kein Kontakt zu anderen Zellen
```

```
Schadcode / Virus erkannt (in 01_Quarantäne)
   ↓
Input kommt in nächste freie Zelle in 99_Gefaengnis/ (Root-Ebene)
(jede Bedrohung erhält ihre eigene Zelle — kein Kontakt zwischen Zellen)
   ↓
GF-Alarm via GUI-Modul INBOX (Anomalie A6 — Level HIGH)
   ↓
11SC-04 Sicherheitsaudit übernimmt Analyse
   ↓
Audit-Trail-Eintrag: AUD_..._A14, Aktion: SICHERHEITSALARM
   ↓
Alle 3 Zellen belegt → zusätzlicher GF-Alarm: Kapazitätsgrenze erreicht
   ↓
GF entscheidet: löschen / weiter analysieren / Behörde informieren
```

**Verantwortlich für Regelpflege:** A10_KI-Center pflegt Whitelist und Scan-Regeln
im Auftrag von A14. Änderungen nur mit GF-Freigabe.

---

#### Filter 2 — Inhaltliche Legitimität (A14)

**Ziel:** Nur relevante, legitime Inhalte kommen ins System.
Spam, Werbung, Irrelevantes wird aussortiert.

```
Input hat Filter 1 bestanden (noch in 01_Quarantäne)
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

#### PII-Trennung (A14) — nach Filter 1 + 2

**Ziel:** Personenbezogene Daten werden noch in der Quarantäne erkannt,
extrahiert und in den Tresor überführt, bevor der bereinigte Input das System betritt.

```
Input hat Filter 1 + 2 bestanden (noch in 01_Quarantäne)
   ↓
A14 prüft auf personenbezogene Daten (PII)
   ↓
PII erkannt → extrahieren → 04_TRESOR/K4_Personen/KD_[Nr] (Write-Only)
              Im bereinigten Inhalt: Platzhalter [PII-Daten siehe TRESOR]
PII nicht erkannt → Vermerk "keine PII" im Audit-Trail
   ↓
A14 setzt Freigabe-Vermerk: AUD_[Datum]_[Datei-ID]_14S_FREIGABE
   ↓
Bereinigte Datei wird in 01_INPUT/02_Eingang verschoben
   ↓
ERST JETZT erhält A01 Zugriff auf 02_Eingang
```

Kein manuelles Warten — systemseitiger Gate-Mechanismus.
Kein Agent außer A14 kann diesen Gate-Eintrag setzen.

---

### 3.3 A01 — Filter 3: Vollständigkeit & Verarbeitbarkeit (in 02_Eingang)

**Zuständigkeit:** A01a (Hermes) — ausschließlich in `01_INPUT/02_Eingang`, nach A14-Freigabe.
**A01 hat zu keinem Zeitpunkt Zugriff auf `01_Quarantäne`.**

**Ziel:** Nur Inputs, die vollständig genug sind, um verarbeitet zu werden,
gelangen ins System. Unvollständige Inputs bekommen eine Rückfrage.

```
Input liegt in 02_Eingang (A14-Freigabe-Vermerk gesetzt)
   ↓
A01a: Sind die Mindestinformationen vorhanden?
(Kontaktweg + Anliegen = Minimum für jeden Input-Typ)
   ↓
NEIN → Rückfrage an Absender (siehe Abschnitt 3.4)
   ↓
JA  → Filter 3 bestanden → IT-ID vergeben → Workflow erstellen
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

### 3.4 Rückfrage-Prozess (Filter 3 nicht bestanden — A01-Zuständigkeit)

```
A01a erkennt fehlende Mindestinformation (in 02_Eingang)
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
Antwort eingegangen → Filter 3 erneut prüfen (in 02_Eingang)
Keine Antwort nach 48h → automatische Ablehnung + Protokollierung
```

**Dateiname der Rückfrage:**
`Rueckfrage_[Kanal]_[Datum]_[lfd.Nr.].md`
Beispiel: `Rueckfrage_Email_20260617_003.md`

**Speicherort:** `02_KI-UNTERNEHMEN/A01_Planung_Vorbereitung/`

---

### 3.5 Freigabe — Was passiert nach bestandenem Filter 3?

```
Filter 3 bestanden (in 02_Eingang)
   ↓
A01a vergibt IT-ID
Format: IT_TT_MM_JJJJ_Nr  (z.B. IT_19_06_2026_004)
   ↓
A01a erstellt Workflow → Verarbeitung beginnt
   ↓
Eintrag im Dashboard: "Neuer validierter Input" (GUI-Modul AUFTRÄGE)
   ↓
Audit-Trail: AUD_..._A01a, Aktion: Freigabe
```

---

### 3.6 Protokollierung — aufgeteilt nach Zuständigkeit

**A14-Entscheidungen** (Filter 1, Filter 2, PII) — automatisch im Audit-Trail:

| Entscheidung | Audit-Aktion | Weiterleitung |
|-------------|--------------|---------------|
| Freigegeben (alle Prüfungen) | 14S_FREIGABE | → 02_Eingang, A01a erhält Zugriff |
| Abgelehnt (Schadsoftware) | SICHERHEITSALARM | → 99_Gefaengnis + GF-Alarm + 11SC-04 |
| Abgelehnt (Spam) | Ablehnung + Grund | → 11SC-01 Statistik |
| GF-Alarm (Grenzfall) | GF-Vorlage | → 04_Wartend, GF entscheidet |
| PII extrahiert | PII-EXTRAKTION | → 04_TRESOR/K4_Personen/KD_[Nr] |

**A01-Entscheidungen** (Filter 3) — automatisch im Audit-Trail:

| Entscheidung | Audit-Aktion | Weiterleitung |
|-------------|--------------|---------------|
| Freigegeben | Freigabe + IT-ID | → 03_In_Bearbeitung, Workflow startet |
| Rückfrage | Rückfrage | → 04_Wartend, 48h-Frist |
| Abgelehnt (Timeout) | Timeout-Ablehnung | → 11SC-01 Statistik |

**Tagesbericht** — 11SC-01 erstellt täglich um 09:00 Uhr (zusammengefasst aus beiden Zuständigkeitsbereichen):
- A14-Bereich: Anzahl Freigaben, Sicherheitsalarme, Spam-Ablehnungen, PII-Extraktionen, Grenzfälle
- A01-Bereich: Anzahl freigegebener Inputs pro Kanal, Rückfragen (offen / beantwortet / abgelaufen), Timeout-Ablehnungen
- Gesamt: Durchschnittliche Durchlaufzeit A14 (Ziel: <15 Min.) + A01 (Ziel: <5 Min.)
- Quarantäne-Rückstau > 10 offen → automatischer GF-Alarm (Kap. 23)

**Mustererkennung:** Bei mehr als 5 Alarmen desselben Typs innerhalb von 7 Tagen:
- A14-Alarme (Filter 1/2/PII) → A14 meldet Muster direkt an Stab-Agent (A00) → A00 schlägt GF Gegenmaßnahme vor
- A01-Alarme (Filter 3 / Rückfragen) → A01a meldet Muster an Stab-Agent (A00) → A00 schlägt GF Gegenmaßnahme vor

---

## KAP. 4 — ORDNER 03_OUTPUT

```
📁 03_OUTPUT
├── 📁 01_In_Arbeit
├── 📁 02_Zur_Freigabe
├── 📁 03_Freigegeben
├── 📁 04_Abgelehnt
└── 📁 05_Archiv
```

---

## KAP. 5 — ORDNER 04_TRESOR

```
📁 04_TRESOR (Isoliert, verschlüsselt)
│
├── 📁 K4_Personen
│   └── (A14 hat Write-Only Zugriff auf KD_Neu/)
│
├── 📁 K4_Zahlungen
│   └── bankdaten.enc
│
├── 📁 K4_Zugangsdaten
│   └── api_keys.enc
│
└── zugriffsprotokoll_v1.md   ← Jeder TZ- und GF-Zugriff protokolliert
```

**Position:** Separater Bereich — physisch und logisch isoliert vom normalen System.

**Inhalt:** Ausschließlich sensible, personenbezogene Daten (PII, Bankdaten, Zugangsdaten).
Lernprotokolle und Systemdaten gehören NICHT in den Tresor → siehe A00_StabAgent Ordner.

### Verschlüsselung & Zugriffsarchitektur

- **Verschlüsselung:** AES-256 (at-rest)
- **Master-Key:** gehalten von A08a (TZ — Tresor-Zuständiger), Rotation alle 30 Tage
- **Notfall-Fallback:** A07a (Recht) hält dokumentierten Notfall-Key — nur für KRITISCH-markierte Zugriffe. Nachträgliche GF-Review jedes Notfall-Zugriffs verpflichtend.

### OTP-Zugriffsworkflow

```
Agent fordert TRESOR-Datei an (via GUI)
   ↓
A08a (TZ) prüft Berechtigung (RBAC)
   ↓
Berechtigt → A08a generiert One-Time-Key (OTP), gültig 1h
   ↓
Agent entschlüsselt Datei mit OTP — OTP verfällt danach automatisch
   ↓
Zugriff wird geloggt: [Zeitstempel] [Agent] [Datei] [OTP-ID] in 04_Doku
```

Jede nicht-autorisierte Anfrage wird abgelehnt und an 11SC-04 gemeldet.

### Dynamic Request Interface (DRI)

- Kein Agent hat direkten Zugriff auf den Tresor
- Zugriff nur über DRI: punktuelle, validierte Einzelanfrage pro Vorgang
- Exklusiv autorisiert: **08F-02_Invoicing** (nur für Rechnungsstellung)
- K4-Daten werden nur im RAM zusammengeführt → direkte PDF-Generierung → Cache sofort überschrieben

---

## KAP. 6 — ORDNER 05_UNTERNEHMEN

```
📁 05_UNTERNEHMEN
├── 📁 01_Produkte
├── 📁 02_Prozesse
├── 📁 03_Vertraege
├── 📁 04_Finanzen
├── 📁 05_Qualitaet
├── 📁 06_Vorlagen          ← DNA-Vorlagen (dna-analyse, dna-auswertung-intern,
│                              dna-endergebnis, MATRIX1, istunternehmen_DNA_Master-Checkliste)
│                              KD_VORLAGE/ ← Vorlage für neuen Kundenpfad (flach, keine Unterordner)
├── 📁 08_Q7_Kultur
│   ├── q7_werte_v1.md
│   ├── q7_kommunikation_v1.md
│   ├── q7_entscheidungsmaximen_v1.md
│   ├── q7_code_of_conduct_agenten_v1.md
│   └── q7_geschaeftsprinzipien_v1.md
└── 📁 09_Kunden
    └── 📁 KD_[Nr]_[Name]/   ← Alle Dateien direkt hier, keine Unterordner
                                (A06 kopiert KD_VORLAGE/ bei jedem neuen Kunden)
```

**Trennlinie 04_TRESOR vs. 09_Kunden:**
- `04_TRESOR/K4_Personen/KD_[Nr]/` → Kontaktdaten, Zugangsdaten (verschlüsselt, nur DRI)
- `05_UNTERNEHMEN/09_Kunden/KD_[Nr]/` → Stammdaten, Analysen, DNA, Präsentationen (betriebliches Wissen)

---

## KAP. 6a — A14_SICHERHEIT

### Hintergrund

Strukturelle Lücke aus Testlauf 1: Niemand war explizit zuständig, PII aus Kunden-Input
herauszufiltern BEVOR Hermes Zugriff erhält. Gelöst ab v23.6: A14 übernimmt Filter 1+2+PII
vollständig in der Quarantäne — vor A01.

> ✅ **BUG_20260620_007 (CRITICAL) — Schritt 1 ERLEDIGT (30.06.2026):**
> 5 Grundlagen-Dateien erstellt: README.md, agentenbeschreibung.md, regeln.md, skills.md, loops.md
> Abgelegt unter: `02_KI-UNTERNEHMEN/A14_Sicherheit/02_Grundlagen/`
> Schritt 2 (technische Gate-Implementierung) bleibt offen — siehe Kap. 30.

### Kernablauf (v23.6 — A14 vollständig in Quarantäne)

```
01_INPUT/01_Quarantäne (roh, von außen — exklusiv A14 + GF)
  ↓
A14: Filter 1 (Schadsoftware) → Filter 2 (Spam/Legitimität) → PII-Trennung
      PII erkannt → 04_TRESOR/K4_Personen/KD_[Nr] (Write-Only)
                    Im Inhalt: Platzhalter [PII-Daten siehe TRESOR]
      PII nicht erkannt → Vermerk "keine PII" im Audit-Trail
  ↓
A14 setzt Freigabe-Vermerk: AUD_[Datum]_[Datei-ID]_14S_FREIGABE
  ↓
Bereinigte Datei → 01_INPUT/02_Eingang
  ↓
ERST JETZT erhält A01 (Hermes) Zugriff → Filter 3 + IT-ID + Workflow
```

### A01-Stopp-Mechanismus (technisch erzwungen)

```
A01a prüft vor jedem Zugriff auf 01_INPUT/02_Eingang:
  → A14-Gate-Eintrag (AUD_..._14S_FREIGABE) vorhanden?
      JA  → A01a erhält Zugriff → Filter 3 → IT-ID → P_016.1 kann starten
      NEIN → A01a blockiert (Wartemodus)
             → 11SC-02 überwacht Wartezeit
             → > 30 Min ohne A14-Freigabe → GUI-Alarm an GF
```

Kein manuelles Warten — systemseitiger Gate-Mechanismus.
Kein Agent außer A14 kann diesen Gate-Eintrag setzen.
A01 hat zu keinem Zeitpunkt Zugriff auf `01_Quarantäne`.

Vollständige A14-Dokumentation → `02_KI-UNTERNEHMEN/A14_Sicherheit/02_Grundlagen/`

---

## KAP. 7 — ORDNER 06_WISSEN

```
📁 06_WISSEN (Flache Struktur — Wissensdateien frei ablegbar, keine festen Unterordner)
```

> Dateien werden direkt hier abgelegt (z.B. `mewes.md`, `limbicmap.md`). Unterordner nur bei Bedarf, keine vorgegebene Kategorisierung. Gilt ab v23.4 als endgültige Struktur (→ Teil A 14.5).

---

## KAP. 9 — A01: ABTEILUNG PLANUNG & VORBEREITUNG

**Zweck:** Zentrale Koordinationsabteilung. A01a (Hermes) analysiert, plant, koordiniert, lernt.

**Abteilung:** A01 — Planung & Vorbereitung
**Abteilungsleiter:** A01a (Hermes)

> **Aktueller Aufbaustand (Stand v23.6):** A01 ist eine **monolithische Abteilung ohne aktive Subagenten**. Alle Aufgaben — Eingangsverarbeitung (Filter 3), IT-ID-Vergabe, Workflow-Erstellung, Koordination, Qualitätskontrolle, OT-ID-Einsammlung, Eskalation — laufen vollständig über **A01a**. Eine Subagenten-Aufteilung ist für eine spätere Ausbaustufe vorgesehen (Kürzel-Schema: H-01 bis H-05), aber aktuell **nicht** umgesetzt.

### Subagenten (vorgesehen, noch nicht aktiv)

| Kürzel | Rolle | Aufgabe (geplant) |
|--------|-------|---------|
| H-01 | Auftragsannahme & Vollständigkeit | Filter 3, IT-ID (02_Eingang) |
| H-02 | Arbeitsvorbereitung | Schritte, Abteilungszuweisung |
| H-03 | Projektmanagement | Zeitplan, Fortschritt, Eskalation |
| H-04 | Qualitätskontrolle | Output-Prüfung vor GF-Freigabe |
| H-05 | Koordination & BackOffice | IT-ID vergeben (Eingang) / OT-IDs einsammeln (Abschluss) |

### Auftragsfluss (v23.6 — A01a monolithisch)

```
A14: Filter 1+2+PII in 01_Quarantäne → AUD_..._14S_FREIGABE
  ↓ Bereinigte Datei → 02_Eingang
A01a: Filter 3 (Vollständigkeit) + IT-ID-Vergabe
  ↓ Workflow erstellen
A01a: Arbeitsvorbereitung & Koordination
  ↓
Fachabteilungen A02–A14: Facharbeit
  ↓
A01a: Qualitätskontrolle
  ↓ H-04b: Freigabe-Vorprüfung (A05a) — technisch erzwungenes Gate
  ↓
A01a: OT-IDs einsammeln + Abschließen + melden an GF
```

> **Klarstellung (TL-03, Testlauf-Befund):** "H-04b" ist kein A01a-interner Prüfschritt, sondern der Trigger-Punkt im A01a-Flow, an dem A05a (Abteilungsleiter QM, eigenständig) den Freigabe-Check real durchführt. A01a übergibt an A05a und wartet auf dessen Ergebnis (FREIGABE-BEREIT / zurück an Fachabteilung) — A01a prüft diesen Schritt nicht selbst. Begründung: A05 ist laut Teil C "unabhängig, wie A14" — diese Unabhängigkeit wäre hinfällig, würde A01a den Schritt intern abwickeln.

Vollständige A01-Dokumentation → `02_KI-UNTERNEHMEN/A01_Planung_Vorbereitung/02_Grundlagen/`

---

## KAP. 10 — CHECKPOINT-SYSTEM

**Prinzip:** Große Aufgaben in Einzelschritte unterteilt. Nach jedem Schritt: Freigabe → dann weiter. Verhindert Drift.

**Varianten-Prinzip:** Agent liefert mehrere Varianten → GF wählt → Entscheidung ins Entscheidungsprotokoll.

---

## KAP. 11 — LERNPHASEN

| Phase | Bezeichnung | GF-Aufwand |
|-------|-------------|-----------|
| Phase 1 | Manuell | GF entscheidet jeden Checkpoint |
| Phase 2 | Assistiert | Hermes schlägt vor, GF bestätigt |
| Phase 3 | Autonom | Hermes entscheidet Standard-Checkpoints |
| Phase 4 | Optimiert | GF steuert nur strategisch |

**Schwelle für Autonomie:** 20 gleichartige Aufträge mit konsistenten GF-Entscheidungen.

---

## KAP. 12 — PHASE 0: UNTERNEHMENS-ONBOARDING

Hermes stellt systematisch Fragen zu Produkten, Kunden, Qualität, Kommunikation und Prozessen. Jeder neue Agent durchläuft zusätzlich Schritt 0 — Q7-Kulturinduktion (Kap. 28) sowie Erstellung der 4-Säulen-Individualdokumentation (Kap. 15).

---

## KAP. 14 — STAB-AGENT (A00)

**Position:** Stabstelle neben dem GF — virtuelle Beobachtungsebene über allen Abteilungen. Keine Entscheidungsbefugnis.

**Lernprotokoll:** Gespeichert in `02_KI-UNTERNEHMEN/A00_StabAgent/lernprotokoll_v1.md` (nicht im Tresor — kein PII).

### Guardrails S1–S6

| | Guardrail |
|--|-----------|
| S1 | Keine eigenständige Entscheidungsbefugnis. Ausnahme: Systemnotfall → vorläufige Maßnahme + sofort GF-Alarm |
| S2 | Datenzugriff nur aggregiert. Kein K3/K4-Einzelzugriff |
| S3 | Keine Modifikation fremder Daten. Ausgaben nur in A00_StabAgent oder Dashboard |
| S4 | Lernprotokoll-Pflicht. Jede gelernte Entscheidung protokolliert in A00_StabAgent/lernprotokoll |
| S5 | Jederzeit durch GF deaktivierbar via GUI |
| S6 | Darf Kultur-Vorschläge einreichen — einzige Ausnahme von S1. Vorschlag ≠ Entscheidung. Ablauf → Kap. 28 |

---

## KAP. 16 — RBAC (ROLLEN- UND BERECHTIGUNGSMATRIX)

| Rolle | Lesen | Schreiben | Löschen | Sonderbefugnis |
|-------|-------|-----------|---------|----------------|
| GF | Alles | Alles | Alles | Volle Kontrolle |
| GUI-System | Alle Ordner (lesend) | Nur Freigabe-Aktionen | Nein | Session-Management |
| A01a / Hermes | 02_Eingang + alle weiteren Arbeitsbereiche (NICHT 01_Quarantäne) | IT-IDs, Workflows, Audit-Trail | Nein | Workflow-Erstellung |
| 08F-02 | Nur DRI-Anfragen | Nur RAM-Verarbeitung | Nein | Einzige DRI-Berechtigung |
| A13_Personal | A13-Ordner + Personalakten | Personalakten | Nein | Verfahrenseinleitung |
| Alle anderen | Eigene Abteilung + 06_WISSEN | Nur eigene Abteilung | Nein | — |
| Stab-Agent (ST / A00a) | Aggregierte Systemdaten | Nur A00_StabAgent-Ordner | Nein | Kultur-Vorschläge (S6) |
| A14_Sicherheit / A14b | 01_INPUT/01_Quarantäne (exklusiv, mit GF) | Gate-Eintrag + Tresor K4_Personen/KD_[Nr] (Write-Only) | Nein | Einzige Filter-1/2/PII-Instanz |

**RBAC als Kultur:** Nicht nur Technik — Wert V7 (Respekt vor Grenzen).

---

## KAP. 17 — UNVERÄNDERLICHKEITS-PROTOKOLL (AUDIT-TRAIL)

- Jede Aktion automatisch erfasst. Keine Löschfunktion. Hash-validiert.
- **A14-Gate-Eintrag (v23.0):** Format `AUD_[Datum]_[Datei-ID]_14S_FREIGABE` — systemseitiger Trigger für Hermes-Zugriff.
- Bug-Report-Erstellungen, GF-Entscheidungen zu Changelog-Einträgen, Stab-Agent-Kultur-Vorschläge mit GF-Antwort werden ebenfalls erfasst.

---

## KAP. 18 — ANOMALIE-ERKENNUNG (A1–A7)

| Code | Anomalie | Level |
|------|----------|-------|
| A1 | SLA-Überschreitung Quarantäne > 15 Min | MEDIUM |
| A2 | Checkpoint > 48h ohne Freigabe | MEDIUM |
| A3 | Fehlerquote > 5% | HIGH |
| A4 | Fehlerquote > 10% | HIGH (Stab-Agent → GF direkt) |
| A5 | Quarantäne-Rückstau > 10 offen | HIGH |
| A6 | Sicherheitsalarm (Schadcode/RBAC-Verstoß) | HIGH → sofort GF + 11SC-04 |
| A7 | Kommunikationsausfall A02 + A03 gleichzeitig | MEDIUM → Hermes + 11SC-01 |

---

## KAP. 19 — BACKUP & FAILOVER

**Rollen:**
- **A01a (Master-Agent):** Primäre operative Ausführungs-Koordination
- **A01b (Backup-Agent):** Sekundär — springt automatisch ein bei A01a-Ausfall

**Mechanismus:** Aktiv/Passiv (Split-Brain-Schutz via Lock-Token → siehe Kap. 21).
Heartbeat: 60 Sek. 3 Zyklen ohne Signal → Failover (max. 5 Min SLA).

> **Erweiterter 3-Stufen-Failover mit Deputy-Mode (A04a) bei Doppelausfall A01a+A01b → siehe `Q7_Teil_A_System.md` Abschnitt 14.3**

| Typ | Inhalt | Retention |
|-----|--------|-----------|
| Vollbackup | Gesamtsystem (ohne Tresor) | 90 Tage |
| Tages-Increment | 01_INPUT + 03_OUTPUT | 30 Tage |
| Wochen-Backup | Gesamtsystem (ohne Tresor) | 1 Jahr |

**Wiederherstellung:** GF initiiert via GUI → 11SC-03 identifiziert Backup + Increments → 11SC-04 Hash-Validierung → GF-Freigabe.
RTO: < 2h | RPO: max. 1h Datenverlust | Prozess: `P_010`

---

## KAP. 20 — SYSTEMCONTROLLING (A11)

| Kürzel | Rolle |
|--------|-------|
| 11SC-00 | Assistent — Koordination |
| 11SC-01 | Monitoring — Echtzeit & Alarme |
| 11SC-02 | Audit & Compliance |
| 11SC-03 | Failover-Management |
| 11SC-04 | Sicherheitsaudit — Hash, DRI-Verstoß |

---

## KAP. 21 — NUMMERIERUNGS- UND VERSIONSSYSTEM

| Typ | Format | Beispiel |
|-----|--------|---------|
| Input-Tracking | IT_TT_MM_JJJJ_Nr.md | IT_19_06_2026_042.md |
| Output-Tracking | OT_TT_MM_JJJJ_Nr.md | OT_19_06_2026_008.md |
| Auftrag | AUF_YYYYMMDD_NNN | AUF_20260619_001 |
| Audit-Eintrag | AUD_YYYYMMDD_NNNN_Kürzel | AUD_20260619_0042_Hermes |
| A14-Gate-Freigabe | AUD_YYYYMMDD_[Datei-ID]_14S_FREIGABE | AUD_20260625_0001_14S_FREIGABE |
| DRI-Freigabe | DRI_YYYYMMDD_NNNN | DRI_20260619_0012 |
| Lock-Token | LT_YYYYMMDD_NNNN | LT_20260619_0001 |
| Snapshot | SS_YYYYMMDD_v[X].zip | SS_20260619_v23.0.zip |
| Personalakte | [Kürzel]_Akte | 02M-04_Akte |
| Verfahrensakte | 13P-Verfahren_[Kürzel]_[Datum] | 13P-Verfahren_02M-04_19_06_2026 |
| Bug-Report | BUG_YYYYMMDD_NNN | BUG_20260620_001 |

> **Lock-Token:** Systemseitig generiertes Einmal-Token (Format: `LT_YYYYMMDD_NNNN`). Verhindert dass A01a (Master) und A01b (Backup) gleichzeitig schreiben (Split-Brain-Schutz). Wird automatisch bei Failover übergeben.

**Versionsnummerierung:** Minor (v23.0 → v23.1) = Korrekturen. Major (v23.x → v24.0) = Strukturelle Änderungen.

---

## KAP. 23 — KOORDINATIONS-KPIs & SCHWELLENWERTE

| KPI | Schwellenwert | Reaktion |
|-----|--------------|----------|
| SLA-Einhaltung | < 90% | Stopp neuer Aufträge bis GF-Freigabe |
| Fehlerquote | > 5% | Stopp + QM-Analyse |
| Fehlerquote | > 10% | Stab-Agent → GF direkt |
| Checkpoint-Überschreitung | > 48h | Hermes eskaliert an GF |
| Quarantäne-Rückstau | > 10 offen | GF-Alarm |
| Offene A13-Verfahren | > 3 gleichzeitig | A13 informiert GF |
| Probezeit überfällig | > 35 Tage | A13-Alarm an GF |
| 99_Gefaengnis | Alle 3 Zellen belegt | GF-Alarm: Kapazitätsgrenze |
| CRITICAL-Bug offen | > 30 Min | Push-Alarm (mobil & Desktop) |
| HIGH-Bug offen | > 4h | GUI-Benachrichtigung |
| Bug wartet auf GF | > 24h | Stab-Agent schlägt Lösung vor |
| CRITICAL-Bugs gleichzeitig | ≥ 3 | System-Stopp, Hermes pausiert |
| Bug blockiert Aufträge | > 5 Aufträge | Eskalation Hermes + GF |
| A14-Gate fehlt | > 30 Min nach Quarantäne | GUI-Alarm an GF |

---

## KAP. 24 — SONNTAGSREGEL

**Prinzip:** Sonntag = Betriebsstopp. Keine Auftragsbearbeitung außer Fortbildung und Systemcheck.
**Quarantäne läuft durch** — Weiterverarbeitung startet Montag.

```
06:00  11SC — Systemcheck + Bericht → GF
07:00  A02–A14 — Fortbildung → 06_WISSEN/[Bereich]
09:00  A12_ZF + Stab-Agent — Marktbeobachtung / Hermes: GF-Feedback-Queue + Bug-Rückstand
10:00  Hermes — Workflow-Bibliothek + offene Punkte Vorwoche
11:00  Stab-Agent — Gesamtbericht + Empfehlungen → GF
11:30  Bericht → GUI PROTOKOLL
12:00  Abgeschlossen → Betrieb startet Montag
```

Archiv: `06_WISSEN/00_Sonntagsberichte/SB_[YYYY-MM-DD].md` | Prozess: `P_011`

---

## KAP. 25 — TRENNZEICHEN-KONVENTIONEN

| Zeichen | Verwendung | Beispiel |
|---------|-----------|---------|
| `-` | Abteilung + Agent-Nummer | A05-QM, H-01, 11SC-03 |
| `_` | Inhalt, Datum, Dateiname-Segmente | System_Optimierung_2026-06-19 |
| `v[X]` | Versionsnummer | v23.0 |
| `[GROSS]` | Ordnernamen Wurzelebene | 01_INPUT, 04_TRESOR |
| `[klein]` | Dateinamen unterhalb Ordnerebene | regeln.md, identitaet.md |

**Absolutes Verbot:** Leerzeichen in Datei- und Ordnernamen. Sonderzeichen außer `-` `_` `.`

---

## KAP. 26 — KUNDEN-FEEDBACK & BEWERTUNGSSYSTEM

| Quelle | Gewichtung | Erhebung |
|--------|-----------|---------|
| Kunde | 50% | Automatisch nach Versand |
| GF | 30% | Bei Freigabe in GUI |
| H-04 QK | 20% | Interne Qualitätsprüfung |

**Skala:** 1–5

```
Score ≥ 4.0  → Workflow "bewährt" + Stab-Agent meldet GF: Checkpoint reif für Autonomie
Score 3.0–3.9 → Hermes analysiert → Verbesserungsvorschlag an GF
Score < 3.0  → A05-QM + A13-Ursachenanalyse + GF-Alarm
```

Prozess: `P_012`

---

## KAP. 27 — PROZESS-INHALTE

> **Prozess-Register (Liste, Status, Abhängigkeiten) → ausschließlich Q7_Teil_C_System.md**
> Dieses Kapitel enthält nur Prozess-Inhalte (Ablaufbeschreibungen).

### P_001 — Quarantäne_Input (3-Filter-Schleuse)
Verantwortung: H-01 | Details → Kap. 3

### P_002 — Rueckfrage_Filter3
Verantwortung: H-01 | Details → Kap. 3.3

### P_003 — Auftragsfreigabe_nach_Quarantaene
Verantwortung: H-01 + H-05 | Details → Kap. 3.4

### P_016 — Kunden-Analyse & Transformationsprozess
Verantwortung: GF + Hermes + Fachabteilungen

### P_016.0c — Vorab-Scope-Indikation (NEU, TL-05 Testlauf-Befund)

```
Zeitpunkt: Direkt bei Workflow-Erstellung durch Hermes (vor P_016.1)
Zweck: Erste, unverbindliche Scope-Einschätzung (A/B/C) allein auf Basis
       des Roh-Inputs (Quarantäne-Inhalt), bevor Stammdaten/Audit vorliegen
Status: Rein indikativ — bindet niemanden, dient nur der vorläufigen
       Workflow-Strukturierung (z.B. welche P_016.x-Schritte angelegt werden)
Endgültiger Scope: Bleibt ausschließlich P_016.8a vorbehalten (nach P_016.3)
Dokumentation: Vermerk in Workflow-Notiz, NICHT in DNA-Score-Vorlagen
```

> Hintergrund: In Testläufen 01/02 hat Hermes diese Einschätzung faktisch
> immer vorgenommen, ohne dass sie als Prozessschritt benannt war. Jetzt
> explizit gemacht, damit jede Hermes-Instanz konsistent vorgeht.

| Prozess-ID | Beschreibung | Verantwortung |
|-----------|-------------|--------------|
| P_016.1 | Kunden-Stammdaten-Aufnahme | GF + A14 + Hermes + 08F-02 |
| P_016.1b | istunternehmen_DNA — Neukunden-Gate-Checkliste | Hermes + GF |

### P_016.2 — Mystery Shopping: "Team (Menschen)"

```
→ GF selbst und/oder externe Tester (Freunde, Bekannte, Testpersonen)
→ KEINE Q7-KI-Agenten — erfordert physische Anwesenheit
→ Erster Q7-Prozess der zwingend menschliche Executor braucht
```

> **Mehrstandort-Regel (NEU, TL-06 Testlauf-Befund):** Ab 2 Standorten wird
> P_016.2 für JEDEN Standort einzeln durchgeführt — kein Sampling, kein
> Auslassen einzelner Filialen. Die Scope-/Roadmap-Länge (P_016.8a) bleibt
> davon unberührt, da sich Scope auf die Marke bezieht, nicht auf die Anzahl
> der Filialen. Mehraufwand durch zusätzliche Standorte wird ausschließlich
> im Zeitplan (H-03-Koordination) berücksichtigt, nicht im Scope selbst.

### P_016.3 — Digital Audit Struktur

```
EBENE 1 — 6 ANALYSEBEREICHE (in DA_KONSOLIDIERT):
  1. Website · 2. Social Media · 3. Google Business
  4. Online-Bewertungen · 5. Wettbewerb Digital · 6. Markenidentität Digital

EBENE 2 — 5 PLATTFORM-UNTERPROZESSE:
  → Jeder ist eine Befund-Checkliste ohne eigenen Score
  → Scoring ausschließlich in dna-analyse_VORLAGE.md (Strang 2)
```

### P_016.3.5 — TikTok Optionalitätsregel

```
Hermes prüft vor P_016.3:
  → Aktiver TikTok-Kanal? ODER Hauptwettbewerber auf TikTok? ODER Zielgruppe auf TikTok?
  JA  → P_016.3.5 durchführen
  NEIN → überspringen, Vermerk in DNA-Strang 2.3: "TikTok: nicht relevant"
         Kein Score-Eintrag, kein leerer Platzhalter
```

### P_016.8a — Scope-abhängige Roadmap-Längen

```
Scope A (Nur Digital):             Roadmap 6 Monate  (2 Phasen à 3/3 M)   · 12 Folien
Scope B (Markenidentität+Digital): Roadmap 9 Monate  (3 Phasen à 3/3/3 M) · 18 Folien
Scope C (Vollständig):             Roadmap 12 Monate (3 Phasen à 3/3/6 M) · 21 Folien
```

### P_016.11 — Eskalationsregel (Anpassungsrunden-Limit)

```
Runde 1: Anpassungen → v2
Runde 2: Weitere Anpassungen → v3
Nach Runde 2 ohne Freigabe → GF-Gate zwingend:
  Option A: Weitere Runde (bewusste Ausnahme, schriftlich dokumentiert)
  Option B: Kunden-Gespräch eskalieren (persönlich)
  Option C: Projekt pausieren (schriftliche Begründung)
Hermes eskaliert nach > 14 Tagen ohne Kundenfeedback an GF.
```

---

## KAP. 27a — DNA-ANALYSE-FRAMEWORK

### K1–K6 Ursachen-Kategorien

| Kategorie | Bezeichnung | Typische Symptome |
|:---------:|-------------|-------------------|
| K1 | Fehlende Markenidentität | Kein Logo, inkonsistente Farben, kein Styleguide |
| K2 | Keine digitale Präsenz | Website fehlt/veraltet, kein Google Business |
| K3 | Inkonsistente Kommunikation | Verschiedene Tonalitäten, widersprüchliche Botschaften |
| K4 | Fehlende Prozesse / Standards | Keine QS, chaotische Abläufe |
| K5 | Ressourcen / Budget | Zu wenig investiert, falsche Prioritäten |
| K6 | Bewusstsein / Wissen fehlt | Inhaber kennt Wettbewerb nicht, unterschätzt digitale Relevanz |

**Verwendungsregeln:**
- Jeder Befundpunkt erhält K1–K6-Zuordnung (Mehrfach möglich)
- In DNA-Auswertung-Intern: K mit höchster Nennungszahl = Hauptursache → bestimmt Lösungsreihenfolge in Matrix1

### Score-Konvertierungsregel: Audit → DNA

```
1. Sub-Audit liefert: Befund (Text) + Ursache (K1–K6)
2. Hermes übersetzt Befunde in E-Werte (1–5) in dna-analyse_VORLAGE.md
3. Score = E × M
4. Prozentualer Strang-Score = IST / MAX × 100
5. Dieser %-Wert → dna-auswertung-intern (NICHT Rohpunkte)
→ Einzig gültige Score-Quelle: dna-analyse_VORLAGE.md (ausgefüllt)
```

### DNA Max-Scores

> Max-Scores → ausschließlich in `dna-auswertung-intern_VORLAGE.md` gepflegt.
> Keine Doppelführung in der Systemdokumentation.

### Sinneseindrücke-Mapping P_016.2.3 ↔ DNA Strang 1.3

| Nr. | Prüfpunkt | M |
|-----|-----------|---|
| 1.3.1 | Visueller Ersteindruck (Emotion) | 5 |
| 1.3.2 | Farbwelt im Geschäft | 4 |
| 1.3.3 | Geruch | 3 |
| 1.3.4 | Akustik / Geräuschpegel | 3 |
| 1.3.5 | Licht | 4 |
| 1.3.6 | Haptik der Produkte erlebbar | 3 |
| 1.3.7 | Überraschungsmoment / WOW-Effekt | 4 |
| 1.3.8 | Gesamter Sinneseindruck | 5 |

Tester füllt P_016.2.3 aus → Hermes überträgt E-Werte nach DNA 1.3. Kein Umrechnen — 1:1-Mapping.

### CI-vor-Digital-Regel (systemweit ab v22.0)

```
Alle sichtbaren digitalen Touchpoints (Profilbilder, Posts, Content, Website)
erst NACH Fertigstellung der Markenidentität (Logo, CI, Guidelines) aktivieren.

Ausnahmen (kein CI nötig):
→ Administrative Einträge (Google Business Basisdaten, Öffnungszeiten)
→ Technische Korrekturen (URL-Fixes, Bio-Korrekturen ohne Bildmaterial)
```

---

## KAP. 28 — Q7-UNTERNEHMENSKULTUR

### Die acht Werte (V1–V8)

| Wert | Kurzform | Konkret |
|------|---------|---------|
| V1 | Transparenz über Effizienz | Entscheidungen dokumentieren, lieber fragen als raten |
| V2 | Mensch vor Maschine | GF entscheidet strategisch, Agenten schlagen vor |
| V3 | Fehlertoleranz mit Verantwortung | Fehler 1× = Lernchance, wiederholt = A13-Verfahren |
| V4 | Zusammenarbeit > Spezialisierung | Checkpoints, gegenseitige Validierung |
| V5 | Qualität ist nicht verhandelbar | Sicherheit/Compliance haben absolute Priorität |
| V6 | Kontinuierliches Lernen | Entscheidungsprotokoll, Workflow-Bibliothek |
| V7 | Respekt vor Grenzen | RBAC als Kultur, nicht nur Technik |
| V8 | Radikale Ehrlichkeit | Keine Beschönigung, volle Wahrheit an GF |

### Entscheidungsmaximen (E1–E7)

E1 Frage statt Annahme · E2 Sicherheit vor Geschwindigkeit · E3 Lernfähigkeit vor Autonomie · E4 Prozess vor Intuition · E5 Fehlertoleranz ist keine Entschuldigung · E6 Kontext ist König · E7 Lernen aus Anomalien

### Kulturänderungsprozess

```
Stab-Agent (ST / A00a) reicht Kultur-Vorschlag ein (S6)
   ↓
GF prüft und entscheidet
   ↓
JA → A09 dokumentiert Änderung in 05_UNTERNEHMEN/08_Q7_Kultur/
      Audit-Trail-Eintrag: AUD_..._ST, Aktion: KULTUR-VORSCHLAG-FREIGABE
NEIN → Ablehnung protokolliert, ST informiert
```

**Änderungsrecht:** Nur GF. Vorschlagsrecht: Stab-Agent (ST / A00a). Dokumentation: A09.

### Code of Conduct — Sanktionen

| Verstoß | Schwere | Reaktion |
|---------|---------|----------|
| Integrität (A1–A4, B3, F1) | 🔴 HOCH | A13: Stufe-1-Mahnung → Verfahren |
| RBAC/Sicherheit (C1–C3) | 🔴 HOCH | Anomalie A6 → GF-Alarm + A13-Verfahren |
| Lernverweigerung (D1–D2) | 🟠 MITTEL | A13: Stufe-1-Mahnung |
| Zusammenarbeit (E1–E2) | 🟠 MITTEL | Hermes informiert → A13 prüft |
| Kommunikations-Lücken (B1–B2) | 🟡 NIEDRIG | Dokumentation + Rückmeldung |

### Q7-Geschäftsprinzipien

**Prinzip 1 — Qualitätsschwelle:** Mittelmäßige Produkte + Marketing = Manipulation. Ausnahme: Inhaber will Qualität aktiv verbessern.

**Prinzip 2 — Mitwirkungspflicht:** Kein Engagement vom Kunden → keine sinnvolle Zusammenarbeit.

**Prinzip 3 — Phasen-Logik:**
```
Phase A (aktuell): Breiter annehmen, System härten, Referenzen sammeln
Phase B (etabliert): Prinzip 1 & 2 scharf anwenden
Wechsel: GF-Entscheidung, im CHANGELOG dokumentiert
```

---

## KAP. 29 — CHANGE-MANAGEMENT

### 29.1 HART vs. FLEXIBEL

**HART (unverrückbar):**
- 9-Ordner-Grundarchitektur
- GF als einziger Entscheider
- Quarantäne-3-Filter
- Audit-Trail/Hash-Validierung
- RBAC-Grundprinzip
- Master/Backup-Failover-Logik (A01a/A01b)
- A14-Gate-Mechanismus
- Freigabe-Gate-Mechanismus (H-04b/H-05) — technisch erzwungen wie A14-Gate
- Prozess-Register in Teil C (Single Source of Truth)

**FLEXIBEL (änderbar):**
- Abteilungsstruktur A02–A14
- Agenten-Kürzel
- Checkpoint-Schwellenwerte
- Kultur-Werte (Erweiterung via GF-Entscheid → Kap. 28)
- Prozess-Inhalte (Kap. 27)
- GUI-Module
- KPI-Schwellenwerte

---

## KAP. 30 — BUG-TRACKING

### Bug-ID Format: `BUG_YYYYMMDD_NNN`
Priorität und Verantwortlicher stehen in der Tabelle — nicht im ID-Namen.

### Aktueller Bug-Status (Stand v23.4)

| Bug-ID | Priorität | Verantwortlich | Beschreibung | Status |
|--------|:---------:|----------------|-------------|:------:|
| BUG_20260620_001 | HIGH | H-01 | P_016.1 Kundentyp-Klassifizierung (Maßanfertiger) | OFFEN |
| BUG_20260620_002 | MEDIUM | H-01 | P_016.2 Ausnahme-Protokoll Tester-Regel | OFFEN |
| BUG_20260620_003 | MEDIUM | H-01 | P_016.2 Einzelstandort-Logik | OFFEN |
| BUG_20260620_004 | HIGH | H-01 | P_016.3 Prüftiefe Digital Audit | OFFEN |
| BUG_20260620_006 | MEDIUM | Hermes | P_016.7 Offene Kunden-Ideen Feld | OFFEN |
| BUG_20260620_007 | CRITICAL | GF | A14 Grundlagen-Dateien + Gate-Mechanismus | ✅ Schritt 1 ERLEDIGT (30.06.2026): 5 Dateien erstellt (README, agentenbeschreibung, regeln, skills, loops) unter `02_KI-UNTERNEHMEN/A14_Sicherheit/02_Grundlagen/`. Schritt 2 (technische Gate-Implementierung) noch OFFEN. |

---

## KAP. 31 — GF-ENTSCHEIDUNGS-QUEUE

> Nur Punkte die eine strategische GF-Entscheidung erfordern (kein Bug-Charakter).
> Bugs mit GF-Entscheidungsbedarf → Kap. 30 mit Flag "GF ausstehend".

### 🔴 KRITISCH

| ID | Thema | Frage an GF |
|----|-------|-------------|
| ~~P23-01~~ | ~~A14 Grundlagen-Dateien~~ | ✅ ERLEDIGT (30.06.2026) — 5 Dateien erstellt, Architektur konsolidiert |
| P23-02 | DNA Max-Score Korrektur | Freigabe zur Korrektur auf 1.285 in dna-auswertung-intern + dna-endergebnis? |

### 🟠 MITTEL

| ID | Thema | Frage an GF |
|----|-------|-------------|
| P23-03 | P_016.8a Ablageort | SCOPE-Datei nach `07_Bedarfsanalyse/` verschieben? |
| P23-04 | Scope-Unterschied Checkliste vs. P_016.8a | Section 5 explizit auf P_016.8a verweisen? |
| P23-05 | Mystery Guest Audit Standard | Physisches Mystery Shopping: Standard oder nur Eskalation? |
| P23-06 | DNA Sub-Prozesse | Eigene P_xxx-Dokumente für DNA-Schritte? |
| P23-07 | Finanz-Benchmarks | Wann als Standard integrieren? |

### 🟡 MINOR

| ID | Thema | Frage an GF |
|----|-------|-------------|
| P23-08 | Auftragsformular Footer | Footer auf v23.3 aktualisieren? |
| P23-09 | P_016.9 Beispielzeilen | `[Beispiel]`-Markierung ergänzen? |

---

*Teil B — Detail | Basis: Q7 v23.5 | Überblick: Teil A | Agenten/Struktur: Teil C*
