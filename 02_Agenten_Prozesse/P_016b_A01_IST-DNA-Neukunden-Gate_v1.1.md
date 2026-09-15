# P_016b — IST-DNA Neukunden-Gate

**Version:** v1.1 | **Erstellt:** 24.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** Hermes (A01) + GF (Gate-Entscheidung)
**Trigger:** P_016 Kunden-Stammdaten-Aufnahme abgeschlossen & freigegeben
**Gate:** ⚠️ **VOR P_018 DNA-NeukundenGate starten** — Go/No-Go Entscheidung

---

## ZIEL

**Bewusste Neukunden-Auswahl:** Bevor Q7 vollständige Analysierungskapazität (Tester, Agenten, Zeit) in P_019–P_034 investiert, prüft der GF systematisch über eine 7-teilige Checkliste: **"Passt dieser Kunde strategisch zu Q7? Lohnt sich die Investition?"**

---

## ABLAUF

```
P_016 Kunden-Stammdaten abgeschlossen & freigegeben
  ↓
Hermes lädt istunternehmen_DNA_Master-Checkliste
  ↓
Hermes bereitet die 7 Sections vor (recherchiert Zusatzdaten)
  ↓
GF arbeitet die 7 Sections durch:
  Section 1: Unternehmens-Grundlagen
  Section 2: Digitale Diagnose
  Section 3: Wettbewerbs-Umfeld
  Section 4: Finanzielle Machbarkeit
  Section 5: Scope-Definition
  Section 6: Strategische Chancen & Risiken
  Section 7: GF-GATE Entscheidung
  ↓
ERGEBNIS:
  ✅ JA, ANNEHMEN → P_018 startet sofort
  ⚠️  BEDINGT ANNEHMEN (mit Mitigationen) → P_018 startet mit Checkpoints
  🔴 NEIN, ABLEHNEN → Kunde wird respektvoll freigegeben
```

---

## WARUM DIESER PROZESS EXISTIERT

```
Testfall 1 (KD_001_MrKouzina) zeigte:
→ Kunde wurde angenommen, aber Fit war nicht 100% optimal
→ Trotzdem erfolgreich, weil GF früh erkannt hat
→ Aber: Mit systematischer Checkliste hätte GF eher & klarer entschieden

Lernpunkt: Q7 soll nicht jeden Kunden nehmen.
Q7 soll NUR die besten Kunden nehmen — die Q7 transformieren kann.

Dieser Prozess verhindert:
❌ Teure Projekte mit schlechtem Fit
❌ Kunden, die Q7s Arbeit nicht schätzen
❌ Budget-Projekte, die nicht funktionieren
❌ Markt-Situationen, in denen Q7 chancenlos ist

Dieser Prozess ermöglicht:
✅ Fokus auf High-Potential-Kunden
✅ Höhere Erfolgsquote
✅ Bessere Referenzen & Reputation
✅ Schnellere Umsetzungen
```

---

## CHECKLISTEN-EINGABE

```
Input-Quellen für die 7 Sections:

Section 1 (Unternehmens-Grundlagen):
  ← P_016 stammdaten.md
  ← Auftragsformular Abschnitt 1–3

Section 2 (Digitale Diagnose):
  ← P_016 stammdaten.md (brand_assets)
  ← Web-Recherche (Website, Google, erste Impressionen)

Section 3 (Wettbewerbs-Umfeld):
  ← Web-Recherche (Top 3 Wettbewerber Google Maps / Social Media)
  ← P_016 Produktliste (Positioning gegen Wettbewerb)

Section 4 (Finanzielle Machbarkeit):
  ← Auftragsformular Abschnitt 4 (Budget-Rahmen & Scope-Wunsch)
  ← Erste GF-Einschätzung aus stammdaten.md
  ← Hinweis: Detaillierte Zahlen folgen erst in P_023 —
    diese Section arbeitet mit den zum Zeitpunkt verfügbaren
    Angaben aus dem Auftragsformular

Section 5 (Scope-Definition):
  ← Auftragsformular Abschnitt 4 (gewünschter Scope)
  ← GF-Ersteinschätzung

Section 6 (Strategische Chancen & Risiken):
  ← Alles bisherige + GF-Intuition

Section 7 (GF-Gate Entscheidung):
  ← GF-Bauchgefühl + Scoring aus Sections 1–6
```

