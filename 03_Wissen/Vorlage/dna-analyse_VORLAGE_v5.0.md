# 🧬 UNTERNEHMENS-DNA ANALYSE — Q7
**Kunde:** _________________________________
**Wettbewerber:** _________________________________
**Analyst:** Hermes (A01a) + GF
**Datum:** _________________________________

---

## BEWERTUNGSLOGIK

| | Beschreibung |
|---|---|
| **M = Multiplikator** | Strategische Relevanz — fest vorgegeben, nicht änderbar |
| **E = Erfüllungsgrad** | Ist-Zustand heute — wird je Kunde eingetragen |
| **E × M = Score** | Gesamtpunkte je Prüfpunkt |

**Multiplikator (M) — fix:**
- 1 = Nice-to-have
- 3 = Wichtig, kein strategischer Hebel
- 5 = Absolutes Fundament

**Erfüllungsgrad (E) — wird ausgefüllt:**
- 1 = Nicht vorhanden / Chaos
- 3 = Marktstandard / funktioniert
- 5 = Unkopierbares Uhrwerk

**Max. Score je Punkt: 25 (5×5)**

> **Hinweis M-Werte:** M-Werte sind systemweit fix. Abweichung nur durch
> GF-Entscheidung mit Dokumentation: Prüfpunkt, alter M-Wert, neuer M-Wert,
> Begründung — einzutragen in stammdaten.md des Kunden.

---

## KONFIDENZ-LOGIK

Jeder Strang erhält nach der Zwischensumme eine Konfidenz-Zeile:

```
🟢 VOLLSTÄNDIG    = Daten vollständig & nach Standard erhoben
🟡 BEDINGT        = Teilreport (z.B. 1-Tester-Fallback, fehlende Screenshots)
                    → Score gilt, aber mit eingeschränkter Belastbarkeit
🔴 DATENLÜCKE     = Strang nicht oder kaum erhoben
                    → Score wird auf 0 gesetzt, Strang aus Gesamt herausgerechnet
```

**Auswirkung auf Gesamtauswertung:**
- 🟢 VOLLSTÄNDIG → Score zählt normal
- 🟡 BEDINGT → Score zählt, Hinweis in DNA-Diagnose: "Strang X bedingt belastbar"
- 🔴 DATENLÜCKE → Max-Score dieses Strangs wird vom Gesamt-Maximum abgezogen

**Quelle:** Hermes (A01a) trägt Konfidenz je Strang ein — basierend auf dem jeweiligen
Quell-Report (A14-Freigabe-Status, Prüftiefe-Status etc.)

---

## 🧬 STRANG 1 — MYSTERY SHOPPING (P_016)
*Physische Erfahrung aus Kundenperspektive*

### 1.1 Außenauftritt

| Nr. | Prüfpunkt | Fotos | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-----:|:-:|:-------:|:-----------:|---------|
| 1.1.1 | Außenansicht Geschäft / Fassade | 📸 Pflicht | 4 | | | |
| 1.1.2 | Werbeschild / Firmenschild | 📸 Pflicht | 5 | | | |
| 1.1.3 | Schaufenster / Auslagefläche | 📸 Pflicht | 4 | | | |
| 1.1.4 | Reklameständer / Außenwerbung | 📸 falls vorhanden | 3 | | | |
| 1.1.5 | Fahrzeuge / Fuhrpark (Branding) | 📸 falls vorhanden | 2 | | | |

**Zwischensumme 1.1:** ___ / 90 *(Max bei M-Summe 18 × 5)*

---

### 1.2 Innenauftritt & Ambiente

| Nr. | Prüfpunkt | Fotos | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-----:|:-:|:-------:|:-----------:|---------|
| 1.2.1 | Gesamteindruck Innenraum / Filiale | 📸 Pflicht | 5 | | | |
| 1.2.2 | Sauberkeit & Ordnung | 📸 Pflicht | 4 | | | |
| 1.2.3 | Mitarbeiterkleidung / Uniform | 📸 Pflicht | 3 | | | |
| 1.2.4 | Produktpräsentation / Ausstellung | 📸 Pflicht | 5 | | | |
| 1.2.5 | Flyer / Visitenkarten / Drucksachen | 📸 falls vorhanden | 3 | | | |

**Zwischensumme 1.2:** ___ / 100 *(Max bei M-Summe 20 × 5)*

---

### 1.3 Sinneseindrücke (unbewusste Wahrnehmung)

