# 🧬 IST-UNTERNEHMEN DNA-GATE — Master-Checkliste Neukunden-Analyse

**Version:** v2.0 | **Erstellt:** 28.06.2026
**Verantwortung:** Hermes (A01a) + GF
**Trigger:** P_016 Kunden-Stammdaten-Aufnahme abgeschlossen & freigegeben
**Timing:** **VOR Mystery Shopping** — GF-Gate-Entscheidung

---

## ZIEL

**Bewusste Auswahl:** Bevor Q7 Ressourcen (Tester, Analysten, Zeit) in die vollständige P_016-Analyse investiert, prüft der GF systematisch: **"Passt dieser Kunde strategisch zu Q7? Sollen wir ihn wirklich annehmen?"**

Diese Checkliste verhindert, dass ein schlechter Fit bis zum Ende der Analyse durchläuft, nur um dann abgebrochen zu werden.

---

## ABLAUF

```
P_016 Kunden-Stammdaten-Aufnahme freigegeben
  ↓
Hermes (A01a) lädt P_019 Vorlage
  ↓
Hermes (A01a) + GF arbeiten die 7 Sections durch
  ↓
Jede Section endet mit einer Bewertung:
  → Grün (✅ OK) / Gelb (⚠️ BEDINGT) / Rot (🔴 RISIKO)
  ↓
Section 7: GF-GATE — finale Entscheidung
  → Ja, annehmen → Mystery Shopping startet
  → Nein, ablehnen → Begründung dokumentieren, Kunde informieren
  ↓
Bei Gelb: GF entscheidet mit expliziter Risikoakzeptanz
```

---

## STRUKTUR — 7 SECTIONS

### **SECTION 1: UNTERNEHMENS-GRUNDLAGEN**

**Input-Quellen:** P_016 stammdaten.md + Auftragsformular v2

```
Zu prüfen:

[ ] Branche ist Q7-kompetent?
    → Handwerk, Gastronomie, Einzelhandel, Dienstleistung: ✅
    → Pharma, Finanzdienstleistungen, Industrie: ⚠️ (Check Komplexität)
    → Kritische Branchen (Waffen, Glücksspiel): 🔴

[ ] Geschäftsmodell ist klar?
    ✅ Katalog / Produktlinie
    ✅ Maßanfertigung / Projektgeschäft
    ✅ Mischform
    🔴 Unklar (= Red Flag)

[ ] Unternehmens-Alter & Stabilität?
    ✅ > 3 Jahre stabil
    ⚠️ 1–3 Jahre (wächst noch)
    🔴 < 1 Jahr oder rückläufig

[ ] Gründer/Inhaber ist zugänglich?
    ✅ Aktive Bereitschaft zu Gesprächen
    ⚠️ Zögerlich aber erreichbar
    🔴 Unerreichbar oder delegiert an Mitarbeiter

ERGEBNIS SECTION 1:
☐ 🟢 GRÜN — Alles OK
☐ 🟡 GELB — 1–2 Punkte bedingt, aber managebar
☐ 🔴 ROT — Grundlegende Probleme
```

---

### **SECTION 2: DIGITALE DIAGNOSE**

**Input-Quellen:** P_016 stammdaten.md + erste Web-Recherche

```
Zu prüfen:

[ ] Online vorhanden?
    ✅ Website + mind. 1 Social-Media-Kanal
    ⚠️ Nur Website oder nur Facebook
    🔴 Nicht online vorhanden

[ ] Digital-Reife des Kunden selbst?
    ✅ Kunde kümmert sich aktiv um Online-Präsenz
    ⚠️ Kunde akzeptiert Hilfe
    🔴 Kunde ignoriert Digital / "ist mir egal"

[ ] Vorhandene Digital-Assets verwertbar?
    ✅ Logo vorhanden, Bilder vorhanden
    ⚠️ Nur Logo da, keine Bilder / Content
    🔴 Nichts vorhanden — alles neu ab Zero

[ ] Tech-Stack ist Standard?
    ✅ Website auf Wix / WordPress / Shopify
    ⚠️ Auf Custom-System (aber erreichbar)
    🔴 Proprietäres System / kein Zugriff

ERGEBNIS SECTION 2:
☐ 🟢 GRÜN — Digitale Basis vorhanden
☐ 🟡 GELB — Aufbau nötig, aber machbar
☐ 🔴 ROT — Massive digitale Blindheit oder Blockadefaktoren
```

