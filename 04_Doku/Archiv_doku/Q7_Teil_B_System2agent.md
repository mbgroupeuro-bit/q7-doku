# Q7_Teil_B_System.md — TEIL B: DETAIL
**Basis:** v23.2 (2026-06-27) | **Typ:** Vollständige Regelreferenz
**Überblick:** → Teil A | **Agenten & Ordnerstruktur:** → Teil C

---

Dieses Dokument enthält die detaillierten Mechanismen, Prozessinhalte, Sub-Agenten und Regeln.

---

## KAP. 0 — INHALTSVERZEICHNIS

| Kap. | Titel | Status |
|------|-------|--------|
| 1 | Hierarchie-Regeln (Detail) | ⏳ Ausstehend |
| 2 | GF-Schnittstelle & GUI-Regeln | ⏳ Ausstehend |
| 3 | Ordner 01_INPUT: Sicherheitsschleuse | ✅ Vorhanden |
| 4 | Ordner 03_OUTPUT | ✅ Vorhanden |
| 5 | Ordner 04_TRESOR | ✅ Vorhanden |
| 6 | Ordner 05_UNTERNEHMEN | ✅ Vorhanden |
| 6a | A14_Sicherheit | ✅ Vorhanden |
| 7 | Ordner 06_WISSEN | ✅ Vorhanden |
| 8 | Ordner 04_Doku | ⏳ Ausstehend |
| 9 | A01 — Abteilung Planung & Vorbereitung | ✅ Vorhanden |
| 10 | Checkpoint-System | ✅ Vorhanden |
| 11 | Lernphasen | ✅ Vorhanden |
| 12 | Phase 0: Unternehmens-Onboarding | ✅ Vorhanden |
| 13 | A13 — Personal: Agenten-Lebenszyklus | ⏳ Ausstehend |
| 14 | Stab-Agent (A00) | ✅ Vorhanden |
| 15 | 4-Säulen-Individualdokumentation | ⏳ Ausstehend |
| 16 | RBAC — Rollen- und Berechtigungsmatrix | ✅ Vorhanden |
| 17 | Unveränderlichkeits-Protokoll (Audit-Trail) | ✅ Vorhanden |
| 18 | Anomalie-Erkennung (A1–A7) | ✅ Vorhanden |
| 19 | Backup & Failover | ✅ Vorhanden |
| 20 | Systemcontrolling (A11) | ✅ Vorhanden |
| 21 | Nummerierungs- und Versionssystem | ✅ Vorhanden |
| 22 | Eskalations- und Alarmierungskette | ⏳ Ausstehend |
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

**SLA Quarantäne:** 15 Minuten (Filter 1–3 gesamt). Überwachung: 11SC-01.

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

**Bei Fund — Isolierung in 99_Gefaengnis:**

```
📁 01_INPUT/01_Quarantäne/
│
├── 📁 00_Eingang
└── 📁 99_Gefaengnis/
    ├── 📁 Zelle_01      ← Isoliert — kein Kontakt zu anderen Zellen
    ├── 📁 Zelle_02      ← Isoliert — kein Kontakt zu anderen Zellen
    └── 📁 Zelle_03      ← Isoliert — kein Kontakt zu anderen Zellen
```

```
Schadcode / Virus erkannt
   ↓
Input kommt in nächste freie Zelle in 99_Gefaengnis/
(jede Bedrohung erhält ihre eigene Zelle — kein Kontakt zwischen Zellen)
   ↓
GF-Alarm via GUI-Modul INBOX (Anomalie A6 — Level HIGH)
   ↓
11SC-04 Sicherheitsaudit übernimmt Analyse
   ↓
Audit-Trail-Eintrag: AUD_..._H-01, Aktion: SICHERHEITSALARM
   ↓
Alle 3 Zellen belegt → zusätzlicher GF-Alarm: Kapazitätsgrenze erreicht
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
Beispiel: `Rueckfrage_Email_20260617_003.md`

**Speicherort:** `02_KI-UNTERNEHMEN/A01_Planung_Vorbereitung/05_SubAgenten/H-01_Auftragsannahme/`

---

### 3.4 Freigabe — Was passiert nach bestandenen Filtern?

```
Alle drei Filter bestanden
   ↓
H-01 gibt Input frei
   ↓
H-05 (Aufgabe 1): IT-ID vergeben
Format: IT_TT_MM_JJJJ_Nr  (z.B. IT_19_06_2026_004)
   ↓
Input wird in 01_INPUT/02_Eingang verschoben
   ↓
Hermes (A01) erstellt Workflow → Verarbeitung beginnt
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
→ H-01 meldet Muster an Stab-Agent (A00) → A00 schlägt GF Gegenmaßnahme vor.

---

## KAP. 4 — ORDNER 03_OUTPUT

```
📁 03_OUTPUT
├── 📁 01_In_Arbeit
├── 📁 02_Zur_Freigabe
├── 📁 03_Freigegeben
├── 📁 04_Versendet
└── 📁 05_Archiv
```

