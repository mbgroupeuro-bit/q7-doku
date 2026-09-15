# P_030_A01_Gap-Analyse-IST-Zustand_v1.1.md

**Prozess-ID:** P_030 | **Version:** v1.1 | **Erstellt:** 19.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** A01a (Hermes) + A05a (QM-Leiter)
**Trigger:** Scope-abhaengig (siehe unten)

---

## ZIEL

Alle bisherigen Erkenntnisse zusammenfuehren und den vollstaendigen IST-Zustand des Kunden dokumentieren. Luecken (Gaps) zwischen aktuellem Stand und Branche/Wettbewerb klar benennen. Abschluss der Analysephase.

---

## TRIGGER & INPUT (SCOPE-ABHAENGIG)

```
⚠️  Branchen-Benchmarks (P_029) entfaellt bei Scope B/C.
    Der Trigger und die Inputs passen sich automatisch an die
    gewaehlte Scope-Variante an.

SCOPE A (Vollstaendig):
→ Trigger: Branchen-Benchmarks (P_029) abgeschlossen & freigegeben
→ Input: Mystery Shopping + Digital-Audit (P_024) + SWOT (P_028) + P_029

SCOPE B (Markenidentitaet + Digital) & SCOPE C (Nur Digital):
→ Trigger: SWOT-Analyse (P_028) abgeschlossen & freigegeben
→ Input: Mystery Shopping + Digital-Audit (P_024) + SWOT (P_028)
→ Hinweis: P_029 entfaellt ersatzlos. Finanzielle Gaps werden
           nicht analysiert.
```

---

## ABLAUF

```
Trigger erfuellt (je nach Scope)
  → A01a (Hermes) zieht alle verfuegbaren Reports zusammen (Mystery
    Shopping, Digital-Audit P_024, SWOT P_028, bei Scope A zusaetzlich
    Branchen-Benchmarks P_029)
  → Scope-abhaengige Gap-Analyse wird erstellt
  → A05a (QM-Leiter) prueft Vollstaendigkeit & Qualitaet
  → IST-Zustand Gesamtdokument fertiggestellt
  → GF Freigabe → Kundengespraech startet
```

---

## GAP-ANALYSE STRUKTUR

**1. Physischer Gap (aus Mystery Shopping)**
```
Wo steht der Kunde physisch vs. Wettbewerb?
→ Service-Gap
→ Produkt-Gap
→ Ambiente-Gap
→ Preis-Leistungs-Gap
```

**2. Digitaler Gap (aus Digital-Audit, P_024)**
```
Wo steht der Kunde digital vs. Wettbewerb?
→ Website-Gap
→ Social-Media-Gap
→ Sichtbarkeits-Gap (Google, Bewertungen)
→ Markenidentitaets-Gap
```

**3. Finanzieller Gap (aus Branchen-Benchmarks, P_029) — NUR SCOPE A!**
```
⚠️  Bei Scope B/C: Dieser Bereich entfaellt ersatzlos.
Wo steht der Kunde finanziell vs. Branche?
→ Margen-Gap
→ Kosten-Gap
→ Umsatz-Gap
→ Effizienz-Gap
```

**4. Positionierungs-Gap (aus SWOT, P_028)**
```
Wo steht der Kunde strategisch?
→ Differenzierung vorhanden / fehlend
→ Zielgruppe klar / unklar
→ Markenidentitaet vorhanden / fehlend
→ USP definiert / nicht definiert
```

---

## GAP-TABELLE (Pflichtformat)

| Bereich | IST-Zustand | Branche/Wettbewerb | Gap | Prioritaet |
|---------|:-----------:|:-----------------:|:---:|:---------:|
| Website | ⭐⭐ | ⭐⭐⭐⭐ | -2 | 🔴 Hoch |
| Social Media | ⭐⭐⭐ | ⭐⭐⭐⭐ | -1 | 🟠 Mittel |
| Gewinnmarge (nur Scope A) | 8% | 14% | -6% | 🔴 Hoch |
| Markenidentitaet | Fehlend | Vorhanden | Kritisch | 🔴 Hoch |
| Google Score | 3.8 | 4.4 | -0.6 | 🟠 Mittel |
| Service | ⭐⭐⭐⭐ | ⭐⭐⭐ | +1 | 🟢 Staerke |