| Nr. | Prüfpunkt | Fotos | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-----:|:-:|:-------:|:-----------:|---------|
| 1.3.1 | Visueller Ersteindruck beim Betreten (Emotion) | — | 5 | | | Angst / Unsicherheit / Anspannung / Wohlgefühl? |
| 1.3.2 | Farbwelt im Geschäft (stimmig, markenkonform) | 📸 Pflicht | 4 | | | |
| 1.3.3 | Geruch (angenehm, neutral, unangenehm) | — | 3 | | | |
| 1.3.4 | Akustik / Geräuschpegel (angenehm, störend) | — | 3 | | | |
| 1.3.5 | Licht (hell/dunkel, warm/kalt, einladend?) | 📸 Pflicht | 4 | | | |
| 1.3.6 | Haptik der Produkte erlebbar (anfassen möglich) | — | 3 | | | |
| 1.3.7 | Überraschungsmoment vorhanden (WOW-Effekt) | 📸 falls vorhanden | 4 | | | |
| 1.3.8 | Gesamter Sinneseindruck (bleibt im Gedächtnis) | — | 5 | | | |

**Zwischensumme 1.3:** ___ / 155 *(Max bei M-Summe 31 × 5)*

---

### 1.4 Service & Beratung

| Nr. | Prüfpunkt | Fotos | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-----:|:-:|:-------:|:-----------:|---------|
| 1.4.1 | Begrüßung & erster Kontakt | — | 5 | | | |
| 1.4.2 | Freundlichkeit des Personals | — | 5 | | | |
| 1.4.3 | Wartezeit & Reaktionsgeschwindigkeit | — | 4 | | | |
| 1.4.4 | Beratungsqualität (Kompetenz, Geduld) | — | 5 | | | |
| 1.4.5 | Verkaufsdruck (positiv / negativ) | — | 3 | | | |

**Zwischensumme 1.4:** ___ / 110 *(Max bei M-Summe 22 × 5)*

---

### 1.5 Produkt & Abschluss

| Nr. | Prüfpunkt | Fotos | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-----:|:-:|:-------:|:-----------:|---------|
| 1.5.1 | Produktqualität (sichtbar / erlebbar) | 📸 Pflicht | 5 | | | |
| 1.5.2 | Preis-Leistungs-Eindruck | — | 4 | | | |
| 1.5.3 | Ablauf Kauf / Beratung / Anfrage | — | 4 | | | |
| 1.5.4 | Was fällt positiv auf? | — | — | | | Freitext — kein Score |
| 1.5.5 | Was fällt negativ auf? | — | — | | | Freitext — kein Score |

**Zwischensumme 1.5:** ___ / 65 *(Max bei M-Summe 13 × 5)*

---

**🧬 STRANG 1 GESAMT:** ___ / 520

**Konfidenz Strang 1:**
```
☐ 🟢 VOLLSTÄNDIG  — ≥2 Tester, vollständiger MS-Report freigegeben
☐ 🟡 BEDINGT      — 1-Tester-Fallback oder Teilreport (vermerken: _______________)
☐ 🔴 DATENLÜCKE   — Mystery Shopping nicht durchgeführt
Quelle: MS_KONSOLIDIERT_[Datum]_[Kundenname].md — Freigabe-Status: ___________
```

---

## 🧬 STRANG 2 — DIGITAL AUDIT (P_016)
*Digitale Sichtbarkeit & Präsenz*

### 2.1 Website

| Nr. | Prüfpunkt | Fotos | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-----:|:-:|:-------:|:-----------:|---------|
| 2.1.1 | Website vorhanden | 📸 Screenshot | 5 | | | |
| 2.1.2 | Mobile Optimierung | 📸 Screenshot | 4 | | | |
| 2.1.3 | Design & UX (Benutzerführung) | 📸 Screenshot | 4 | | | |
| 2.1.4 | Inhalt & Texte (Qualität, Tonalität) | — | 3 | | | |
| 2.1.5 | Call-to-Action (Kontakt, Anfrage) | 📸 Screenshot | 4 | | | |

**Zwischensumme 2.1:** ___ / 100 *(Max bei M-Summe 20 × 5)*

---

### 2.2 Google Business

| Nr. | Prüfpunkt | Fotos | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-----:|:-:|:-------:|:-----------:|---------|
| 2.2.1 | Google Business Profil vorhanden | 📸 Screenshot | 5 | | | |
| 2.2.2 | Bewertungs-Score & Anzahl | 📸 Screenshot | 5 | | | |
| 2.2.3 | Fotos im Profil vorhanden | 📸 Screenshot | 3 | | | |
| 2.2.4 | Öffnungszeiten & Infos vollständig | — | 4 | | | |
| 2.2.5 | Antworten auf Bewertungen | — | 3 | | | |

**Zwischensumme 2.2:** ___ / 100 *(Max bei M-Summe 20 × 5)*

