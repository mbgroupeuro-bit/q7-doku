# P_017 — Matrix1 — Maßnahmen & Priorisierungsmatrix

**Version:** v1.0 | **Erstellt:** 22.06.2026
**Verantwortung:** Hermes (H-00) + GF
**Trigger:** P_017.2 (DNA-Auswertung-Intern) abgeschlossen & freigegeben

---

## ZIEL

Alle identifizierten Maßnahmen aus der DNA-Auswertung strukturiert, priorisiert und mit Kosten sowie Hebelwirkung versehen in einer operativen Matrix darstellen.

**Abgrenzung zu P_016.9:**
```
P_016.9 SOLL-Zustand-Roadmap = STRATEGISCH
→ Vision, Zielzustand in 12 Monaten, Meilensteine, KPIs

P_017 Matrix1 = OPERATIV
→ Konkrete Maßnahmen, Kosten, Zeitdauer, Hebelwirkung,
  CI-Abhängigkeit — abgeleitet direkt aus DNA-Befunden (K1–K6)
→ Beantwortet: Was genau, in welcher Reihenfolge, zu welchem Preis?

Beide laufen parallel — Matrix1 setzt die Roadmap operativ um.
```

---

## ABLAUF

```
P_017.2 (DNA-Auswertung-Intern) freigegeben
  → Hermes liest Ursachen K1–K6 + Scores aus DNA-Auswertung
  → Maßnahmen werden je Ursache abgeleitet
  → GF gibt strategischen Input (Reihenfolge, CI-Abhängigkeiten, Ausnahmen)
  → Hermes erstellt Matrix1 nach Vorlage (MATRIX1_VORLAGE.md)
  → Ablage: 03_OUTPUT/01_In_Arbeit/
  → A05_QM prüft Vollständigkeit
  → GF prüft & gibt frei → 03_OUTPUT/03_Freigegeben/
  → Kopie nach 05_UNTERNEHMEN/09_Kunden/KD_[Nr]/08_Roadmap/
  → Original → 03_OUTPUT/05_Archiv/
  → Umsetzung startet
```

---

## MATRIX1 — PFLICHTFELDER

Jede Matrix1 enthält zwingend folgende Spalten:

| Spalte | Beschreibung |
|--------|-------------|
| Maßnahme | Konkrete Tätigkeit |
| Priorität | Sofort / Phase 1 / Phase 2 |
| Zeitdauer | Geschätzter Aufwand |
| Kosten (DH) | Einmalig oder monatlich |
| Hebelwirkung | ★ bis ★★★★★ |
| Typ | Einmalig / Laufend |
| CI-abhängig | Ja / Nein |

---

## CI-ABHÄNGIGKEITS-REGEL (Pflicht)

```
REGEL: Vor Erstellung der Matrix1 prüft Hermes je Maßnahme:

→ Ist die Maßnahme sichtbar nach außen?
    JA  → CI-abhängig: ✅ Ja → erst nach Markenidentität umsetzbar
    NEIN → CI-abhängig: ❌ Nein → sofort umsetzbar (administrativ/technisch)

Beispiele:
✅ CI-abhängig:  Profilbilder, Posts, Fotos, Content, Website
❌ Nicht CI-abhängig: Google Business Basisdaten, URL-Korrekturen,
                       administrative Einträge ohne Bildmaterial
```

---

## PHASEN-LOGIK

```
SOFORT   (0–7 Tage)   → Kostenlos, kein CI nötig, sofortige Wirkung
PHASE 1  (Monat 1–3)  → Fundament: CI, Fotos, Website
PHASE 2  (Monat 4–6)  → Aufbau: Content, Bewertungen, SEO
```

---

## OUTPUT-WORKFLOW (03_OUTPUT)

```
03_OUTPUT/01_In_Arbeit/
    MATRIX1_[Datum]_[Kundenname].md      ← Hermes erstellt

03_OUTPUT/02_Zur_Freigabe/
    MATRIX1_[Datum]_[Kundenname].md      ← A05_QM geprüft

03_OUTPUT/03_Freigegeben/
    MATRIX1_[Datum]_[Kundenname].md      ← GF freigegeben

→ Kopie nach:
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/08_Roadmap/
    MATRIX1_[Datum]_[Kundenname].md

03_OUTPUT/05_Archiv/
    MATRIX1_[Datum]_[Kundenname].md      ← Original archiviert
```

---

## VORLAGE

```
Vorlage liegt zentral unter:
05_UNTERNEHMEN/02_Prozesse/MATRIX1_VORLAGE.md

→ Hermes lädt Vorlage bei jedem neuen Kunden neu
→ Keine Kopien der Vorlage in Kundenordner — nur ausgefülltes Ergebnis
→ Single Source of Truth Prinzip
```

---

## ABLAGESTRUKTUR

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
└── 08_Roadmap/
    └── MATRIX1_[Datum]_[Kundenname].md

05_UNTERNEHMEN/02_Prozesse/
└── MATRIX1_VORLAGE.md
```

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Maßnahmen zusammenführen | Hermes (H-00) |
| CI-Abhängigkeit prüfen | Hermes (H-00) |
| Strategischer GF-Input | GF |
| Matrix1 erstellen | Hermes (H-00) |
| Qualitätsprüfung | A05_QM |
| Freigabe | GF |
| Archivierung | Hermes (H-00) |

---

## QUALITÄTS-REGELN

```
⚠️  Vorlage MATRIX1_VORLAGE.md ist Pflichtbasis — nie frei erstellen
⚠️  Jede Maßnahme auf CI-Abhängigkeit geprüft — kein Punkt ausgelassen
⚠️  GF-strategischer Input wird dokumentiert mit Begründung
⚠️  Hebelwirkung muss begründbar sein — keine willkürliche Bewertung
⚠️  Output-Workflow 03_OUTPUT vollständig durchlaufen — kein Shortcut
⚠️  Bestes verfügbares Claude-Modell
```

---

## OUTPUT

```
📄 MATRIX1_[Datum]_[Kundenname].md → freigegeben
→ 03_OUTPUT/03_Freigegeben/ + 08_Roadmap/ + 05_Archiv/
→ Umsetzungsphase startet
```

---

*P_017 — Version v1.0 | Q7-System v22.0 | 22.06.2026*
*Erstes Prozessdokument außerhalb P_016 — entwickelt aus Testlauf 1 KD_001_MrKouzina*
