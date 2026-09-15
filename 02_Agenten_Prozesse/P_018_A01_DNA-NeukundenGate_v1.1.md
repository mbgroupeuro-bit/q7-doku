# P_018_A01_DNA-NeukundenGate_v1.1.md

**Prozess-ID:** P_018 | **Version:** v1.1 | **Erstellt:** 24.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** A01a (Hermes) koordiniert — GF entscheidet (verbindlich)
**Trigger:** P_016 Kunden-Stammdaten-Aufnahme abgeschlossen & freigegeben
**Timing:** VOR P_019 Mystery Shopping — GF-Gate-Entscheidung
**Status:** Aktiv

---

## 1. ZIEL

**Bewusste Auswahl:** Bevor Q7 Ressourcen (Tester, Analysten, Zeit) in die vollstaendige Analyse investiert, prueft der GF systematisch: **"Passt dieser Kunde strategisch zu Q7? Sollen wir ihn wirklich annehmen?"**

Dieser Prozess verhindert, dass ein schlechter Fit bis zur finalen Analyse durchlaeuft, nur um dann abgebrochen zu werden.

---

## 2. ABLAUF

```
P_016 Kunden-Stammdaten-Aufnahme freigegeben
  ↓
A01a (Hermes) laedt DNA-Gate Vorlage (P_019_A01_IstUnternehmen-DNA-Gate_v2.0.md)
  ↓
A01a + GF arbeiten die 7 Sections durch
  ↓
Jede Section endet mit einer Bewertung:
  → Gruen (✅ OK) / Gelb (⚠️ BEDINGT) / Rot (🔴 RISIKO)
  ↓
Section 7: GF-GATE — finale Entscheidung
  → Ja, annehmen → P_019 Mystery Shopping startet
  → Nein, ablehnen → Begruendung dokumentieren, Kunde informieren
  ↓
Bei Gelb: GF entscheidet mit expliziter Risikoakzeptanz
```

---

## 3. STRUKTUR — 7 SECTIONS

### 3.1 SECTION 1: UNTERNEHMENS-GRUNDLAGEN

**Input-Quellen:** P_016 stammdaten.md + Auftragsformular v3.0

```
Zu pruefen:

[ ] Branche ist Q7-kompetent?
    → Handwerk, Gastronomie, Einzelhandel, Dienstleistung: ✅
    → Pharma, Finanzdienstleistungen, Industrie: ⚠️ (Check Komplexitaet)
    → Kritische Branchen (Waffen, Gluecksspiel): 🔴

[ ] Geschaeftsmodell ist klar?
    ✅ Katalog / Produktlinie
    ✅ Massanfertigung / Projektgeschaeft
    ✅ Mischform
    🔴 Unklar (= Red Flag)

[ ] Unternehmens-Alter & Stabilitaet?
    ✅ > 3 Jahre stabil
    ⚠️ 1–3 Jahre (waechst noch)
    🔴 < 1 Jahr oder ruecklaeufig

[ ] Gruender/Inhaber ist zugaenglich?
    ✅ Aktive Bereitschaft zu Gespraechen
    ⚠️ Zoeglich aber erreichbar
    🔴 Unerreichbar oder delegiert an Mitarbeiter

ERGEBNIS SECTION 1:
☐ 🟢 GRUEN — Alles OK
☐ 🟡 GELB — 1–2 Punkte bedingt, aber managebar
☐ 🔴 ROT — Grundlegende Probleme
```

---

### 3.2 SECTION 2: DIGITALE DIAGNOSE

**Input-Quellen:** P_016 stammdaten.md + erste Web-Recherche

