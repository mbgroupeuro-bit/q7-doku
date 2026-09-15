# P_019_A01_Mystery-Shopping-Physisch_v3.0.md

**Prozess-ID:** P_019 | **Version:** v3.0 | **Erstellt:** 19.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** GF + Team (Menschen) | Koordination: A01a (Hermes)
**Trigger:** P_018 DNA-Gate abgeschlossen & GF-Gate freigegeben

---

## ZIEL

Physische Erfahrung aus Kundenperspektive sammeln — Filiale(n) und Wettbewerb direkt vor Ort testen und objektiv dokumentieren. Ergebnis bildet die Grundlage fuer SWOT und Gap-Analyse.

---

## ABLAUF

```
P_018 freigegeben (GF-Gate ✅)
  → A01a (Hermes) liest Anzahl Standorte aus stammdaten.md
  → A01a erstellt flexiblen Testplan basierend auf Standortanzahl
  → GF bestaetigt Tester & Termine
  → Tester gehen vor Ort (anonym)
  → Bewertungsbogen je Tester ausfuellen
  → A01a konsolidiert alle Berichte
  → Konsolidierter Report freigegeben
  → P_021 bis P_023 (Digital Audit) starten
```

---

## TESTPLAN — FLEXIBEL (v3.0)

A01a (Hermes) generiert den Testplan automatisch basierend auf:
```
→ Anzahl Standorte Kunde (aus stammdaten.md)
→ Anzahl bekannter Wettbewerber (aus P_016)
```

### Variante A — 1 Standort Kunde
```
Tag 1 Mittag     → Standort Kunde besuchen
Tag 1 Nachmittag → Wettbewerber 1 besuchen
Tag 2 (optional) → Wettbewerber 2 besuchen
```

### Variante B — 2 Standorte Kunde
```
Tag 1 Mittag     → Standort 1 Kunde besuchen
Tag 1 Nachmittag → Wettbewerber 1 besuchen
Tag 2 Mittag     → Standort 2 Kunde besuchen
Tag 2 Nachmittag → Wettbewerber 2 besuchen (optional)
```

### Variante C — 3+ Standorte Kunde
```
→ A01a schlaegt Reihenfolge vor
→ GF entscheidet welche Standorte prioritaer getestet werden
→ Nicht alle Standorte muessen getestet werden — GF entscheidet
```

**Regel:** Kein Tag 2 wenn Kunde nur 1 Standort hat.
Tag 2 entfaellt ersatzlos — wird nicht als Luecke markiert.

---

## FALLBACK: NUR 1 TESTER VERFUEGBAR

```
Standard verlangt mindestens 2 Tester pro Filiale. Ist nur 1 Tester
verfuegbar (z. B. GF selbst):

→ Durchfuehrung mit 1 Tester ist ZULAESSIG, aber:
  1. Status wird explizit als "Teilreport — 1 Tester statt >=2"
     gekennzeichnet
  2. Freitext-Eindruck ist akzeptabel, ersetzt aber nicht das
     1–5-Bewertungsraster — beides sollte parallel erfasst werden
  3. GF entscheidet explizit: Nachbesserung mit 2. Tester gewuenscht,
     oder aktueller Stand wird als final akzeptiert
  4. A05a (QM-Leiter) markiert diesen Fall als "🟠 BEDINGT
     VOLLSTAENDIG", nicht als "✅ FREIGEGEBEN"
```

---

## BEWERTUNGSBOGEN JE TESTER

**Dateiname:** `MS_[Datum]_[Filiale-oder-Wettbewerb]_[Tester-Kuerzel].md`

### Bewertung (1–5)

| Kategorie | Bewertung 1–5 | Kommentar |
|-----------|:------------:|-----------|
| Erster Eindruck | | |
| Sauberkeit & Ambiente | | |
| Freundlichkeit Personal | | |
| Wartezeit & Service | | |
| Produktqualitaet | | |
| Preis-Leistung | | |
| Gesamterlebnis | | |

### Freitext

```
✅ Was hat gefallen?
→

❌ Was hat nicht gefallen?
→

💡 Besondere Auffaelligkeiten?
→

🔍 Direktvergleich zum Wettbewerb?
→
```

---

## KONSOLIDIERTER REPORT

**Erstellt durch:** A01a (Hermes)
**Dateiname:** `MS_KONSOLIDIERT_[Datum]_[Kundenname].md`

**Inhalt:**
- Durchschnittsbewertung je Kategorie (alle Tester)
- Hauptthemen die sich wiederholen
- Kritische Punkte markiert
- Direktvergleich: Standorte Kunde / Wettbewerb

---

## ABLAGESTRUKTUR

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
├── MS_[Datum]_Standort1_[Tester].md
├── MS_[Datum]_Standort2_[Tester].md (falls Variante B/C)
├── MS_[Datum]_Wettbewerb1_[Tester].md
├── MS_[Datum]_Wettbewerb2_[Tester].md (optional)
├── MS_SINNE_[Datum]_[Kundenname]_[Tester].md (P_020)
└── MS_KONSOLIDIERT_[Datum]_[Kundenname].md
```

> Flache Struktur gemaess Teil C — keine Unterordner in KD_[Nr]_[Name]/

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Testplan flexibel erstellen | A01a (Hermes) |
| Tests durchfuehren | GF + Team (Menschen) |
| Bewertungsbogen ausfuellen | Jeder Tester selbst |
| Sinneseindrücke erfassen | Tester (→ P_020) |
| Konsolidierung | A01a (Hermes) |
| Freigabe → P_021–P_023 | GF |

---

## QUALITAETS-REGELN

```
⚠️  Kein Tester darf sich als Q7-Mitarbeiter zu erkennen geben
⚠️  Mindestens 2 Tester pro Standort (Fallback siehe oben)
⚠️  Wettbewerb immer am gleichen Tag testen (frischer Direktvergleich)
⚠️  Bewertungsbogen max. 2h nach Besuch ausfuellen
⚠️  Testplan immer aus stammdaten.md ableiten
```

---

## OUTPUT

```
📄 MS_KONSOLIDIERT_[Datum]_[Kundenname].md → freigegeben
→ GF Freigabe → P_021–P_023 (Digital Audit) starten
```

---

## AENDERUNGSHISTORIE

| Version | Datum | Aenderung | Verantwortlich |
|---------|-------|-----------|----------------|
| v1.0 | 19.06.2026 | Erstellung | A01a (Hermes) |
| v2.0 | 19.06.2026 | Mehrere Korrekturen | A01a (Hermes) |
| v3.0 | 20.06.2026 | Flexibler Testplan (BUG_003 behoben) | A01a (Hermes) |
| v3.1 | 28.06.2026 | Dateiname konformiert (P_019), H-00 → A01a, Ablagestruktur auf flach korrigiert (kein 01_Mystery_Shopping/ Unterordner), Folgeprozesse auf P_020–P_023 aktualisiert | A09a (Doku-Leiter) |

---

*P_019_A01_Mystery-Shopping-Physisch_v3.1.md | Q7-System v23.5 | 28.06.2026*