---

### **SECTION 3: WETTBEWERBS-UMFELD**

**Input-Quellen:** Web-Recherche (Google, Social Media, Maps)

```
Zu prüfen:

[ ] Markt ist nicht übersättigt?
    ✅ 5–20 Wettbewerber in sichtbarem Umkreis
    ⚠️ 20–50 Wettbewerber (intensiv, aber Platz für Differenzierung)
    🔴 > 100 identische Angebote

[ ] Wettbewerber sind NICHT extrem dominant?
    ✅ Lokale / mittlere Wettbewerber
    ⚠️ 1–2 starke Wettbewerber (aber kein Monopol)
    🔴 Ein überlegener Marktführer hat 70%+ Marktanteil

[ ] Kunden USP vs. Wettbewerb erkennbar?
    ✅ Kunde hat erkennbare Besonderheit
    ⚠️ Kunde könnte Besonderheit haben (muss entwickelt werden)
    🔴 Kunde ist in jeder Hinsicht Standard / austauschbar

[ ] Lokale Marktchancen erkennbar?
    ✅ Markt wächst / Platz für neue Angebote
    ⚠️ Markt stabil (Umverteilung möglich)
    🔴 Markt schrumpft / Überalterung / Abwanderung

ERGEBNIS SECTION 3:
☐ 🟢 GRÜN — Attraktiver Markt mit Chancen
☐ 🟡 GELB — Schwieriger, aber mit Positioning machbar
☐ 🔴 ROT — Markt ist zu hart / Kunde ist chancenlos
```

---

### **SECTION 4: FINANZIELLE MACHBARKEIT**

**Input-Quellen:** Auftragsformular + GF-Kundengespräch

```
Zu prüfen:

[ ] Budget ist realistisch verfügbar?
    ✅ Schriftliche Budget-Zusage vorhanden
    ⚠️ "Ungefähre" Spanne genannt
    🔴 Kein Budget genannt oder "mal schauen ob es passt"

[ ] Budget-Höhe passt zum Scope?
    ✅ Budget ≥ erwartetem Scope-Aufwand
    ⚠️ Budget ist mittel-knapp (Priorisierung nötig)
    🔴 Budget ist unrealistisch niedrig

[ ] Zahlungsfähigkeit erkennbar?
    ✅ Mittelstand / etabliert: zahlungsfähig
    ⚠️ Startup / Jung-Unternehmen: Zahlungsrisiko mittel
    🔴 Einzelunternehmer in Krise: hohes Ausfallrisiko

[ ] Finanzielle Stabilität des Marktes?
    ✅ Branche / Wirtschaftslage stabil oder wachsend
    ⚠️ Branche unter Druck (aber kleine Nische stabil)
    🔴 Branche im Niedergang

ERGEBNIS SECTION 4:
☐ 🟢 GRÜN — Budget ist realistisch & gesichert
☐ 🟡 GELB — Budget ist knapp aber OK mit klarer Priorisierung
☐ 🔴 ROT — Budget-Risiko hoch oder unrealistisch
```

---

### **SECTION 5: SCOPE-DEFINITION**

**Input-Quellen:** Auftragsformular Abschnitt 4 + P_016 SCOPE-Festlegung

```
Zu prüfen:

[ ] Scope A (Vollständig) — prüfen ob realistisch:
    ✅ Budget ≥ 80k + 12 Monate Kapazität + Kundenengagement hoch
    ⚠️ Budget 50–80k oder Kundenengagement mittel
    🔴 Budget < 50k oder Kunde delegiert an Mitarbeiter

[ ] Scope B (Markenidentität + Digital) — typischer Einstieg:
    ✅ Budget 15–40k + 6–9 Monate + Kundenengagement gut
    ⚠️ Budget 10–15k oder Kundenengagement bedingt
    🔴 Kunde will alles billig ohne echtes Investment

[ ] Scope C (Digital nur) — für bereits gute CI:
    ✅ CI / Logo bereits professionell vorhanden
    ⚠️ CI ist OK aber könnte Überarbeitung brauchen (= Scope B)
    🔴 Keine CI vorhanden (= muss Scope B sein)

[ ] GF-Match: Passt die Scope-Wahl zum Kundentyp?
    ✅ Scope-Wahl ist realistisch & Kunde versteht sie
    ⚠️ Scope-Wahl ist OK aber Kunde erwartet mehr
    🔴 Scope ist Mismatch (Kunde erwartet A aber Budget ist C)

ERGEBNIS SECTION 5:
☐ 🟢 GRÜN — Scope ist klar definiert & realistisch
☐ 🟡 GELB — Scope ist klar aber erfordert Kundenkommunikation
☐ 🔴 ROT — Scope ist unklar oder unmöglich im Budget
```

