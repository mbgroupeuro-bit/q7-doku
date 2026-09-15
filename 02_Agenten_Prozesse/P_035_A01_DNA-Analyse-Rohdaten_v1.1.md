# P_035 — DNA-Analyse Rohdaten

**Version:** v1.1 | **Erstellt:** 24.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** Hermes (A01) + GF | Durchführung: GF + Tester
**Trigger:** P_030 abgeschlossen — läuft parallel zu P_023–P_032

---

## ZIEL

Rohdaten sammeln: Unternehmens-DNA des Kunden und seine Wettbewerber empirisch erfassen. Grundlage für interne Auswertung (P_036) und späteres Kundenreporting (P_037).

**Zeitrahmen:** Startet nach P_030, läuft parallel zu P_023–P_032. Wird erst nach P_032 (SOLL-Zustand-Roadmap) vollständig ausgefüllt.

---

## ABLAUF

```
P_030 abgeschlossen
  ↓
PARALLEL: P_035 DNA-Analyse beginnt (läuft neben P_023–P_032)
  → GF sammelt Rohdaten Kunde (Produkte, Referenzen, Zahlen)
  → GF recherchiert Wettbewerber-Daten (Top 2–3)
  → Hermes koordiniert Datenerfassung
  → dna-analyse_VORLAGE.md wird schrittweise mit Daten befüllt
  ↓
Nach Abschluss P_032 (SOLL-Roadmap):
  → P_036 DNA-Auswertung-Intern kann starten
  → Interne Score-Berechnung (M × E)
  → Ursachen-Analyse (K1–K6)
```

---

## INPUT-QUELLEN (Was wird gesammelt)

**Vom Kunden (GF holt direkt ein):**
```
✓ Produktliste / Leistungsprofil (bei Maßanfertigung: Referenzprojekte)
✓ Produktqualität (Fotos/Videos von best-case & worst-case)
✓ Preisliste (grob, um Positionierung zu ermitteln)
✓ Zielgruppe (Beschreibung)
✓ Umsatzzahlen (optional, aber gewünscht)
✓ Kunden-Feedback (was loben Kunden? Was kritisieren sie?)
✓ Marketing-Budget (grob)
✓ Team-Struktur (Anzahl & Rollen)
```

**Vom Wettbewerb (GF + A12_Zukunftsforschung recherchiert):**
```
✓ Produktliste / Leistungen (Top 2–3 Wettbewerber)
✓ Produktqualität-Eindruck (Fotos/Videos)
✓ Preispositionierung (vergleichbar)
✓ Zielgruppe (explizit oder implizit)
✓ Marketing-Aktivität (Social Media, Werbung, Bewertungen)
✓ Standort-Qualität (Lage, Fläche, Ausstattung)
✓ Online-Präsenz (Website, Google, Instagram etc.)
```

---

## VORLAGE-NUTZUNG

**Vorlagendatei:** `05_UNTERNEHMEN/06_Vorlagen/dna-analyse_VORLAGE.md`

```
Hermes lädt die Vorlage für JEDEN Kunden neu
→ Keine Kopie in KD-Ordner bis fertig
→ Arbeitsversion: direkt in Kunde-Ordner als
  dna-analyse_[Datum]_[Kundenname]_WORK.md
→ Nach Freigabe durch GF:
  dna-analyse_[Datum]_[Kundenname]_FINAL.md
```

---

## BEWERTUNGS-LOGIK (kurz erklärt für GF)

```
M = Multiplikator (systemweit fix, nicht änderbar ohne Dokumentation)
  1 = Nice-to-have (optional, aber nützlich)
  2 = Niedrige Priorität (selten verwendet)
  3 = Wichtig, aber kein strategischer Hebel
  4 = Sehr wichtig, strategisch relevant
  5 = Absolutes Fundament (z.B. Produktqualität, Markenidentität)

E = Erfüllungsgrad (wird für Kunde ausgefüllt)
  1 = Nicht vorhanden / Chaos
  3 = Marktstandard / funktioniert
  5 = Unkopierbares Uhrwerk (Top-Position)

Score = E × M (max. 25 pro Punkt)
```

---

## 3 STRÄNGE — DATEN SAMMELN

```
DNA-System hat 3 Stränge. SWOT, Benchmarks und Gap-Analyse
sind Datenquellen die in Strang 3 einfließen — keine eigenen Stränge.
```

---

### Strang 1: Mystery Shopping (Aus P_019)

**Rohdaten:**
```
→ Fotos: Außenansicht, Innen, Produkte, Ambiente
→ Bewertungen: 1–5 je Kategorie (Service, Produkt, Ambiente)
→ Direkter Vergleich Kunde vs. Wettbewerb
→ Emotionaler Eindruck
→ Sinneseindrücke (aus P_020)
```

**Hermes trägt in DNA-Analyse ein:**
```
→ Durchschnittsbewertungen der Tester
→ Fotos (eingebunden oder Referenzen)
→ Hauptthemen (Was war gut? Was war schlecht?)
→ Max-Score Strang 1: 530 Punkte
```

