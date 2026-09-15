# P_023_A01_DNA-NeukundenGate_v1.1.md

**Prozess-ID:** P_023 | **Version:** v1.1 | **Erstellt:** 24.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** A01a (Hermes) + GF (Gate-Entscheidung)
**Trigger:** Kunden-Stammdaten-Aufnahme abgeschlossen & freigegeben
**Gate:** ⚠️ **VOR Mystery Shopping starten** — Go/No-Go Entscheidung

---

## ZIEL

**Bewusste Neukunden-Auswahl:** Bevor Q7 vollstaendige Analysierungskapazitaet (Tester, Agenten, Zeit) in die folgenden Analyseschritte investiert, prueft der GF systematisch ueber eine 7-teilige Checkliste: **"Passt dieser Kunde strategisch zu Q7? Lohnt sich die Investition?"**

---

## ABLAUF

```
Kunden-Stammdaten abgeschlossen & freigegeben
  → A01a (Hermes) laedt istunternehmen_DNA_Master-Checkliste
  → A01a bereitet die 7 Sections vor (recherchiert Zusatzdaten)
  → GF arbeitet die 7 Sections durch:
      Section 1: Unternehmens-Grundlagen
      Section 2: Digitale Diagnose
      Section 3: Wettbewerbs-Umfeld
      Section 4: Finanzielle Machbarkeit
      Section 5: Scope-Definition
      Section 6: Strategische Chancen & Risiken
      Section 7: GF-GATE Entscheidung
  ↓
ERGEBNIS:
  ✅ JA, ANNEHMEN → Mystery Shopping startet sofort
  ⚠️  BEDINGT ANNEHMEN (mit Mitigationen) → Mystery Shopping startet mit Checkpoints
  🔴 NEIN, ABLEHNEN → Kunde wird respektvoll freigegeben
```

---

## WARUM DIESER PROZESS EXISTIERT

```
Testfall 1 (KD_001_MrKouzina) zeigte:
→ Kunde wurde angenommen, aber Fit war nicht 100% optimal
→ Trotzdem erfolgreich, weil GF frueh erkannt hat
→ Aber: Mit systematischer Checkliste haette GF eher & klarer entschieden

Lernpunkt: Q7 soll nicht jeden Kunden nehmen.
Q7 soll NUR die besten Kunden nehmen — die Q7 transformieren kann.

Dieser Prozess verhindert:
❌ Teure Projekte mit schlechtem Fit
❌ Kunden, die Q7s Arbeit nicht schaetzen
❌ Budget-Projekte, die nicht funktionieren
❌ Markt-Situationen, in denen Q7 chancenlos ist

Dieser Prozess ermoeglicht:
✅ Fokus auf High-Potential-Kunden
✅ Hoehere Erfolgsquote
✅ Bessere Referenzen & Reputation
✅ Schnellere Umsetzungen
```

---

## CHECKLISTEN-EINGABE

```
Input-Quellen fuer die 7 Sections:

Section 1 (Unternehmens-Grundlagen):
  ← stammdaten.md
  ← Auftragsformular Abschnitt 1–3

Section 2 (Digitale Diagnose):
  ← stammdaten.md (brand_assets)
  ← Web-Recherche (Website, Google, erste Impressionen)

Section 3 (Wettbewerbs-Umfeld):
  ← Web-Recherche (Top 3 Wettbewerber Google Maps / Social Media)
  ← Produktliste (Positioning gegen Wettbewerb)

Section 4 (Finanzielle Machbarkeit):
  ← Auftragsformular Abschnitt 4 (Budget-Rahmen & Scope-Wunsch)
  ← Erste GF-Einschaetzung aus stammdaten.md
  ← Hinweis: Detaillierte Zahlen folgen erst spaeter im Kundengespraech —
    diese Section arbeitet mit den zum Zeitpunkt verfuegbaren
    Angaben aus dem Auftragsformular

Section 5 (Scope-Definition):
  ← Auftragsformular Abschnitt 4 (gewuenschter Scope)
  ← GF-Ersteinschaetzung

Section 6 (Strategische Chancen & Risiken):
  ← Alles bisherige + GF-Intuition

Section 7 (GF-Gate Entscheidung):
  ← GF-Bauchgefuehl + Scoring aus Sections 1–6
```