---

### **SECTION 6: STRATEGISCHE CHANCEN & RISIKEN**

**Input-Quellen:** Alles bisherige + GF-Einschätzung

```
Zu prüfen:

CHANCEN — Wo sind die Gewinne?
[ ] Kunde hat großes Potenzial?
    ✅ Hohes Referenz-Potenzial
    ⚠️ Normales Projekt mit Lerneffekt
    🔴 Schwieriger Fall, Lernen teuer

[ ] Kunde ist beratungsoffen?
    ✅ Chef hört zu & investiert in Ideen
    ⚠️ Chef will konkrete Ergebnisse, keine Theorie
    🔴 Chef denkt er weiß schon alles

RISIKEN — Wo sind die Fallstricke?
[ ] Kunde akzeptiert ehrliches Feedback?
    ✅ Ja, will die Wahrheit
    ⚠️ Eher zaghaft, aber respektvoll
    🔴 Nein, will nur Lob hören

[ ] Inhaber ist psychologisch stabil?
    ✅ Klar, entspannt, strategisch denkend
    ⚠️ Etwas gestresst aber rational
    🔴 Überfordert / Krise im Unternehmen

[ ] Team-Engagement ist vorhanden?
    ✅ Mitarbeiter stehen hinter Inhaber & Veränderung
    ⚠️ Mitarbeiter sind neutral / abwartend
    🔴 Team wirkt demoralisiert / sabotiert Veränderung

[ ] Technisches Onboarding ist machbar?
    ✅ Kunde hat IT-Affinität oder vertraut uns
    ⚠️ Kunde hat Angst vor Technik aber ist willing
    🔴 Kunde blockiert alles was neu ist

ERGEBNIS SECTION 6:
☐ 🟢 GRÜN — Gutes Chance/Risiko-Verhältnis
☐ 🟡 GELB — Risiken erhöht, aber nicht disqualifizierend
☐ 🔴 ROT — Zu viele Risiken für diesen Moment
```

---

### **SECTION 7: GF-GATE — ENTSCHEIDUNG**

**Input:** Alle Sections + GF-Einschätzung

