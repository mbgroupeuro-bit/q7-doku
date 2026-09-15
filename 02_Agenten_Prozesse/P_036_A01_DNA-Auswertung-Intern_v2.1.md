# P_036 — DNA-Auswertung Intern

**Version:** v2.1 | **Erstellt:** 24.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** Hermes (A01) + GF | Prüfung: A05_QM
**Trigger:** dna-analyse_FINAL.md freigegeben (nach P_032)
**🔴 VERTRAULICH — nur GF**

---

## ZIEL

**Interne Auswertung:** M × E Scores berechnen, Ursachen-Analyse durchführen (K1–K6), Schwachstellen identifizieren. Detaillierte Analyse OHNE Kundenfilter — ehrliche Einschätzung.

---

## ABLAUF

```
P_035 (dna-analyse FINAL) freigegeben
  ↓
Hermes liest alle E-Werte aus dna-analyse aus
  ↓
Hermes berechnet je Prüfpunkt: E × M = Score
  ↓
Hermes analysiert je Strang: Wo sind die größten Defizite?
  ↓
Hermes ordnet jeden Defizit einer oder mehreren Ursachen zu (K1–K6):
  K1 = Fehlende Markenidentität
  K2 = Keine digitale Präsenz
  K3 = Inkonsistente Kommunikation
  K4 = Fehlende Prozesse / Standards
  K5 = Ressourcen / Budget
  K6 = Bewusstsein / Wissen fehlt
  ↓
Detaillierte interne Auswertung wird erstellt
→ Arbeitsversion in 03_OUTPUT/01_In_Arbeit/
  ↓
GF liest & entscheidet: Welche Ursachen sind strategisch relevant?
  ↓
A05_QM prüft Logik & Vollständigkeit
→ 03_OUTPUT/02_Zur_Freigabe/
  ↓
GF gibt intern frei (kein Kunde sieht diese Datei)
→ 03_OUTPUT/03_Freigegeben/
→ Kopie nach 05_UNTERNEHMEN/09_Kunden/KD_[Nr]/08_Roadmap/
→ Original → 03_OUTPUT/05_Archiv/
  ↓
P_037 (DNA-Endergebnis für Kunde) kann vorbereitet werden
```

---

## OUTPUT-WORKFLOW (03_OUTPUT)

```
03_OUTPUT/01_In_Arbeit/
    dna-auswertung-intern_[Datum]_[Kundenname].md      ← Hermes erstellt

03_OUTPUT/02_Zur_Freigabe/
    dna-auswertung-intern_[Datum]_[Kundenname].md      ← A05_QM geprüft

03_OUTPUT/03_Freigegeben/
    dna-auswertung-intern_[Datum]_[Kundenname].md      ← GF freigegeben
    🔴 VERTRAULICH — Zugriff nur GF

→ Kopie nach:
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/08_Roadmap/
    dna-auswertung-intern_[Datum]_[Kundenname].md

03_OUTPUT/05_Archiv/
    dna-auswertung-intern_[Datum]_[Kundenname].md      ← Original archiviert
```

**Hinweis Vertraulichkeit:** Die Datei durchläuft denselben 03_OUTPUT-Workflow
wie alle anderen Deliverables — aber sie wird NIEMALS an den Kunden weitergegeben.
Der VERTRAULICH-Vermerk muss in jeder Kopie erhalten bleiben.

---

## ABLAGESTRUKTUR

```
03_OUTPUT/03_Freigegeben/KD_[Nr]_[Name]/
    dna-auswertung-intern_[Datum]_[Kundenname].md      🔴 VERTRAULICH

05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
└── 08_Roadmap/
    ├── dna-analyse_[Datum]_[Kundenname]_FINAL.md      (P_035)
    ├── dna-auswertung-intern_[Datum]_[Kundenname].md  (P_036 🔴)
    └── dna-endergebnis_[Datum]_[Kundenname]_FINAL.md  (P_037 — nach P_037)
```

---

## VORLAGE

**Vorlagendatei:** `05_UNTERNEHMEN/06_Vorlagen/dna-auswertung-intern_VORLAGE.md`

---

## AUSWERTUNGS-LOGIK

### Schritt 1: Score-Berechnung (automatisch)