---

## SCORING-LOGIK

```
Jede der 6 Sections (nicht Section 7) endet mit einer Ampel:

🟢 GRUEN  = Alles OK                    → +1 Punkt
🟡 GELB   = Bedingt OK (Risiko mittel)  → 0 Punkte
🔴 ROT    = Problem oder Disqualifizierer → -1 Punkt

GESAMT-SCORE nach 6 Sections:

≥ +4 Punkte:  ✅ EMPFEHLUNG ANNEHMEN
               → Mystery Shopping startet
               → Kein Risk-Management noetig

+2 bis +3:     ⚠️  BEDINGTE ANNAHME
               → Mystery Shopping startet MIT Mitigationen & Checkpoints
               → GF dokumentiert explizit welche Risiken er akzeptiert

≤ +1 Punkte:   🔴 EMPFEHLUNG ABLEHNUNG
               → Kunde wird respektvoll freigegeben
               → Q7 spart Ressourcen fuer bessere Kunden
```

---

## QUALITAETS-SICHERUNG

```
Dieser Prozess ist GATING. Das bedeutet:

⚠️  Kein Kunde startet Mystery Shopping ohne P_023 abgeschlossen
⚠️  A01a (Hermes) kann nicht "einfach" Mystery Shopping starten — GF muss Gate passiert haben
⚠️  Bei Ablehnung dokumentiert A01a die Begruendung (fuer spaeteres Learning)
⚠️  Alle GF-Entscheidungen sind schriftlich & archiviert
```

---

## CHECKPOINTS BEI BEDINGTER ANNAHME

Wenn GF "Bedingt OK" fuer Scoring +2/+3 gibt, setzt er Checkpoints:

```
Beispiel Checkpoint-Plan fuer Kunde mit "3 Risiken":

Risiko 1: Budget ist knapp
  Checkpoint: Nach Woche 2 → GF & Kunde klaeren Priorisierung
  Eskalation: Falls Kunde Scope reduzieren will → Scope-Change

Risiko 2: Inhaber ist gestresst / ueberfordert
  Checkpoint: Nach Mystery Shopping → Kundengespraech
  Eskalation: Falls Inhaber nicht engagiert → Abbruch vor Scope-Festlegung

Risiko 3: Markt ist schwierig (Konkurrenz stark)
  Checkpoint: Nach SWOT-Analyse → Ist Differenzierung moeglich?
  Eskalation: Falls nein → Projekt als "erhoeht komplex" labeln

Diese Checkpoints stehen im Projekt-Plan → kein Ueberraschungsmoment spaeter
```

---

## ABLEHNUNG — RESPEKTVOLLE KUNDENKOMMUNIKATION

Falls GF Ablehnung entscheidet:

```
A01a (Hermes) bereitet eine hoefliche Ablehnungs-E-Mail vor:

---
Betreff: Danke fuer Ihr Vertrauen — und eine offene Rueckmeldung

Liebe/r [Kunde],

vielen Dank, dass Sie Q7 mit Ihrem Projekt vertraut haben.
Wir haben Ihre Anfrage gruendlich analysiert.

Nach unserer Einschaetzung passt der Zeitpunkt fuer eine optimale
Zusammenarbeit aktuell nicht ganz:

[Grund aus Checkliste: Z.B. "Das digitale Fundament ist noch nicht
solid genug fuer den Umfang, den Sie sich wuenschen. Ohne dieses
Fundament wuerden wir wahrscheinlich nicht die Ergebnisse liefern,
die Sie verdienen."]

Das ist keine Bewertung Ihres Unternehmens — sondern unsere
Verantwortung, nur Projekte anzunehmen, bei denen wir
selbstvertrauensvoll grosse Erfolge liefern koennen.

UNSER VORSCHLAG:
1. Sie arbeiten in den naechsten 3 Monaten an [Basis-Punkt]
2. Sie bauen intern [bestimmtes Team-Element] auf
3. Sie kontaktieren uns dann erneut — sehr gerne!

Falls Sie einen Profi-Sparringspartner fuer diese Zwischenphase
suchen, empfehle ich: [Alternative: lokale Agentur / Freelancer /
Branchenverbund]

Wir freuen uns, wenn Sie in ein paar Monaten zurueckkommen!

Viele Gruesse,
[GF-Name]

---

Diese E-Mail ist:
✅ Ehrlich (keine Ausreden)
✅ Respektvoll (keine Kritik am Kunden)
✅ Hilfreich (gibt konkrete naechste Schritte)
✅ Offen (Tuer bleibt fuer Zukunft offen)
```