```
ZUSAMMENFASSUNG IST-UNTERNEHMEN DNA-GATE

Section 1 (Unternehmens-Grundlagen):    [ 🟢 / 🟡 / 🔴 ]
Section 2 (Digitale Diagnose):          [ 🟢 / 🟡 / 🔴 ]
Section 3 (Wettbewerbs-Umfeld):         [ 🟢 / 🟡 / 🔴 ]
Section 4 (Finanzielle Machbarkeit):    [ 🟢 / 🟡 / 🔴 ]
Section 5 (Scope-Definition):           [ 🟢 / 🟡 / 🔴 ]
Section 6 (Strategische Chancen/Risi):  [ 🟢 / 🟡 / 🔴 ]

---

SCORING:
🟢 Grün  = 1 Punkt
🟡 Gelb  = 0 Punkte
🔴 Rot   = -1 Punkt

GESAMT-SCORE: ___ / 6

---

SCHWELLENWERTE:

✅ EMPFEHLUNG: ANNEHMEN
   Wenn ≥ 4 Grüne oder ≥ 5 Grüne + 1 Gelb
   → Mystery Shopping startet

⚠️ BEDINGTE ANNAHME (mit Mitigationen)
   Wenn 2–3 Grüne + mehrere Gelbe
   → GF muss explizit folgende Mitigationen bestätigen:

   Mitigation 1: _______________________________________________
   Mitigation 2: _______________________________________________
   Mitigation 3: _______________________________________________

   Nach expliziter Bestätigung: Mystery Shopping startet

🔴 ABLEHNUNG — NICHT ANNEHMEN
   Wenn ≤ 1 Grün oder > 2 Rot
   → Projekt ist nicht Q7-konform aktuell
   → Begründung dokumentieren & Kunde respektvoll ablehnen

   Ablehnung-Vorlage:
   "Vielen Dank für Ihr Vertrauen. Nach unserer Analyse passt der
    Zeitpunkt für uns nicht optimal, weil [Grund aus Sections].
    Wir empfehlen Ihnen stattdessen [Alternative z.B. Freelancer /
    lokale Agentur]. Falls sich die Situation ändert, melden Sie sich
    gerne wieder."

   → Kunde wird respektvoll freigegeben
   → Q7 vermeidet ein gescheitertes Projekt

---

GF-ENTSCHEIDUNG (Pflicht):

☐ JA, ANNEHMEN
   Begründung: _______________________________________________

   → Mystery Shopping startet
   → Datum Start: [TT.MM.JJJJ]
   → Scope wird sein: A / B / C (wählen)

☐ JA, BEDINGT ANNEHMEN (mit Mitigationen)
   Mitigationen dokumentiert oben:
   ✅ Mitigation 1 akzeptiert
   ✅ Mitigation 2 akzeptiert
   ✅ Mitigation 3 akzeptiert

   → Mystery Shopping startet mit folgenden Checkpoint-Punkten:
   _______________________________________________

   → Bei Problem: Sofort eskalieren an GF

☐ NEIN, ABLEHNEN
   Grund: _______________________________________________

   → Kundenkommunikation vorbereiten
   → Respektvolle Ablehnung versenden
   → Kontakt-Verwaltung: "Vielleicht später" Flag setzen

---

GF-BESTÄTIGUNG:
Datum: [TT.MM.JJJJ]
GF: [Bestätigung erforderlich]
```

---

## ABLAGEORT

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
└── DNA_[Datum]_[Kundenname]_Gate-Entscheidung.md
```

> Flache Struktur — keine Unterordner in KD_[Nr]_[Name]/ (Teil C Abschnitt 1)

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Sections 1–6 vorbereiten | Hermes (A01a) |
| Sections durchgehen & bewerten | GF |
| Scoring berechnen | Hermes (A01a) |
| Section 7 Gate-Entscheidung | GF (verbindlich) |
| Mitigationen dokumentieren | Hermes (A01a) |
| Ablehnung kommunizieren | GF (persönlich) |

---

## QUALITÄTS-REGELN

```
⚠️  Diese Checkliste ist GATING — nicht optional
⚠️  Kein Kunde startet Mystery Shopping ohne grüne oder bedingte Gate-Entscheidung
⚠️  Rote Flags sind disqualifizierend (außer mit expliziter GF-Mitigation)
⚠️  Scoring ist transparent — GF sieht exakt warum ja/nein
⚠️  Ablehnung ist OK — bessere Ablehnung früh als Abbruch später
```

---

## LERNEFFEKT FÜR Q7

```
Nach jedem Projekt: "Lessons Learned" dokumentieren
→ "Was hätten wir in der Gate-Phase sehen sollen?"
→ "Welche Red Flags haben wir übersehen?"
→ "Welche Sections waren am wertvollsten?"

Nach 5 Kunden: v2.1 mit verbesserter Prüftiefe
Nach 10 Kunden: v3.0 mit neuen Fragen
```

---

## CHECKPOINT

```
Nach GF-Freigabe:
✅ Gate-Entscheidung abgelegt in KD_[Nr]_[Name]/
✅ Entscheidung ist schriftlich dokumentiert
✅ Falls Annahme: Mystery Shopping startet mit Datum
✅ Falls Ablehnung: Kundenkommunikation vorbereitet
✅ Hermes (A01a) speichert Gate-Ergebnis für Retrospektive
```

---

*P_019_A01_IstUnternehmen-DNA-Gate_v2.0.md | Version v2.0 | Q7-System v23.5 | 28.06.2026*
*v2.0: Dateiname konformiert (Option B — eigene P_019 ID). Ablagestruktur korrigiert (flach, kein Unterordner). Agent-Kürzel H-00 → A01a. Behebt V-01/V-04/V-05.*