---

## KAP. 5 — ORDNER 04_TRESOR

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
└── zugriffsprotokoll_v1.md   ← Jeder DRI- und GF-Zugriff protokolliert
```

**Position:** Separater Bereich — physisch und logisch isoliert vom normalen System.

**Inhalt:** Ausschließlich sensible, personenbezogene Daten (PII, Bankdaten, Zugangsdaten).
Lernprotokolle und Systemdaten gehören NICHT in den Tresor → siehe A00_StabAgent Ordner.

### Dynamic Request Interface (DRI)

- Kein Agent hat direkten Zugriff auf den Tresor
- Zugriff nur über DRI: punktuelle, validierte Einzelanfrage pro Vorgang
- Exklusiv autorisiert: **08F-02_Invoicing** (nur für Rechnungsstellung)
- K4-Daten werden nur im RAM zusammengeführt → direkte PDF-Generierung → Cache sofort überschrieben
- Jede nicht-autorisierte DRI-Anfrage wird abgelehnt und an 11SC-04 gemeldet

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
├── 📁 07_Onboarding
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

Strukturelle Lücke aus Testlauf 1: Niemand war explizit zuständig, PII aus Kunden-Input herauszufiltern BEVOR Hermes Zugriff erhält.

> ⚠️ **BUG_20260620_007 (CRITICAL):** A14 Grundlagen-Dateien noch nicht erstellt. Gate-Mechanismus ist dokumentiert aber noch nicht implementiert. Schritt 1: 4 Grundlagen-Dateien erstellen (identitaet.md, stellenbeschreibung.md, regeln.md, README.md). Schritt 2: Gate-Mechanismus implementieren. GF-Entscheidung zu Schritt 1 ausstehend.

### Kernablauf

```
01_INPUT/02_Eingang (roh, ggf. mit PII)
  → A14 prüft auf personenbezogene Daten
      JA  → PII extrahieren → 04_TRESOR/K4_Personen/KD_[Nr]
             Bereinigte Datei zurück nach 01_INPUT/02_Eingang
      NEIN → Datei verbleibt, Vermerk "keine PII" im Protokoll
  → A14 setzt Freigabe-Vermerk: AUD_[Datum]_[Datei-ID]_14S_FREIGABE
  → ERST NACH diesem Gate-Eintrag erhält Hermes Zugriff
```

### Hermes-Stopp-Mechanismus (technisch erzwungen)

```
Hermes prüft vor jedem Zugriff auf 01_INPUT/02_Eingang:
  → A14-Gate-Eintrag vorhanden?
      JA  → Hermes erhält Zugriff → P_016.1 kann starten
      NEIN → Hermes blockiert (Wartemodus)
             → 11SC-02 überwacht Wartezeit
             → > 30 Min ohne A14-Freigabe → GUI-Alarm an GF
```

Kein manuelles Warten — systemseitiger Gate-Mechanismus. Kein Agent außer A14 kann diesen Gate-Eintrag setzen.

---

## KAP. 7 — ORDNER 06_WISSEN

```
📁 06_WISSEN
├── 📁 00_Sonntagsberichte
├── 📁 01_Allgemeines_Wirtschaft
├── 📁 02_Branchenwissen
├── 📁 03_Marktdaten
├── 📁 04_Technologie
├── 📁 05_Recht_Compliance
└── 📁 06_Best_Practices
```

---

## KAP. 9 — A01: ABTEILUNG PLANUNG & VORBEREITUNG

**Zweck:** Zentrale Koordinationsabteilung. Hermes (Abteilungsleiter) analysiert, plant, koordiniert, lernt.

**Abteilung:** A01 — Planung & Vorbereitung
**Abteilungsleiter:** Hermes

> H-00 entfällt. Hermes ist direkt der Abteilungsleiter von A01. Sub-Agenten H-01 bis H-05 berichten an Hermes.

### Sub-Agenten

| Kürzel | Rolle | Aufgabe |
|--------|-------|---------|
| H-01 | Auftragsannahme & Analyse | Quarantäne-Prüfung, 3-Filter, IT-ID (Eingang) |
| H-02 | Arbeitsvorbereitung | Schritte, Abteilungszuweisung |
| H-03 | Projektmanagement | Zeitplan, Fortschritt, Eskalation |
| H-04 | Qualitätskontrolle | Output-Prüfung vor GF-Freigabe |
| H-05 | Koordination & BackOffice | Aufgabe 1: IT-ID vergeben (Eingang) / Aufgabe 2: OT-IDs einsammeln (Abschluss) |

### Auftragsfluss

```
H-01: Annehmen & analysieren + IT-ID vergeben (via H-05 Aufgabe 1)
  ↓ A14: PII-Trennung & Gate-Freigabe
  ↓ Hermes (A01): Workflow erstellen
  ↓ H-02: Arbeitsvorbereitung
  ↓ H-03: Koordinieren & überwachen
  ↓ Fachabteilungen A02–A14: Facharbeit
  ↓ H-04: Qualitätskontrolle
  ↓ H-05 (Aufgabe 2): OT-IDs einsammeln & Abschließen & melden