---

## LEARNING-EFFEKT

Nach jedem Projekt (erfolgreich oder fehlgeschlagen):

```
GF + A01a (Hermes) reflektieren:

"Haette die DNA-Checkliste dieses Projekt vorhergesagt?"
→ Welche Sections waren kritisch?
→ Welche waren ueberfluessig?
→ Welche Fragen haetten wir frueher stellen sollen?

Nach 5 Projekten:
→ DNA mit optimierten Fragen

Nach 10 Projekten:
→ DNA mit neuen Kategorien basierend auf echten Erkenntnissen

Dieser Feedback-Loop macht die Checkliste immer praeziser.
```

---

## ABLAGESTRUKTUR

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
└── DNA_[Datum]_[Kundenname]_Freigabe.md ← Diese Checkliste ausgefuellt

05_UNTERNEHMEN/02_Prozesse/ (zentral)
    └── istunternehmen_DNA_Master-Checkliste.md (Vorlage — wird nicht kopiert)
```

> Flache Struktur gemaess Teil C — keine Unterordner in KD_[Nr]_[Name]/

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Checklisten-Vorlage bereitstellen | A01a (Hermes) |
| Sections 1–6 vorbereiten & recherchieren | A01a (Hermes) |
| Sections durchgehen | GF (persoenlich) |
| Gate-Entscheidung treffen | GF (verbindlich) |
| Scoring berechnen & dokumentieren | A01a (Hermes) |
| Ggf. Ablehnungs-E-Mail vorbereiten | A01a (Hermes) |

---

## QUALITY GATES

```
Dieser Prozess stoppt automatisch:

OHNE schriftliche GF-Gate-Freigabe:
  ❌ Mystery Shopping darf NICHT starten
  ❌ Tester werden NICHT mobilisiert
  ❌ Analysten werden NICHT zugewiesen

NUR mit schriftlicher GF-Freigabe (✅ JA oder ⚠️  BEDINGT):
  ✅ Mystery Shopping startet
  ✅ Ressourcen werden freigegeben
  ✅ A01a plant Milestone

Bei Ablehnung (🔴 NEIN):
  ✅ Kundenkommunikation vorbereitet
  ✅ Kontakt bleibt offen ("Vielleicht spaeter"-Flag)
  ✅ Q7 spart Ressourcen
```

---

## CHECKPOINT

**Nach P_023 abgeschlossen:**
- ✅ DNA_Freigabe.md abgelegt
- ✅ GF-Entscheidung ist schriftlich dokumentiert
- ✅ Falls Annahme: A05a (QM-Leiter) wird informiert
- ✅ Falls Ablehnung: Kundenkommunikation vorbereitet
- ✅ A01a hat Scoring & Ergebnis fuer Retrospektive archiviert

---

## AENDERUNGSHISTORIE

| Version | Datum | Aenderung | Verantwortlich |
|---------|-------|-----------|----------------|
| v1.0 | 24.06.2026 | Erstellung als P_016.1b | A01a (Hermes) |
| v1.1 | 28.06.2026 | BUG-03 behoben — Section 4 Input-Quelle korrigiert | A01a (Hermes) |
| v1.1 (Migration) | 28.06.2026 | ID-Migration P_016.1b → P_023, Dateiname konformiert, A[NR]a-Schema, ae/oe/ue/ss, Ablagestruktur-Hinweis ergaenzt | A09a (Doku-Leiter) |

---

*P_023_A01_DNA-NeukundenGate_v1.1.md | Q7-System v23.5 | 28.06.2026*
