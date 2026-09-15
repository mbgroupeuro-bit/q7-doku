# P_029_A12_Branchen-Benchmarks_v3.1.md

**Prozess-ID:** P_029 | **Version:** v3.1 | **Erstellt:** 19.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** A12a (Zukunftsforschung-Leiter) + A08a (Finanz-Leiter) | Koordination: A01a (Hermes)
**Trigger:** SWOT-Analyse (P_028) abgeschlossen & freigegeben UND GF hat Scope A bestaetigt
**Gilt nur fuer:** Scope A (Vollstaendig) — bei Scope B/C entfaellt dieser Prozess vollstaendig

---

## ZIEL

Branchendurchschnittswerte ermitteln und den Kunden daran messen. Objektive Zahlen liefern — keine Schaetzungen. Grundlage fuer Gap-Analyse und SOLL-Zustand.

**Nur relevant bei Scope A (Vollstaendig).** Bei Scope B/C: direkt zu Gap-Analyse (P_030).

---

## SCOPE-VORENTSCHEIDUNG (Pflichthinweis)

```
P_029 startet direkt nach SWOT-Analyse (P_028) — VOR der formalen
Scope-Festlegung.

Damit kein Leerlauf entsteht, gilt:
→ GF bestaetigt Scope A vorab (muendlich oder via stammdaten.md /
  Auftragsformular Abschnitt 4)
→ A01a (Hermes) dokumentiert diese Vorab-Bestaetigung im
  BENCH-Report-Header
→ Falls GF Scope bei der formalen Scope-Festlegung auf B/C aendert:
  → P_029 Report wird archiviert, nicht geloescht
  → A01a vermerkt: "Scope-Aenderung nach Scope-Festlegung — P_029
    nicht in Gap-Analyse (P_030) eingeflossen"
```

---

## ABLAUF

```
SWOT-Analyse (P_028) freigegeben & Scope A vorab bestaetigt
  → A01a (Hermes) weist Auftrag an A12a + A08a
  → GF liefert interne Kundenzahlen (via Gespraech oder Dokument)
  → A12a recherchiert Branchenwerte
  → A08a strukturiert Finanz-Benchmarks
  → Vergleichstabelle wird erstellt
  → A01a konsolidiert
  → GF Freigabe → Gap-Analyse (P_030) startet
```

---

## BENCHMARK-BEREICHE

### 1. Finanzkennzahlen
```
- Umsatz pro m² (Branchendurchschnitt)
- Wareneinsatzquote (%)
- Personalkosten (% vom Umsatz)
- Mietkosten (% vom Umsatz)
- EBITDA-Marge (%)
- Gewinnmarge (%)
```

### 2. Betriebskennzahlen
```
- Durchschnittlicher Bon-Wert
- Kundenzahl pro Tag (je Filiale)
- Oeffnungsstunden Branchendurchschnitt
- Mitarbeiter pro Filiale
- Umsatz pro Mitarbeiter
```

### 2a. Infrastruktur-Kennzahlen
```
- Showroom-/Verkaufsflaeche (m²)
- Eigene Logistik vorhanden? (Fuhrpark fuer Aufmass/Transport/Lieferung)
- Lage-Qualitaet (subjektiv: Premium-Lage / Standard-Lage / Nebenlage)

Hinweis: Diese Kennzahlen entstehen typischerweise aus Mystery Shopping
(eigene UND Wettbewerber-Besuche), nicht aus externer Recherche. Werden
hier nur dokumentiert, nicht neu erhoben.
```

### 3. Digitale Kennzahlen
```
- Durchschnittliche Google-Bewertung (Branche)
- Anzahl Bewertungen (Benchmark)
- Social-Media-Engagement-Rate (Branche)
- Website-Traffic-Benchmark
```

### 4. Markt & Positionierung
```
- Marktgroesse (lokal/regional)
- Marktwachstum (%)
- Marktanteil Kunde (geschaetzt)
- Preispositionierung (guenstig / mittel / premium)
```

