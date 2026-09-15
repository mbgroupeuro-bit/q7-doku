# P_031 — Bedarfsanalyse Intern

**Version:** v2.1 | **Erstellt:** 19.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** Hermes (A01) + A02_Marketing + A07_Recht + A08_Finanzen
**Trigger:** P_030b SCOPE-Festlegung abgeschlossen & freigegeben
*(NICHT P_023 — Scope muss VOR Bedarfsanalyse stehen)*

---

## ZIEL

Kundenwünsche mit fachlicher Notwendigkeit abgleichen. Pflichtbausteine identifizieren die der Kunde braucht — auch wenn er sie nicht explizit möchte. Ehrliche interne Einschätzung als Grundlage für SOLL-Zustand.

---

## GRUNDPRINZIP

```
Was der Kunde will ≠ Was der Kunde braucht

Q7 berät ehrlich.
Wenn ein Baustein strategisch notwendig ist,
wird er empfohlen — mit klarer Begründung.
Keine Beschönigung. Keine Kompromisse bei Qualität.
```

---

## ABLAUF

```
P_030b SCOPE-Festlegung freigegeben
  → Hermes liest Scope-Variante (A/B/C) aus SCOPE-Datei
  → Hermes übergibt alle Reports + Gesprächsprotokoll + Scope
  → Internes Analyse-Team arbeitet Bedarfsanalyse aus
  → Delta Kundenwunsch vs. fachliche Notwendigkeit
  → Pflichtbausteine werden definiert & begründet
  → Priorisierung wird erstellt
  → GF prüft & gibt frei → P_032 startet
```

---

## SCOPE-FESTLEGUNG

```
Bevor Pflichtbausteine definiert werden, liest Hermes den Scope
aus der SCOPE_[Datum]_[Kundenname]_Freigabe.md (P_030b).

Scope ist bindend für die gesamte Bedarfsanalyse:
→ Scope A: Alle 6 Bereiche analysiert
→ Scope B: Nur Marketing + Markenidentität
→ Scope C: Nur digitale Bausteine

Nicht jeder Kunde bekommt automatisch den vollen Umfang —
Scope-Einschränkung ist eine bewusste, dokumentierte GF-Entscheidung.
```

**Standard-Scope-Varianten:**

```
A) VOLLSTÄNDIG
   → Alle Bereiche: Markenidentität, Digital, Produktion/Prozesse,
     Finanzen, Personal, Logistik
   → P_029 (Branchen-Benchmarks): VOLLSTÄNDIG eingeflossen

B) MARKENIDENTITÄT + DIGITAL (häufigster Einstiegs-Scope)
   → Markenidentität (Logo, CI, Tonalität), Website, Social Media,
     Bewertungen, Sichtbarkeit
   → EXPLIZIT NICHT: Produktion, Personal, interne Prozesse,
     Finanzzahlen, Logistik-Investitionen
   → P_029 entfällt vollständig — kein Datenmangel, bewusste Auslassung

C) NUR DIGITAL
   → Website, Social Media, Sichtbarkeit
   → KEINE Markenidentitäts-Neuentwicklung
   → KEINE Finanzen / Personal / Logistik
```

---

## 1. Kundenwunsch (aus P_023)

```
Was hat der Kunde im Gespräch gefordert?
→ Explizite Wünsche
→ Prioritäten des Kunden
→ Was er nicht will
→ Budget & Zeitrahmen
```

---

## 2. Fachliche Notwendigkeit (Q7 intern)

```
Was braucht der Kunde wirklich?
→ Basierend auf IST-Zustand (P_030)
→ Basierend auf Gap-Analyse
→ Basierend auf Branche & Wettbewerb
→ Basierend auf strategischen Zielen des Kunden
→ Basierend auf gewähltem Scope (P_030b)
```

---

## 3. Delta-Analyse

```
Wo stimmt Kundenwunsch mit Bedarf überein?       ✅
Wo fehlt dem Kunden etwas das er nicht sieht?    ⚠️
Wo will der Kunde etwas das nicht prioritär ist? 🔄
```

---