```
Für jeden Prüfpunkt aus dna-analyse:
Score = E (aus dna-analyse) × M (Vorlage)

Beispiel:
Prüfpunkt 1.1.1 "Außenansicht Geschäft"
→ M = 4 (wichtig, nicht Fundament)
→ E = 2 (Kunde hat: unsaubere Fassade, fehlende Werbeschild)
→ Score = 2 × 4 = 8 / 20 (40%)

Alle Scores sammeln → Strang-Summen berechnen
```

### Schritt 2: Strang-Analyse (deskriptiv)

```
Strang 1: Mystery Shopping — Score ___ / 530 = ___%
  Stärkste Punkte: Wo ist der Kunde gut?
  Schwächste Punkte: Wo sind die Defizite?
  Ursachen: K1–K6, je Defizit zuordnen

Strang 2: Digital Audit — Score ___ / 400 = ___%
  (analog)

Strang 3: Unternehmens-DNA — Score ___ / 355 = ___%
  (analog, inkl. SWOT/Benchmarks/Gap-Analyse als Inputs)

GESAMT-SCORE: ___ / 1.285 = ___%
```

### Schritt 3: Ursachen-Clustering (K1–K6)

```
Ursache K1 — Fehlende Markenidentität
  Nennungen in dna-analyse: 3 (Punkte 1.3.3, 2.4.1, 2.4.2)
  Auswirkung: Kunde ist visuell nicht konsistent erkennbar
  Priorität: 🔴 HOCH

Ursache K2 — Keine digitale Präsenz
  Nennungen: 5 (Website veraltet, kein Instagram, Google Score 2.1)
  Auswirkung: Kunde ist online unsichtbar
  Priorität: 🔴 HOCH

(weiter für K3–K6)
```

### Schritt 4: Hypothesen-Formation (nur intern)

```
GF schreibt nicht-zensierte Hypothesen auf:

"Dieser Kunde hat POTENZIAL aber KEINE KULTUR für Veränderung.
Inhaber ist zu alt, will nicht investieren. Chancen: 30%"

oder

"Bestes-Fall-Szenario: Mit 3 Monaten Intensivarbeit wird dieser
Kunde zur Benchmark-Referenz. Risiko: Budget-Druck nach Monat 2"

Diese Hypothesen fließen NICHT in den Kundenbericht ein (P_037),
sondern in die interne Roadmap-Priorisierung.
```

---

## AUSWERTUNGS-TEMPLATE

**Dateiname:** `dna-auswertung-intern_[Datum]_[Kundenname].md`