---

### 2.3 Social Media

| Nr. | Prüfpunkt | Fotos | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-----:|:-:|:-------:|:-----------:|---------|
| 2.3.1 | Instagram — Follower & Posts | 📸 Screenshot | 4 | | | |
| 2.3.2 | Facebook — Follower & Aktivität | 📸 Screenshot | 3 | | | |
| 2.3.3 | Content-Qualität (Bild, Text) | 📸 Screenshot | 5 | | | |
| 2.3.4 | Posting-Frequenz & Regelmäßigkeit | — | 4 | | | |
| 2.3.5 | Markenkonsistenz über alle Kanäle | — | 5 | | | |

**Zwischensumme 2.3:** ___ / 105 *(Max bei M-Summe 21 × 5)*

---

### 2.4 Markenidentität Digital

| Nr. | Prüfpunkt | Fotos | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-----:|:-:|:-------:|:-----------:|---------|
| 2.4.1 | Logo vorhanden & konsistent | 📸 Screenshot | 5 | | | |
| 2.4.2 | Farbwelt einheitlich | 📸 Screenshot | 4 | | | |
| 2.4.3 | Tonalität & Sprache konsistent | — | 4 | | | |
| 2.4.4 | Profilbilder vollständig & aktuell | 📸 Screenshot | 3 | | | |
| 2.4.5 | URL / Bio korrekt & professionell | 📸 Screenshot | 3 | | | |

**Zwischensumme 2.4:** ___ / 95 *(Max bei M-Summe 19 × 5)*

---

**🧬 STRANG 2 GESAMT:** ___ / 400

**Konfidenz Strang 2:**
```
☐ 🟢 VOLLSTÄNDIG  — ≥4/6 Bereiche mit Prüftiefe-Standard
☐ 🟡 BEDINGT      — Teilreport <4/6 Bereiche (vermerken: _______________)
☐ 🔴 DATENLÜCKE   — Digital Audit nicht durchgeführt
Quelle: DA_KONSOLIDIERT_[Datum]_[Kundenname].md — Prüftiefe-Status: ___________
```

---

## 🧬 STRANG 3 — SWOT & POSITIONIERUNG (P_016)
*Strategische Stärken, Schwächen, Chancen, Risiken*

| Nr. | Prüfpunkt | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-:|:-------:|:-----------:|---------|
| 3.1 | Klare Spezialisierung / USP definiert | 5 | | | |
| 3.2 | Stärken klar identifiziert & kommuniziert | 4 | | | |
| 3.3 | Schwächen bekannt & adressiert | 3 | | | |
| 3.4 | Marktchancen erkannt & genutzt | 3 | | | |
| 3.5 | Risiken bekannt & abgefedert | 3 | | | |
| 3.6 | Positionierung klar vs. Wettbewerb | 5 | | | |
| 3.7 | Zielgruppe definiert | 4 | | | |
| 3.8 | Preispositionierung bewusst gewählt | 3 | | | |

**🧬 STRANG 3 GESAMT:** ___ / 150 *(Max bei M-Summe 30 × 5)*

**Konfidenz Strang 3:**
```
☐ 🟢 VOLLSTÄNDIG  — SWOT_[Datum].md freigegeben
☐ 🟡 BEDINGT      — SWOT nur teilweise durchgeführt (vermerken: _______________)
☐ 🔴 DATENLÜCKE   — SWOT nicht durchgeführt
Quelle: SWOT_[Datum]_[Kundenname].md — Freigabe-Status: ___________
```

---

## 🧬 STRANG 4 — BRANCHEN-BENCHMARKS (P_016)
*Vergleich mit Branche & Wettbewerb*

> **Hinweis:** Strang 4 nur befüllen bei Scope A. Bei Scope B/C: Konfidenz = 🔴 DATENLÜCKE,
> Max-Score (100) vom Gesamt-Maximum abziehen → Gesamt-Max = 1.175.

| Nr. | Prüfpunkt | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-:|:-------:|:-----------:|---------|
| 4.1 | Google Score vs. Branchendurchschnitt | 5 | | | |
| 4.2 | Social Media Reichweite vs. Wettbewerb | 3 | | | |
| 4.3 | Website-Qualität vs. Wettbewerb | 4 | | | |
| 4.4 | Showroom-Qualität vs. Wettbewerb | 4 | | | |
| 4.5 | Preispositionierung vs. Markt | 4 | | | |

**🧬 STRANG 4 GESAMT:** ___ / 100 *(Max bei M-Summe 20 × 5)*