---

## VERGLEICHSTABELLE (Pflichtformat)

| KPI | Branche Ø | Wettbewerber Ø | Kunde IST | Delta |
|-----|:---------:|:--------------:|:---------:|:-----:|
| Wareneinsatzquote | % | % | % | +/- |
| Personalkosten | % | % | % | +/- |
| Gewinnmarge | % | % | % | +/- |
| Google Score | | | | +/- |
| Bon-Wert Ø | € | € | € | +/- |
| Umsatz/m² | € | € | € | +/- |
| Showroom-Flaeche (m²) | | | | +/- |
| Eigene Logistik (Ja/Nein) | | | | +/- |

**Delta-Logik:**
```
🟢 Gruen = Kunde ueber Branchendurchschnitt
🟡 Gelb  = Kunde im Branchendurchschnitt (±5%)
🔴 Rot   = Kunde unter Branchendurchschnitt
```

---

## DATENQUELLEN

```
Intern (vom Kunden via GF):
→ Umsatzzahlen
→ Kostenstruktur
→ Mitarbeiteranzahl
→ Flaechenangaben

Extern (A12a recherchiert):
→ Branchenverbaende & Statistiken
→ Marktforschungsberichte
→ Oeffentliche Unternehmensberichte Wettbewerb
→ Fachmedien & Studien
```

---

## ABLAGESTRUKTUR

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
├── BENCH_[Datum]_[Kundenname]_Finanzen.md
├── BENCH_[Datum]_[Kundenname]_Betrieb.md
├── BENCH_[Datum]_[Kundenname]_Digital.md
├── BENCH_[Datum]_[Kundenname]_Markt.md
└── BENCH_KONSOLIDIERT_[Datum]_[Kundenname].md
```

> Flache Struktur gemaess Teil C — keine Unterordner in KD_[Nr]_[Name]/

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Scope A Vorab-Bestaetigung | GF |
| Branchenrecherche | A12a (Zukunftsforschung-Leiter) |
| Finanz-Benchmarks | A08a (Finanz-Leiter) |
| Kundenzahlen einholen | GF |
| Vergleichstabelle | A08a |
| Konsolidierung | A01a (Hermes) |
| Freigabe → P_030 | GF |

---

## QUALITAETS-REGELN

```
⚠️  Nur starten wenn Scope A vorab durch GF bestaetigt
⚠️  Vorab-Bestaetigung im BENCH-Report-Header dokumentieren
⚠️  Bei nachtraeglicher Scope-Aenderung: Report archivieren + Vermerk
⚠️  Nur belegte Branchenwerte — keine Schaetzungen ohne Quelle
⚠️  Jede Zahl mit Quelle & Datum versehen
⚠️  Kundenzahlen strikt in 04_TRESOR — nicht im Report im Klartext
```

---

## OUTPUT

```
📄 BENCH_KONSOLIDIERT_[Datum]_[Kundenname].md → freigegeben
→ GF Freigabe → Gap-Analyse (P_030) startet
```

---

## AENDERUNGSHISTORIE

| Version | Datum | Aenderung | Verantwortlich |
|---------|-------|-----------|----------------|
| v3.0 | 19.06.2026 | Trigger geaendert auf Scope-Abhaengigkeit (Fix NEU-1) | A12a (Zukunftsforschung-Leiter) |
| v3.1 | 28.06.2026 | BUG-06 behoben — Trigger korrigiert: startet nach SWOT-Analyse, nicht nach Scope-Festlegung | A09a (Doku-Leiter) |
| v3.1 (Migration) | 28.06.2026 | ID-Migration P_016.5 → P_029, Dateiname konformiert, A[NR]a-Schema, ae/oe/ue/ss, Verweise auf P_028/P_030 aktualisiert | A09a (Doku-Leiter) |

---

*P_029_A12_Branchen-Benchmarks_v3.1.md | Q7-System v23.5 | 28.06.2026*
