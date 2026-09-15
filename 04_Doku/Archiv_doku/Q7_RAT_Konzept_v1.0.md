# Q7_RAT_Konzept_v1.0.md — WEISER RAT (ZUKUNFTS-FEATURE)

**Status:** KONZEPT — noch nicht implementiert
**Erstellt:** 30.06.2026
**GF-Freigabe für Implementierung:** AUSSTEHEND
**Zugehörig zu:** Q7-System v8.0+

---

## 1. IDEE & ZWECK

Der Q7-Rat ist ein Denk-Werkzeug für den GF.
Ziel: Zu jeder strategischen Frage 10 verschiedene Perspektiven gleichzeitig erhalten —
funktional (RAT-N) und philosophisch-kulturell (RAT-K).

**Kernprinzip:** Nicht eine Meinung — viele Meinungen. GF entscheidet.

---

## 2. POSITION IM SYSTEM

```
A00a_StabAgent     ← unverändert, passiver Beobachter aller Ebenen
A00b_Rat           ← neue Stabstelle, NUR auf GF-Anfrage aktiv
    ├── 📁 RAT-N/  ← Neutraler Rat (5 funktionale Persönlichkeiten)
    └── 📁 RAT-K/  ← Kultureller Rat (5 philosophische Persönlichkeiten)
```

**Wichtig:**
- A00a bleibt unverändert (passiver Beobachter, keine Entscheidungsbefugnis)
- A00b ist kein dauerhaft aktiver Agent — wird nur auf GF-Anfrage aktiviert
- Beide Räte arbeiten parallel → 10 Urteile → Konsolidierung → 1 Seite für GF

---

## 3. AKTIVIERUNGS-LOGIK

```
GF stellt Frage / gibt Thema vor (via GUI oder direkt an Hermes)
   ↓
A00b_Rat wird aktiviert
   ↓
RAT-N (5 Persönlichkeiten) → parallel
RAT-K (5 Persönlichkeiten) → parallel
   ↓
10 Urteile eingesammelt
   ↓
Konsolidierung → 1 Seite Zusammenfassung
   ↓
GF entscheidet
```

**Trigger:** Nur GF. Hermes kann Rat-Sitzung vorschlagen — GF muss bestätigen.

---

## 4. RAT-N — NEUTRALER RAT (Funktional/Operativ)

Einsatz: Operative Entscheidungen, Kunden-Aufträge, Prozess-Fragen

| Kürzel | Rolle | Blickwinkel | Kernfrage |
|--------|-------|-------------|-----------|
| RN-01 | Der Skeptiker | Risiko & Schwachstellen | Was kann schiefgehen? |
| RN-02 | Der Stratege | Langfrist & Richtung | Wo führt das in 3 Jahren hin? |
| RN-03 | Der Analytiker | Daten & Logik | Was sagen die Zahlen wirklich? |
| RN-04 | Der Kostencontroller | Budget & ROI | Was kostet es wirklich — direkt und indirekt? |
| RN-05 | Der Pragmatiker | Umsetzbarkeit & Realität | Können wir das heute konkret umsetzen? |

---

## 5. RAT-K — KULTURELLER RAT (Philosophisch/Historisch)

Einsatz: Strategische Grundsatzfragen, Systemdesign, Zukunftsentscheidungen

| Kürzel | Name | Historische Inspiration | Kernfrage |
|--------|------|------------------------|-----------|
| RK-01 | Ibn Khaldun | Historiker, Ökonom, Gesellschaftsdenker | Welche gesellschaftliche Dynamik & Zyklen stecken dahinter? |
| RK-02 | Al-Biruni | Wissenschaftler, Beobachter, Empiriker | Was sagen Fakten & direkte Beobachtung wirklich? |
| RK-03 | Ibn Rushd | Philosoph, Logiker, Rationalist | Ist die Logik dahinter wasserdicht — hält sie der Kritik stand? |
| RK-04 | Al-Kindi | Universalgelehrter, Erkenntnistheoretiker | Welches Wissen fehlt uns noch — was wissen wir nicht? |
| RK-05 | Al-Jazari | Ingenieur, Erfinder, Konstrukteur | Wie bauen wir es — praktisch, präzise, funktionierend? |

---

## 6. OUTPUT-FORMAT PRO SITZUNG

**Dateiname:** `RAT_[Datum]_[Thema-Kürzel].md`
**Ablage:** `A00b_Rat/Sitzungen/`

**Struktur:**
```
# RAT-Sitzung [Datum] — [Thema]

## Frage / Thema
[GF-Eingabe]

## RAT-N Urteile
RN-01 Skeptiker:        [Urteil]
RN-02 Stratege:         [Urteil]
RN-03 Analytiker:       [Urteil]
RN-04 Kostencontroller: [Urteil]
RN-05 Pragmatiker:      [Urteil]

## RAT-K Urteile
RK-01 Ibn Khaldun: [Urteil]
RK-02 Al-Biruni:   [Urteil]
RK-03 Ibn Rushd:   [Urteil]
RK-04 Al-Kindi:    [Urteil]
RK-05 Al-Jazari:   [Urteil]

## Konsolidierung
[1 Seite Zusammenfassung — Hauptspannungen, Konsens, offene Punkte]

## GF-Entscheidung
[ ] Offen
[ ] Entschieden: [Entscheidung]
```

---

## 7. ORDNERSTRUKTUR (ZUKÜNFTIG)

```
📁 02_KI-UNTERNEHMEN
├── 📁 A00_StabAgent        ← unverändert
├── 📁 A00b_Rat             ← NEU (noch nicht erstellt)
│   ├── README.md
│   ├── rat_regeln.md
│   ├── 📁 RAT-N/
│   │   └── identitaeten.md
│   ├── 📁 RAT-K/
│   │   └── identitaeten.md
│   └── 📁 Sitzungen/
└── [weitere Abteilungen]
```

---

## 8. OFFENE FRAGEN (VOR IMPLEMENTIERUNG)

| ID | Frage | Status |
|----|-------|--------|
| R-01 | Wer konsolidiert die 10 Urteile? A00a oder eigener A00b-Moderator? | OFFEN |
| R-02 | Wird RAT-Sitzung im Audit-Trail erfasst? | OFFEN |
| R-03 | Kann Hermes Rat-Sitzung vorschlagen oder nur GF? | OFFEN |
| R-04 | Maximale Anzahl paralleler Sitzungen? | OFFEN |

---

## 9. BEZUG ZU BESTEHENDEN SYSTEMEN

| System | Bezug |
|--------|-------|
| Sakana TRINITY | Inspiration: Thinker/Worker/Verifier → Q7 erweitert auf 10 Perspektiven |
| A00a Stab-Agent | Bleibt unverändert — A00b ist eigenständige Stabstelle |
| lern_loops.md | Rat-Sitzungen können als Lernquelle in Loop einfließen |
| GF-Entscheidungs-Queue (Teil B Kap. 31) | Rat-Output kann direkt in Queue einfließen |

---

*Q7-Rat Konzept v1.0 | Erstellt: 30.06.2026 | Status: Zukunfts-Feature — GF-Freigabe für Implementierung ausstehend*