**Prioritaets-Logik:**
```
🔴 Hoch    = Sofortiger Handlungsbedarf
🟠 Mittel  = Mittelfristiger Handlungsbedarf
🟡 Niedrig = Langfristige Optimierung
🟢 Staerke = Ausbauen & kommunizieren
```

---

## IST-ZUSTAND GESAMTDOKUMENT

**Dateiname:** `IST_[Datum]_[Kundenname]_Gesamtbericht.md`

**Struktur (Scope A):**
```
1. Executive Summary (1 Seite)
2. Mystery Shopping Ergebnisse (Zusammenfassung)
3. Digital-Audit Ergebnisse (Zusammenfassung)
4. SWOT (vollstaendig)
5. Branchen-Benchmarks (Vergleichstabelle)
6. Gap-Analyse (vollstaendige Tabelle inkl. Finanzieller Gap)
7. Top 5 kritischste Gaps (priorisiert)
8. Top 3 groesste Staerken (ausbauen)
```

**Struktur (Scope B/C):**
```
1. Executive Summary (1 Seite)
2. Mystery Shopping Ergebnisse (Zusammenfassung, bei Scope C optional)
3. Digital-Audit Ergebnisse (Zusammenfassung)
4. SWOT (vollstaendig)
5. Gap-Analyse (Tabelle ohne Finanzieller Gap)
6. Top 5 kritischste Gaps (priorisiert)
7. Top 3 groesste Staerken (ausbauen)
```

---

## ABLAGESTRUKTUR

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
├── GAP_[Datum]_[Kundenname].md
└── IST_[Datum]_[Kundenname]_Gesamtbericht.md
```

> Flache Struktur gemaess Teil C — keine Unterordner in KD_[Nr]_[Name]/

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Gap-Analyse erstellen (scope-abhaengig) | A01a (Hermes) |
| Qualitaetspruefung | A05a (QM-Leiter) |
| IST-Gesamtbericht | A01a (Hermes) |
| Freigabe → Kundengespraech | GF |

---

## QUALITAETS-REGELN

```
⚠️  IST-Zustand ist vollstaendig wenn ALLE scope-relevanten Gap-Bereiche abgedeckt
⚠️  Executive Summary max. 1 Seite — praezise & klar
⚠️  Jeder Gap mit konkreter Zahl oder Bewertung belegt
⚠️  Keine Loesungsvorschlaege hier — nur IST dokumentieren
⚠️  Bei Scope B/C: Finanzieller Gap darf NICHT als "fehlend" markiert werden,
    sondern muss komplett aus der Analyse entfallen (bewusste Auslassung)
```

---

## OUTPUT

```
📄 IST_[Datum]_[Kundenname]_Gesamtbericht.md → freigegeben
→ IST-ZUSTAND vollstaendig dokumentiert
→ GF Freigabe → Kundengespraech startet
```

---

## AENDERUNGSHISTORIE

| Version | Datum | Aenderung | Verantwortlich |
|---------|-------|-----------|----------------|
| v1.0 | 19.06.2026 | Erstellung als P_016.6 | A01a (Hermes) |
| v1.1 | 28.06.2026 | BUG-07 behoben — Footer-Versionsnummer korrigiert; Scope-abhaengiger Trigger & Input ergaenzt | A09a (Doku-Leiter) |
| v1.1 (Migration) | 28.06.2026 | ID-Migration P_016.6 → P_030, Dateiname konformiert, A[NR]a-Schema, ae/oe/ue/ss, Verweise auf P_024/P_028/P_029 aktualisiert | A09a (Doku-Leiter) |

---

*P_030_A01_Gap-Analyse-IST-Zustand_v1.1.md | Q7-System v23.5 | 28.06.2026*
