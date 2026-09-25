# P_023 — Kundengespräch-Wunschermittlung

**Version:** v2.0 | **Erstellt:** 19.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** GF (persönlich) | Vorbereitung: Hermes (A01)
**Trigger:** P_024 Digital-Audit abgeschlossen & freigegeben

---

## ZIEL

GF führt persönliches Gespräch mit dem Kunden. Ziele, Wünsche und Vision des Kunden werden erfasst. Grundlage für die interne Bedarfsanalyse (P_031).

---

## ABLAUF

```
P_024 freigegeben
  → Hermes erstellt Gesprächsleitfaden auf Basis IST-Zustand
  → GF erhält Leitfaden + IST-Zusammenfassung
  → GF führt Gespräch mit Kunde (persönlich / Video)
  → GF dokumentiert Ergebnisse inkl. offener Punkte
  → Protokoll wird in System abgelegt
  → GF Freigabe → P_030b startet
```

---

## VORBEREITUNG (Hermes)

Hermes erstellt für den GF:

```
📄 VORBEREITUNG_[Datum]_[Kundenname]_GF-Gespräch.md

Inhalt:
→ IST-Zustand Kurzfassung (Top 5 Gaps, Top 3 Stärken)
→ Gesprächsleitfaden mit Fragen
→ Kritische Punkte die angesprochen werden müssen
→ Was der Kunde vermutlich sagen wird (Hypothesen)
```

---

## GESPRÄCHSLEITFADEN

### Block 1 — Ziele & Vision
```
→ Was ist Ihr Ziel in 12 Monaten?
→ Was ist Ihr Ziel in 3 Jahren?
→ Was bedeutet Erfolg für Sie persönlich?
→ Was würde sich für Sie am meisten verändern müssen?
```

### Block 2 — Selbstwahrnehmung
```
→ Was glauben Sie macht Sie besser als den Wettbewerb?
→ Wo sehen Sie Ihre größten Schwächen?
→ Was haben Kunden bisher gelobt?
→ Was haben Kunden bisher kritisiert?
```

### Block 3 — Wünsche & Prioritäten
```
→ Was möchten Sie auf keinen Fall ändern?
→ Was würden Sie sofort ändern wenn Sie könnten?
→ Welche Bereiche haben für Sie höchste Priorität?
→ Was erwarten Sie von Q7?
```

### Block 4 — Ressourcen & Rahmenbedingungen
```
→ Welches Budget steht zur Verfügung?
→ Welchen Zeitrahmen haben Sie?
→ Gibt es interne Einschränkungen?
→ Wer ist intern der Entscheider?
```

### Block 5 — Offene Punkte & Ideen
```
→ Was haben wir noch nicht besprochen?
→ Was beschäftigt Sie am meisten gerade?
→ Haben Sie eigene Ideen die Sie umsetzen möchten?
→ Was dürfen wir auf keinen Fall vergessen?
```

---

## GESPRÄCHSPROTOKOLL

**Dateiname:** `KG_[Datum]_[Kundenname]_Gespraechsprotokoll.md`

```
Datum:
Teilnehmer:
Dauer:

ZIELE DES KUNDEN:
→

WÜNSCHE DES KUNDEN:
→

WAS DER KUNDE NICHT WILL:
→

BUDGET-RAHMEN:
→

ZEITRAHMEN:
→

WICHTIGE AUSSAGEN (Zitate):
→

ERSTE EINSCHÄTZUNG GF:
→
```

---

## OFFENE PUNKTE / NACHVERFOLGEN (Pflichtfeld)

**Pflichtfeld — immer ausfüllen, auch wenn leer:**

```
OFFENE PUNKTE AUS DIESEM GESPRÄCH:

→ Punkt 1: [Beschreibung]
  Status: Offen / Geklärt
  Klärung bis: [Datum]
  Verantwortlich: GF / Hermes

→ Punkt 2: [Beschreibung]
  Status: Offen / Geklärt
  Klärung bis: [Datum]
  Verantwortlich: GF / Hermes

(weitere Punkte nach Bedarf)

KEINE OFFENEN PUNKTE: ☐ (explizit bestätigen wenn leer)
```

**Regel:** Offene Punkte aus diesem Feld werden automatisch
in P_031 als "Ungeklärte Kundenwünsche — vor Abschluss klären"
übernommen. Hermes ist verantwortlich für die Nachverfolgung.

---

## ABLAGESTRUKTUR

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
└── 06_Kundengespräch/
    ├── VORBEREITUNG_[Datum]_[Kundenname]_GF-Gespräch.md
    └── KG_[Datum]_[Kundenname]_Gespraechsprotokoll.md
```

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Gesprächsleitfaden erstellen | Hermes (A01) |
| Gespräch führen | GF (persönlich) |
| Protokoll erstellen | GF |
| Offene Punkte nachverfolgen | Hermes (A01) |
| Ablage & Weiterleitung | Hermes (A01) |
| Freigabe → P_030b | GF |

---

## QUALITÄTS-REGELN

```
⚠️  GF führt dieses Gespräch immer persönlich — kein Agent
⚠️  Protokoll max. 24h nach Gespräch fertigstellen
⚠️  Kundenwünsche 1:1 dokumentieren — keine Interpretation
⚠️  Offene Punkte Feld ist PFLICHT — auch wenn leer explizit bestätigen
⚠️  Interpretation erfolgt erst in P_031
⚠️  Offene Punkte werden von Hermes nachverfolgt bis geklärt
```

---

## OUTPUT

```
📄 KG_[Datum]_[Kundenname]_Gespraechsprotokoll.md → freigegeben
→ Offene Punkte an Hermes übergeben
→ GF Freigabe → P_030b startet
```

---

*P_023_A01_Kunden-Gespraech-Wunsch_v2.0.md | Q7-System v22.0*
*v2.0: Offene Punkte / Nachverfolgen Pflichtfeld ergänzt (BUG_006 behoben)*
*Dateiname korrigiert: Konvention P_[ID]_[AGENT]_[NAME]_v[X].md*