---

### Strang 2: Digital Audit (Aus P_024)

**Rohdaten:**
```
→ Website-Screenshots (Start, Kontakt, Produkte)
→ Social Media Follower-Zahlen + letzte Posts
→ Google Score + Bewertungsanzahl
→ Domain-Konsistenz (Branding über alle Kanäle)
```

**Hermes trägt in DNA-Analyse ein:**
```
→ Befunde je Kanal (aus Sub-Audits P_021/P_022/P_025/P_026/P_027)
→ Screenshots (embedded oder verlinkt)
→ Vergleich Kunde vs. Wettbewerb
→ Max-Score Strang 2: 400 Punkte
```

---

### Strang 3: Unternehmens-DNA (Strategische Tiefenanalyse)

**Rohdaten aus mehreren Quellen:**
```
Aus P_028 (SWOT):
→ Stärken (S1, S2, S3 — was macht Kunde besser?)
→ Schwächen (W1, W2, W3 — wo hat Kunde Defizite?)
→ Chancen (O1, O2, O3 — Marktpotenzial?)
→ Risiken (T1, T2, T3 — wer ist Bedrohung?)

Aus P_029 (Benchmarks — nur Scope A):
→ Branche-KPIs (Umsatz/m², Marge, Google Score Ø)
→ Wettbewerb-Zahlen (wo stehen sie?)
→ Kunde-Zahlen (IST)
→ Bei Scope B/C: Benchmark-Abschnitt entfällt

Aus P_030 (Gap-Analyse):
→ Offizielle IST-Lücken (physisch, digital, strategisch, finanziell)
→ Priorisierte Gaps
→ Top 5 kritischste Punkte
```

**Hermes trägt in DNA-Analyse ein:**
```
→ SWOT-Stichwortlisten + Relevanz je Punkt (A/C/G/T Basepaar-Metapher)
→ Vergleichstabelle Benchmarks (bei Scope A)
→ Gap-Tabelle (priorisiert)
→ Max-Score Strang 3: 355 Punkte
```

---

## GESAMT-SCORE ÜBERSICHT

| Strang | Beschreibung | Max-Score |
|:------:|-------------|:---------:|
| 1 | Mystery Shopping | 530 |
| 2 | Digital Audit | 400 |
| 3 | Unternehmens-DNA | 355 |
| | **GESAMT** | **1.285** |

---

## ABLAGESTRUKTUR

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
└── 08_Roadmap/
    ├── dna-analyse_[Datum]_[Kundenname]_WORK.md  (während Erfassung)
    ├── dna-analyse_[Datum]_[Kundenname]_FINAL.md  (nach GF-Freigabe)
    ├── dna-auswertung-intern_[Datum]_[Kundenname].md  (P_036 Output)
    └── dna-endergebnis_[Datum]_[Kundenname]_FINAL.md  (P_037 Output)
```

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Kundendaten sammeln | GF (persönlich) |
| Wettbewerb recherchieren | A12_Zukunftsforschung + GF |
| Daten in Vorlage eintragen | Hermes (A01) |
| Fotos/Videos beschaffen | GF oder Tester aus P_019 |
| Qualitätsprüfung | A05_QM |
| GF-Freigabe | GF |

---

## TIMELINE

```
Woche 1–2 (nach P_030 — parallel zu P_023)
  → GF trägt Kundendaten zusammen

Woche 3–4 (parallel zu P_031/P_030b)
  → A12_Zukunftsforschung recherchiert Wettbewerb
  → Hermes füllt dna-analyse_WORK.md

Woche 5 (P_032 SOLL-Zustand freigegeben)
  → GF prüft Vollständigkeit
  → dna-analyse_FINAL.md freigegeben
  → P_036 kann starten
```

---

## QUALITÄTS-REGELN

```
⚠️  Keine Schätzungen ohne Begründung — empirische Daten vorziehen
⚠️  Wettbewerber müssen mit gleicher Tiefe analysiert werden wie Kunde
⚠️  Fotos MÜSSEN vorhanden sein (mindestens Screenshots)
⚠️  Bestes verfügbares Claude-Modell für Recherche & Datenaufbereitung
⚠️  M-Werte sind fix — GF kann sie nur mit schriftlicher Dokumentation ändern
⚠️  DNA hat 3 Stränge — SWOT/Benchmarks/Gap sind Inputs für Strang 3,
    keine eigenen Stränge
```

---

## OUTPUT

```
📄 dna-analyse_[Datum]_[Kundenname]_FINAL.md → freigegeben
→ P_036 DNA-Auswertung-Intern kann starten
```

---

*P_035_A01_DNA-Analyse-Rohdaten_v1.1.md | Q7-System v22.0*
*v1.1: BUG-10/11/12 behoben — Footer v25.0 → v22.0, 3-Strang-Logik korrigiert, Trigger präzisiert*
*Dateiname korrigiert: Konvention P_[ID]_[AGENT]_[NAME]_v[X].md*