---

## SCORING-LOGIK

```
Jede der 6 Sections (nicht Section 7) endet mit einer Ampel:

🟢 GRÜN   = Alles OK                    → +1 Punkt
🟡 GELB   = Bedingt OK (Risiko mittel)  → 0 Punkte
🔴 ROT    = Problem oder Disqualifizierer → -1 Punkt

GESAMT-SCORE nach 6 Sections:

≥ +4 Punkte:  ✅ EMPFEHLUNG ANNEHMEN
               → P_018 startet
               → Kein Risk-Management nötig

+2 bis +3:     ⚠️  BEDINGTE ANNAHME
               → P_018 startet MIT Mitigationen & Checkpoints
               → GF dokumentiert explizit welche Risiken er akzeptiert

≤ +1 Punkte:   🔴 EMPFEHLUNG ABLEHNUNG
               → Kunde wird respektvoll freigegeben
               → Q7 spart Ressourcen für bessere Kunden
```

---

## QUALITÄTS-SICHERUNG

```
Dieser Prozess ist GATING. Das bedeutet:

⚠️  Kein Kunde startet P_018 ohne P_016b abgeschlossen
⚠️  Hermes kann nicht "einfach" P_018 starten — GF muss Gate passiert haben
⚠️  Bei Ablehnung dokumentiert Hermes die Begründung (für späteres Learning)
⚠️  Alle GF-Entscheidungen sind schriftlich & archiviert
```

---

## CHECKPOINTS BEI BEDINGTER ANNAHME

Wenn GF "Bedingt OK" für Scoring +2/+3 gibt, setzt er Checkpoints:

```
Beispiel Checkpoint-Plan für Kunde mit "3 Risiken":

Risiko 1: Budget ist knapp
  Checkpoint: Nach Woche 2 → GF & Kunde klären Priorisierung
  Eskalation: Falls Kunde Scope reduzieren will → Scope-Change

Risiko 2: Inhaber ist gestresst / überfordert
  Checkpoint: Nach P_019 → Kundengespräch P_023
  Eskalation: Falls Inhaber nicht engagiert → Abbruch vor P_031

Risiko 3: Markt ist schwierig (Konkurrenz stark)
  Checkpoint: Nach P_028 (SWOT) → Ist Differenzierung möglich?
  Eskalation: Falls nein → Projekt als "erhöht komplex" labeln

Diese Checkpoints stehen im Projekt-Plan → kein Überraschungsmoment später
```

---

## ABLEHNUNG — RESPEKTVOLLE KUNDENKOMMUNIKATION

Falls GF Ablehnung entscheidet:

```
Hermes bereitet eine höfliche Ablehnungs-E-Mail vor:

---
Betreff: Danke für Ihr Vertrauen — und eine offene Rückmeldung

Liebe/r [Kunde],

vielen Dank, dass Sie Q7 mit Ihrem Projekt vertraut haben.
Wir haben Ihre Anfrage gründlich analysiert.

Nach unserer Einschätzung passt der Zeitpunkt für eine optimale
Zusammenarbeit aktuell nicht ganz:

[Grund aus Checkliste: Z.B. "Das digitale Fundament ist noch nicht
solid genug für den Umfang, den Sie sich wünschen. Ohne dieses
Fundament würden wir wahrscheinlich nicht die Ergebnisse liefern,
die Sie verdienen."]

Das ist keine Bewertung Ihres Unternehmens — sondern unsere
Verantwortung, nur Projekte anzunehmen, bei denen wir
selbstvertrauensvoll große Erfolge liefern können.

UNSER VORSCHLAG:
1. Sie arbeiten in den nächsten 3 Monaten an [Basis-Punkt]
2. Sie bauen intern [bestimmtes Team-Element] auf
3. Sie kontaktieren uns dann erneut — sehr gerne!

Falls Sie einen Profi-Sparringspartner für diese Zwischenphase
suchen, empfehle ich: [Alternative: lokale Agentur / Freelancer /
Branchenverbund]

Wir freuen uns, wenn Sie in ein paar Monaten zurückkommen!

Viele Grüße,
[GF-Name]

---

Diese E-Mail ist:
✅ Ehrlich (keine Ausreden)
✅ Respektvoll (keine Kritik am Kunden)
✅ Hilfreich (gibt konkrete nächste Schritte)
✅ Offen (Tür bleibt für Zukunft offen)
```

---

## LEARNING-EFFEKT

Nach jedem Projekt (erfolgreich oder fehlgeschlagen):

```
GF + Hermes reflektieren:

"Hätte die DNA-Checkliste dieses Projekt vorhergesagt?"
→ Welche Sections waren kritisch?
→ Welche waren überflüssig?
→ Welche Fragen hätten wir früher stellen sollen?

Nach 5 Projekten:
→ DNA mit optimierten Fragen

Nach 10 Projekten:
→ DNA mit neuen Kategorien basierend auf echten Erkenntnissen

Dieser Feedback-Loop macht die Checkliste immer präziser.
```

---

## ABLAGESTRUKTUR

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
└── 06_Kundengespräch/
    └── DNA_[Datum]_[Kundenname]_Freigabe.md ← Diese Checkliste ausgefüllt

05_UNTERNEHMEN/02_Prozesse/ (zentral)
    └── istunternehmen_DNA_Master-Checkliste.md (Vorlage — wird nicht kopiert)
```

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Checklisten-Vorlage bereitstellen | Hermes (A01) |
| Sections 1–6 vorbereiten & recherchieren | Hermes (A01) |
| Sections durchgehen | GF (persönlich) |
| Gate-Entscheidung treffen | GF (verbindlich) |
| Scoring berechnen & dokumentieren | Hermes (A01) |
| Ggf. Ablehnungs-E-Mail vorbereiten | Hermes (A01) |

---

## QUALITY GATES

```
Dieser Prozess stoppt automatisch:

OHNE schriftliche GF-Gate-Freigabe:
  ❌ P_018 darf NICHT starten
  ❌ Tester werden NICHT mobilisiert
  ❌ Analysten werden NICHT zugewiesen

NUR mit schriftlicher GF-Freigabe (✅ JA oder ⚠️  BEDINGT):
  ✅ P_018 startet
  ✅ Ressourcen werden freigegeben
  ✅ Hermes plant Milestone

Bei Ablehnung (🔴 NEIN):
  ✅ Kundenkommunikation vorbereitet
  ✅ Kontakt bleibt offen ("Vielleicht später"-Flag)
  ✅ Q7 spart Ressourcen
```

---

## CHECKPOINT

**Nach P_016b abgeschlossen:**
- ✅ DNA_Freigabe.md abgelegt
- ✅ GF-Entscheidung ist schriftlich dokumentiert
- ✅ Falls Annahme: A05_QM wird informiert
- ✅ Falls Ablehnung: Kundenkommunikation vorbereitet
- ✅ Hermes hat Scoring & Ergebnis für Retrospektive archiviert

---

*P_016b_A01_IST-DNA-Neukunden-Gate_v1.1.md | Q7-System v22.0*
*v1.1: BUG-03 behoben — Section 4 Input-Quelle korrigiert (P_016.7 referenz entfernt)*
*Dateiname korrigiert: Konvention P_[ID]_[AGENT]_[NAME]_v[X].md*