```

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

Ergebnis gespeichert in `05_UNTERNEHMEN/07_Onboarding/`.

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
| Hermes (A01) | Alle Arbeitsbereiche | IT-IDs in Abteilungen | Nein | Workflow-Erstellung |
| 08F-02 | Nur DRI-Anfragen | Nur RAM-Verarbeitung | Nein | Einzige DRI-Berechtigung |
| A13_Personal | A13-Ordner + Personalakten | Personalakten | Nein | Verfahrenseinleitung |
| Alle anderen | Eigene Abteilung + 06_WISSEN | Nur eigene Abteilung | Nein | — |
| Stab-Agent (A00) | Aggregierte Systemdaten | Nur A00_StabAgent-Ordner | Nein | Kultur-Vorschläge (S6) |
| A14_Sicherheit | 01_INPUT/02_Eingang | Gate-Eintrag im Protokoll | Nein | Einzige PII-Trenninstanz |

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

> **Prozess-Register (Liste, Status, Abhängigkeiten) → ausschließlich Q7_Teil_C_System.md, Abschnitt PROZESS-REGISTER.**
> Dieses Kapitel enthält nur Prozess-Inhalte (Ablaufbeschreibungen).

### P_001 — Quarantäne_Input (3-Filter-Schleuse)
Verantwortung: H-01 | Details → Kap. 3

### P_002 — Rueckfrage_Filter3
Verantwortung: H-01 | Details → Kap. 3.3

### P_003 — Auftragsfreigabe_nach_Quarantaene
Verantwortung: H-01 + H-05 | Details → Kap. 3.4

### P_016 — Kunden-Analyse & Transformationsprozess
Verantwortung: GF + Hermes + Fachabteilungen

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
Scope A (Vollständig):             Roadmap 12 Monate (3 Phasen à 3/3/6 M) · 21 Folien
Scope B (Markenidentität+Digital): Roadmap 9 Monate  (3 Phasen à 3/3/3 M) · 18 Folien
Scope C (Nur Digital):             Roadmap 6 Monate  (2 Phasen à 3/3 M)   · 12 Folien
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
A00 (Stab-Agent) reicht Kultur-Vorschlag ein (S6)
   ↓
GF prüft und entscheidet
   ↓
JA → A09 dokumentiert Änderung in 05_UNTERNEHMEN/08_Q7_Kultur/
      Audit-Trail-Eintrag: AUD_..._A00, Aktion: KULTUR-VORSCHLAG-FREIGABE
NEIN → Ablehnung protokolliert, A00 informiert
```

**Änderungsrecht:** Nur GF. Vorschlagsrecht: A00 (Stab-Agent). Dokumentation: A09.

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
- 7-Ordner-Grundarchitektur
- GF als einziger Entscheider
- Quarantäne-3-Filter
- Audit-Trail/Hash-Validierung
- RBAC-Grundprinzip
- Master/Backup-Failover-Logik (A01a/A01b)
- A14-Gate-Mechanismus
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

### Aktueller Bug-Status (Stand v23.2)

| Bug-ID | Priorität | Verantwortlich | Beschreibung | Status |
|--------|:---------:|----------------|-------------|:------:|
| BUG_20260620_001 | HIGH | H-01 | P_016.1 Kundentyp-Klassifizierung (Maßanfertiger) | OFFEN |
| BUG_20260620_002 | MEDIUM | H-01 | P_016.2 Ausnahme-Protokoll Tester-Regel | OFFEN |
| BUG_20260620_003 | MEDIUM | H-01 | P_016.2 Einzelstandort-Logik | OFFEN |
| BUG_20260620_004 | HIGH | H-01 | P_016.3 Prüftiefe Digital Audit | OFFEN |
| BUG_20260620_006 | MEDIUM | Hermes | P_016.7 Offene Kunden-Ideen Feld | OFFEN |
| BUG_20260620_007 | CRITICAL | GF | A14 Grundlagen-Dateien noch nicht erstellt | OFFEN — Schritt 1: 4 Dateien erstellen |

---

## KAP. 31 — GF-ENTSCHEIDUNGS-QUEUE

> Nur Punkte die eine strategische GF-Entscheidung erfordern (kein Bug-Charakter).
> Bugs mit GF-Entscheidungsbedarf → Kap. 30 mit Flag "GF ausstehend".

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
| P23-08 | Auftragsformular Footer | Footer auf v23.2 aktualisieren? |
| P23-09 | P_016.9 Beispielzeilen | `[Beispiel]`-Markierung ergänzen? |

---

*Teil B — Detail | Basis: Q7 v23.2 | Überblick: Teil A | Agenten/Struktur: Teil C*