```
Zu pruefen:

[ ] Online vorhanden?
    ✅ Website + mind. 1 Social-Media-Kanal
    ⚠️ Nur Website oder nur Facebook
    🔴 Nicht online vorhanden

[ ] Digital-Reife des Kunden selbst?
    ✅ Kunde kuemmert sich aktiv um Online-Praesenz
    ⚠️ Kunde akzeptiert Hilfe
    🔴 Kunde ignoriert Digital / "ist mir egal"

[ ] Vorhandene Digital-Assets verwertbar?
    ✅ Logo vorhanden, Bilder vorhanden
    ⚠️ Nur Logo da, keine Bilder / Content
    🔴 Nichts vorhanden — alles neu ab Zero

[ ] Tech-Stack ist Standard?
    ✅ Website auf Wix / WordPress / Shopify
    ⚠️ Auf Custom-System (aber erreichbar)
    🔴 Proprietaeres System / kein Zugriff

ERGEBNIS SECTION 2:
☐ 🟢 GRUEN — Digitale Basis vorhanden
☐ 🟡 GELB — Aufbau noetig, aber machbar
☐ 🔴 ROT — Massive digitale Blindheit oder Blockadefaktoren
```

---

### 3.3 SECTION 3: WETTBEWERBS-UMFELD

**Input-Quellen:** Web-Recherche (Google, Social Media, Maps)

```
Zu pruefen:

[ ] Markt ist nicht uebersaettigt?
    ✅ 5–20 Wettbewerber in sichtbarem Umkreis
    ⚠️ 20–50 Wettbewerber (intensiv, aber Platz fuer Differenzierung)
    🔴 > 100 identische Angebote

[ ] Wettbewerber sind NICHT extrem dominant?
    ✅ Lokale / mittlere Wettbewerber
    ⚠️ 1–2 starke Wettbewerber (aber kein Monopol)
    🔴 Ein ueberlegener Marktfuehrer hat 70%+ Marktanteil

[ ] Kunden USP vs. Wettbewerb erkennbar?
    ✅ Kunde hat erkennbare Besonderheit
    ⚠️ Kunde koennte Besonderheit haben (muss entwickelt werden)
    🔴 Kunde ist in jeder Hinsicht Standard / austauschbar

[ ] Lokale Marktchancen erkennbar?
    ✅ Markt waechst / Platz fuer neue Angebote
    ⚠️ Markt stabil (Umverteilung moeglich)
    🔴 Markt schrumpft / Ueberalterung / Abwanderung

ERGEBNIS SECTION 3:
☐ 🟢 GRUEN — Attraktiver Markt mit Chancen
☐ 🟡 GELB — Schwieriger, aber mit Positioning machbar
☐ 🔴 ROT — Markt ist zu hart / Kunde ist chancenlos
```

---

### 3.4 SECTION 4: FINANZIELLE MACHBARKEIT

**Input-Quellen:** Auftragsformular v3.0 + GF-Kundengespräch

```
Zu pruefen:

[ ] Budget ist realistisch verfuegbar?
    ✅ Schriftliche Budget-Zusage vorhanden
    ⚠️ "Ungefaehre" Spanne genannt
    🔴 Kein Budget genannt oder "mal schauen ob es passt"

[ ] Budget-Hoehe passt zum Scope?
    ✅ Budget >= erwartetem Scope-Aufwand
    ⚠️ Budget ist mittel-knapp (Priorisierung noetig)
    🔴 Budget ist unrealistisch niedrig

[ ] Zahlungsfaehigkeit erkennbar?
    ✅ Mittelstand / etabliert: zahlungsfaehig
    ⚠️ Startup / Jung-Unternehmen: Zahlungsrisiko mittel
    🔴 Einzelunternehmer in Krise: hohes Ausfallrisiko

[ ] Finanzielle Stabilitaet des Marktes?
    ✅ Branche / Wirtschaftslage stabil oder wachsend
    ⚠️ Branche unter Druck (aber kleine Nische stabil)
    🔴 Branche im Niedergang

ERGEBNIS SECTION 4:
☐ 🟢 GRUEN — Budget ist realistisch & gesichert
☐ 🟡 GELB — Budget ist knapp aber OK mit klarer Priorisierung
☐ 🔴 ROT — Budget-Risiko hoch oder unrealistisch
```

---

### 3.5 SECTION 5: SCOPE-DEFINITION

**Input-Quellen:** Auftragsformular v3.0 Abschnitt 4