**Konfidenz Strang 4:**
```
☐ 🟢 VOLLSTÄNDIG  — BENCH_KONSOLIDIERT_[Datum].md freigegeben (Scope A)
☐ 🔴 DATENLÜCKE   — Scope B/C → Strang entfällt, Max-Score herausrechnen
Quelle: BENCH_KONSOLIDIERT_[Datum]_[Kundenname].md — Scope: ___________
```

---

## 🧬 STRANG 5 — GAP-ANALYSE (P_016)
*Lücken zwischen IST und Markt/Wettbewerb*

| Nr. | Prüfpunkt | M | E (1-5) | Score (E×M) | Notizen |
|:---:|-----------|:-:|:-------:|:-----------:|---------|
| 5.1 | Digitaler Gap (Website, Google, Social) | 5 | | | |
| 5.2 | Markenidentitäts-Gap | 5 | | | |
| 5.3 | Positionierungs-Gap | 4 | | | |
| 5.4 | Service-Gap (physisch) | 3 | | | |
| 5.5 | Sichtbarkeits-Gap (lokal) | 4 | | | |

**🧬 STRANG 5 GESAMT:** ___ / 105 *(Max bei M-Summe 21 × 5)*

**Konfidenz Strang 5:**
```
☐ 🟢 VOLLSTÄNDIG  — IST_Gesamtbericht_[Datum].md freigegeben
☐ 🟡 BEDINGT      — Gap-Analyse nur teilweise (vermerken: _______________)
☐ 🔴 DATENLÜCKE   — Gap-Analyse nicht durchgeführt
Quelle: IST_[Datum]_[Kundenname]_Gesamtbericht.md — Freigabe-Status: ___________
```

---

## 📊 GESAMTAUSWERTUNG

**Aktives Gesamt-Maximum (nach Konfidenz-Bereinigung):**
```
Strang 1:  520  ☐ aktiv  ☐ herausgerechnet (🔴)
Strang 2:  400  ☐ aktiv  ☐ herausgerechnet (🔴)
Strang 3:  150  ☐ aktiv  ☐ herausgerechnet (🔴)
Strang 4:  100  ☐ aktiv  ☐ herausgerechnet (🔴 / Scope B/C)
Strang 5:  105  ☐ aktiv  ☐ herausgerechnet (🔴)

AKTIVES MAXIMUM: ___ (Standard: 1.275 bei Scope A / 1.175 bei Scope B/C)
```

| Strang | Bereich | Max. Score | IST Score | % | Konfidenz |
|--------|---------|:----------:|:---------:|:---:|:---------:|
| 1 | Mystery Shopping | 520 | | | 🟢/🟡/🔴 |
| 2 | Digital Audit | 400 | | | 🟢/🟡/🔴 |
| 3 | SWOT & Positionierung | 150 | | | 🟢/🟡/🔴 |
| 4 | Branchen-Benchmarks | 100 | | | 🟢/🔴 |
| 5 | Gap-Analyse | 105 | | | 🟢/🟡/🔴 |
| **GESAMT** | | **___ (aktiv)** | | | |

---

## 🎯 DNA-DIAGNOSE

| Score % | Einordnung | Empfehlung |
|:-------:|-----------|------------|
| 80–100% | 🟢 Starke DNA | Verteidigen & ausbauen |
| 60–79% | 🟡 Solide DNA | Schwachstellen gezielt stärken |
| 40–59% | 🟠 Schwache DNA | Fundamentale Arbeit an 2–3 Strängen |
| 0–39% | 🔴 Keine DNA | Komplette Neuausrichtung nötig |

**Gesamtergebnis:** ___ / ___ (aktiv) = ___%

**Konfidenz-Hinweis (falls 🟡 Stränge vorhanden):**
```
⚠️  Strang [X] ist BEDINGT belastbar: [Grund]
    Interpretation mit entsprechender Vorsicht — ggf. Nacherhebung empfohlen.
```

---

## 🎯 TOP 3 SOFORT-MASSNAHMEN

| Priorität | Maßnahme | Strang | Verantwortlich |
|:---------:|----------|:------:|----------------|
| 1 | | | |
| 2 | | | |
| 3 | | | |

---

## 📝 DNA IN 3 SÄTZEN

1. **Dominantes Gen (USP):** _______________________________________________
2. **Stärkster Replikationsschutz:** _________________________________________
3. **Sichtbarster Phänotyp:** ________________________________________________

---

*dna-analyse_VORLAGE_v5.0.md | Version v5.0 | Q7-System v23.5 | 28.06.2026*
*v5.0: Max-Scores korrigiert (Strang 1: 520, Gesamt Scope A: 1.275, Scope B/C: 1.175). Agent-Kürzel H-00 → A01a. Behebt NEU-10/V-02.*