```markdown
# 🧬 DNA-AUSWERTUNG INTERN — [Kundenname]
**Datum:** [TT.MM.JJJJ]
**Analyst:** Hermes (A01) + GF
**🔴 VERTRAULICH — nur GF**

---

## QUELLEN

Grundlage: dna-analyse_[Datum]_[Kundenname]_FINAL.md
Methodik: M × E Scores, Ursachen-Clustering K1–K6

---

## SCORE-BERECHNUNG JE STRANG

| Strang | Max. | IST | % | Einordnung |
|--------|:----:|:---:|:-:|-----------|
| 1 — Mystery Shopping | 530 | | | |
| 2 — Digital Audit | 400 | | | |
| 3 — Unternehmens-DNA | 355 | | | |
| **GESAMT** | **1.285** | | | |

### Einordnung GESAMT
🟢 80–100% = Starke DNA → Verteidigen & ausbauen
🟡 60–79% = Solide DNA → Schwachstellen gezielt stärken
🟠 40–59% = Schwache DNA → Fundamentale Arbeit nötig
🔴 0–39% = Keine DNA → Komplette Neuausrichtung

---

## STRANG-BY-STRANG ANALYSE

### Strang 1: Mystery Shopping (___ / 530 = __%)

**Stärkste Punkte:**
→ Punkt [X.X.X]: [Beschreibung warum gut]

**Schwächste Punkte:**
→ Punkt [X.X.X]: [Beschreibung warum schlecht]

**Haupt-Ursache:** K[X] — [Ursache]
**Sekundäre Ursachen:** K[Y], K[Z]

**GF-Notiz (intern, nicht für Kunde):**
→ [Honeste Beobachtung]

---

### Strang 2: Digital Audit (___ / 400 = __%)
[analog]

### Strang 3: Unternehmens-DNA (___ / 355 = __%)
[analog, inkl. SWOT/Benchmarks/Gap-Analyse als Inputs]

---

## URSACHEN-GESAMTÜBERSICHT

| Ursache | Nennungen | Auswirkung | Priorität |
|---------|:---------:|-----------|:---------:|
| K1 — Fehlende Markenidentität | [N] | [kurz] | 🔴 |
| K2 — Keine digitale Präsenz | [N] | [kurz] | 🔴 |
| K3 — Inkonsistente Kommunikation | [N] | [kurz] | 🟠 |
| K4 — Fehlende Prozesse | [N] | [kurz] | 🟠 |
| K5 — Ressourcen / Budget | [N] | [kurz] | 🟡 |
| K6 — Bewusstsein / Wissen | [N] | [kurz] | 🟡 |

**KERNBEFUND:**
Hauptursache = K[X] — [Beschreibung] ([N] Nennungen)
Zweitursache = K[Y] — [Beschreibung] ([N] Nennungen)

→ Lösungsreihenfolge: K[X] zuerst, dann K[Y]

---

## DNA-DIAGNOSE

**Gesamt-Ergebnis:** ___ / 1.285 = __% → **[Einordnung]**

### Interne Interpretation (nicht für Kunde)

STÄRKEN NUTZEN:
→ Wo ist dieser Kunde gut? (für Referenzen / Best-Practice)

SCHWÄCHEN ADRESSIEREN:
→ Was muss ZUERST gemacht werden?

RISIKO-ASSESSMENT:
→ Wird dieser Kunde bei schwieriger Umsetzung abspringen?
→ Ist genug Budget da? (Check K5)
→ Ist Inhaber kognitiv offen? (Check K6)

CHANCEN:
→ Referenz-Potenzial: 🔴 Hoch / 🟠 Mittel / 🟡 Niedrig

---

## LÖSUNGS-REIHENFOLGE (für P_037 Matrix1)

Phase 1 Priorität (Monat 1–3):
1. K[X] — [Beschreibung] — muss ZUERST gelöst werden
   Grund: [...]
   Dauer: [Wochen]
   Budget: [Euro]

Phase 2 Priorität (Monat 4–6):
2. K[Z] — [...]

---

## OFFENE FRAGEN FÜR GF-ENTSCHEIDUNG

Frage 1: [...]
  GF-Antwort: [ ]

---

*dna-auswertung-intern_[Datum]_[Kundenname].md | v1.0*
*🔴 VERTRAULICH — diese Datei wird NIEMALS an Kunden gegeben*
*Q7-System v22.0 | [Datum]*
```

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Score-Berechnung & Ursachen-Clustering | Hermes (A01) |
| Hypothesen-Formation | GF |
| Qualitätsprüfung Logik | A05_QM |
| Freigabe | GF |
| Archivierung & Ablage | Hermes (A01) |

---

## QUALITÄTS-REGELN

```
⚠️  Output-Workflow 03_OUTPUT vollständig durchlaufen — kein Shortcut
⚠️  VERTRAULICH-Vermerk in jeder Kopie erhalten
⚠️  Datei wird NIEMALS an Kunden weitergegeben
⚠️  Scores aus dna-analyse_FINAL.md — keine nachträgliche Korrektur
⚠️  Bestes verfügbares Claude-Modell
```

---

## OUTPUT

```
📄 dna-auswertung-intern_[Datum]_[Kundenname].md → freigegeben
→ 03_OUTPUT/03_Freigegeben/ + 08_Roadmap/ + 05_Archiv/
→ P_037 DNA-Endergebnis kann starten
```

---

*P_036_A01_DNA-Auswertung-Intern_v2.1.md | Q7-System v22.0 | 28.06.2026*
*v2.1: BUG-13/14 behoben — Score-Tabelle & Strang-Analyse 5→3 Stränge korrigiert*
*v2.0: OUTPUT-Workflow (03_OUTPUT) und Ablagestruktur-Abschnitt ergänzt*
*Dateiname korrigiert: Konvention P_[ID]_[AGENT]_[NAME]_v[X].md*