```
Zu pruefen:

[ ] Scope A (Vollstaendig) — pruefen ob realistisch:
    ✅ Budget >= 80k + 12 Monate Kapazitaet + Kundenengagement hoch
    ⚠️ Budget 50–80k oder Kundenengagement mittel
    🔴 Budget < 50k oder Kunde delegiert an Mitarbeiter

[ ] Scope B (Markenidentitaet + Digital) — typischer Einstieg:
    ✅ Budget 15–40k + 6–9 Monate + Kundenengagement gut
    ⚠️ Budget 10–15k oder Kundenengagement bedingt
    🔴 Kunde will alles billig ohne echtes Investment

[ ] Scope C (Digital nur) — fuer bereits gute CI:
    ✅ CI / Logo bereits professionell vorhanden
    ⚠️ CI ist OK aber koennte Ueberarbeitung brauchen (= Scope B)
    🔴 Keine CI vorhanden (= muss Scope B sein)

[ ] GF-Match: Passt die Scope-Wahl zum Kundentyp?
    ✅ Scope-Wahl ist realistisch & Kunde versteht sie
    ⚠️ Scope-Wahl ist OK aber Kunde erwartet mehr
    🔴 Scope ist Mismatch (Kunde erwartet A aber Budget ist C)

ERGEBNIS SECTION 5:
☐ 🟢 GRUEN — Scope ist klar definiert & realistisch
☐ 🟡 GELB — Scope ist klar aber erfordert Kundenkommunikation
☐ 🔴 ROT — Scope ist unklar oder unmoeglich im Budget
```

---

### 3.6 SECTION 6: STRATEGISCHE CHANCEN & RISIKEN

**Input-Quellen:** Alles bisherige + GF-Einschaetzung

```
Zu pruefen:

CHANCEN:
[ ] Kunde hat grosses Potenzial?
    ✅ Hohes Referenz-Potenzial
    ⚠️ Normales Projekt mit Lerneffekt
    🔴 Schwieriger Fall, Lernen teuer

[ ] Kunde ist beratungsoffen?
    ✅ Chef hoert zu & investiert in Ideen
    ⚠️ Chef will konkrete Ergebnisse, keine Theorie
    🔴 Chef denkt er weiss schon alles

RISIKEN:
[ ] Kunde akzeptiert ehrliches Feedback?
    ✅ Ja, will die Wahrheit
    ⚠️ Eher zaghaft, aber respektvoll
    🔴 Nein, will nur Lob hoeren

[ ] Inhaber ist psychologisch stabil?
    ✅ Klar, entspannt, strategisch denkend
    ⚠️ Etwas gestresst aber rational
    🔴 Ueberfordert / Krise im Unternehmen

[ ] Team-Engagement ist vorhanden?
    ✅ Mitarbeiter stehen hinter Inhaber & Veraenderung
    ⚠️ Mitarbeiter sind neutral / abwartend
    🔴 Team wirkt demoralisiert

[ ] Technisches Onboarding ist machbar?
    ✅ Kunde hat IT-Affinitaet oder vertraut uns
    ⚠️ Kunde hat Angst vor Technik aber ist willing
    🔴 Kunde blockiert alles was neu ist

ERGEBNIS SECTION 6:
☐ 🟢 GRUEN — Gutes Chance/Risiko-Verhaeltnis
☐ 🟡 GELB — Risiken erhoeht, aber nicht disqualifizierend
☐ 🔴 ROT — Zu viele Risiken fuer diesen Moment
```

---

### 3.7 SECTION 7: GF-GATE — ENTSCHEIDUNG