## PFLICHTBAUSTEINE-LOGIK

```
Einige Bausteine sind nicht verhandelbar — ohne sie funktioniert
die Strategie nicht:

PFLICHTBAUSTEIN-REGEL:

Markenidentität ist strategische Voraussetzung.
Ohne sie ist Positionierung, Differenzierung
und Marketing nicht effektiv und nicht effizient.

→ Wenn Markenidentität fehlt → Pflichtbaustein
→ Wenn Positionierung unklar → Pflichtbaustein
→ Wenn USP nicht definiert → Pflichtbaustein

Diese Bausteine werden dem Kunden klar erklärt
und begründet — auch wenn er sie nicht wollte.
```

---

## BEDARFS-TABELLE (Pflichtformat)

| Baustein | Kundenwunsch | Fachliche Einschätzung | Status | Priorität |
|----------|:------------:|----------------------|:------:|:---------:|
| Markenidentität | ❌ Nicht genannt | ✅ Pflicht | ⚠️ Muss erklärt werden | 🔴 P1 |
| Website Redesign | ✅ Gewünscht | ✅ Notwendig | ✅ Übereinstimmung | 🔴 P1 |
| Social Media | ✅ Gewünscht | ✅ Notwendig | ✅ Übereinstimmung | 🟠 P2 |
| Logo Anpassung | ❌ Nicht genannt | ✅ Empfohlen | ⚠️ Begründung nötig | 🟠 P2 |
| SEO | ❌ Nicht genannt | ✅ Notwendig | ⚠️ Muss erklärt werden | 🟠 P2 |
| TV-Werbung | ✅ Gewünscht | ❌ Nicht prioritär | 🔄 Verschieben | 🟡 P3 |

**Status-Logik:**
```
✅ Übereinstimmung     = Kundenwunsch + fachlich notwendig
⚠️ Muss erklärt werden = Fachlich notwendig aber Kunde sieht es nicht
🔄 Verschieben         = Kundenwunsch aber fachlich nicht prioritär
❌ Nicht empfohlen     = Kundenwunsch aber kontraproduktiv
```

---

## PRIORISIERUNG

```
P1 — Sofort (Monate 1–3): Fundament legen
     → Pflichtbausteine die alles andere ermöglichen

P2 — Mittelfristig (Monate 4–6): Aufbau
     → Sichtbarkeit & Positionierung stärken

P3 — Langfristig (Monate 7–12): Skalierung
     → Wachstum & Optimierung
```

---

## ABLAGESTRUKTUR

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
└── 07_Bedarfsanalyse/
    ├── SCOPE_[Datum]_[Kundenname]_Freigabe.md  ← P_030b
    └── BEDARF_[Datum]_[Kundenname].md           ← P_031
```

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Koordination & Synthese | Hermes (A01) |
| Marketing-Bedarfsanalyse | A02_Marketing |
| Rechtliche Prüfung | A07_Recht |
| Finanzielle Machbarkeit | A08_Finanzen |
| Qualitätsprüfung | A05_QM |
| GF-Freigabe → P_032 | GF |

---

## QUALITÄTS-REGELN

```
⚠️  Bestes verfügbares Claude-Modell
⚠️  Jeder Pflichtbaustein mit klarer Begründung versehen
⚠️  Delta-Analyse vollständig — kein Punkt ausgelassen
⚠️  Priorisierung ist Pflicht — keine unpriorisierten Listen
⚠️  GF muss Bedarfsanalyse vor P_032 freigeben
⚠️  Scope aus P_030b ist bindend — keine eigenmächtige Erweiterung
```

---

## OUTPUT

```
📄 BEDARF_[Datum]_[Kundenname].md → freigegeben
→ GF Freigabe → P_032 startet
```

---

*P_031_A01_Bedarfsanalyse-Intern_v2.1.md | Q7-System v22.0*
*v2.1: BUG-08 behoben — Trigger korrigiert (P_023 → P_030b), Ablagestruktur bereinigt*
*Dateiname korrigiert: Konvention P_[ID]_[AGENT]_[NAME]_v[X].md*