```
ZUSAMMENFASSUNG DNA-GATE

Section 1 (Unternehmens-Grundlagen):    [ 🟢 / 🟡 / 🔴 ]
Section 2 (Digitale Diagnose):          [ 🟢 / 🟡 / 🔴 ]
Section 3 (Wettbewerbs-Umfeld):         [ 🟢 / 🟡 / 🔴 ]
Section 4 (Finanzielle Machbarkeit):    [ 🟢 / 🟡 / 🔴 ]
Section 5 (Scope-Definition):           [ 🟢 / 🟡 / 🔴 ]
Section 6 (Strategische Chancen/Risi):  [ 🟢 / 🟡 / 🔴 ]

SCORING:
🟢 Gruen  = +1 Punkt
🟡 Gelb   =  0 Punkte
🔴 Rot    = -1 Punkt

GESAMT-SCORE: ___ / 6

SCHWELLENWERTE:

✅ EMPFEHLUNG: ANNEHMEN
   Wenn >= 4 Gruene oder >= 5 Gruene + 1 Gelb
   → P_019 Mystery Shopping startet

⚠️ BEDINGTE ANNAHME (mit Mitigationen)
   Wenn 2–3 Gruene + mehrere Gelbe
   → GF bestaetigt Mitigationen:
   Mitigation 1: _______________________________________________
   Mitigation 2: _______________________________________________
   Mitigation 3: _______________________________________________
   → P_019 startet nach Bestaetigung

🔴 ABLEHNUNG
   Wenn <= 1 Gruen oder > 2 Rot
   → Begruendung dokumentieren & Kunde respektvoll ablehnen

   Ablehnungs-Vorlage:
   "Vielen Dank fuer Ihr Vertrauen. Nach unserer Analyse passt der
    Zeitpunkt fuer uns nicht optimal, weil [Grund aus Sections].
    Wir empfehlen Ihnen stattdessen [Alternative].
    Falls sich die Situation aendert, melden Sie sich gerne wieder."

GF-ENTSCHEIDUNG (Pflicht):

☐ JA, ANNEHMEN
   Begruendung: _______________________________________________
   → P_019 startet
   → Datum Start: [TT.MM.JJJJ]
   → Scope: A / B / C

☐ JA, BEDINGT ANNEHMEN
   → P_019 startet mit Checkpoint-Punkten:
   _______________________________________________

☐ NEIN, ABLEHNEN
   Grund: _______________________________________________
   → Kundenkommunikation vorbereiten
   → "Vielleicht spaeter"-Flag setzen

GF-BESTAETIGUNG:
Datum: [TT.MM.JJJJ]
GF: [Bestaetigung erforderlich]
```

---

## 4. ABLAGESTRUKTUR

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
└── DNA_Gate_[Datum]_[Kundenname]_Freigabe.md
```

> Flache Struktur gemaess Teil C — keine Unterordner in KD_[Nr]_[Name]/

---

## 5. BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Sections 1–6 vorbereiten | A01a (Hermes) |
| Sections durchgehen & bewerten | GF |
| Scoring berechnen | A01a (Hermes) |
| Section 7 Gate-Entscheidung | GF (verbindlich) |
| Mitigationen dokumentieren | A01a (Hermes) |
| Ablehnung kommunizieren | GF (persoenlich) |

---

## 6. QUALITAETS-REGELN

| Regel | Beschreibung |
|-------|-------------|
| Q1 | Dieser Prozess ist GATING — nicht optional |
| Q2 | Kein Kunde startet P_019 ohne GF-Gate-Freigabe |
| Q3 | Rote Flags sind disqualifizierend (ausser mit GF-Mitigation) |
| Q4 | Scoring ist transparent — GF sieht exakt warum ja/nein |
| Q5 | Ablehnung ist OK — besser frueh als spaet |

---

## 7. LERNEFFEKT

| Meilenstein | Aktion |
|-------------|--------|
| Nach 5 Kunden | DNA-Gate v1.2 mit verbesserter Prueftiefe |
| Nach 10 Kunden | DNA-Gate v2.0 mit neuen Fragen |

---

## 8. CHECKPOINT

```
Nach GF-Freigabe:
✅ DNA_Gate_[Datum]_Freigabe.md abgelegt
✅ Entscheidung schriftlich dokumentiert
✅ Falls Annahme: P_019 startet mit Datum
✅ Falls Ablehnung: Kundenkommunikation vorbereitet
✅ A01a speichert Gate-Ergebnis fuer Retrospektive
```

---

## 9. AENDERUNGSHISTORIE

| Version | Datum | Aenderung | Verantwortlich |
|---------|-------|-----------|----------------|
| v1.0 | 24.06.2026 | Erstellung | A01a (Hermes) |
| v1.1 | 28.06.2026 | Dateiname & Header konformiert, Bindestrich-Fix, P_016.1 → P_016, P_016.2 → P_019 | A09a (Doku-Leiter) |

---

*P_018_A01_DNA-NeukundenGate_v1.1.md | Q7-System v23.5 | 28.06.2026*
