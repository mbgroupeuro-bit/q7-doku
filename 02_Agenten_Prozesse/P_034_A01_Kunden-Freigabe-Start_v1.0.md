# P_034 — Kunden-Freigabe & Umsetzungsstart

**Version:** v1.0 | **Erstellt:** 19.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** GF (persönlich) | Nachbereitung: Hermes (A01)
**Trigger:** P_033 abgeschlossen & freigegeben

---

## ZIEL

Präsentation beim Kunden durchführen, Feedback einholen, Anpassungen vornehmen und nach Kunden-Freigabe die Umsetzungsphase starten. Abschluss des P_016–P_034 Analyseprozesses.

---

## ABLAUF

```
P_033 freigegeben
  → GF präsentiert beim Kunden (persönlich)
  → Kunde gibt Feedback & Anpassungswünsche
  → GF dokumentiert Feedback
  → Hermes koordiniert Anpassungen (falls nötig)
  → Überarbeitete Version → erneute Kunden-Freigabe
  → Kunden-Freigabe erteilt
  → Umsetzungsphase startet als regulärer Auftrag
```

---

## ABLAUF PRÄSENTATIONS-TERMIN

### Vor dem Termin
```
→ GF hat Präsentation & PDF-Report
→ GF hat Backup aller Dokumente
→ GF kennt die kritischen Punkte (Pflichtbausteine)
→ Hermes hat offene Fragen-Liste vorbereitet
```

### Während des Termins
```
→ GF präsentiert Slides (P_033)
→ Ergebnisse IST-Zustand erklären
→ Pflichtbausteine klar & ehrlich kommunizieren
→ SOLL-Zustand & Roadmap vorstellen
→ Fragen beantworten
→ PDF-Report übergeben
```

### Nach dem Termin
```
→ GF dokumentiert Kunden-Feedback (max. 24h)
→ Anpassungswünsche prüfen
→ Falls Anpassungen nötig: neue Version erstellen
→ Falls Freigabe erteilt: Umsetzung starten
```

---

## KUNDEN-FEEDBACK PROTOKOLL

**Dateiname:** `KF_[Datum]_[Kundenname]_Feedback-Präsentation.md`

```
Datum Termin:
Anwesende:
Dauer:
Gesamtreaktion Kunde:

POSITIVES FEEDBACK:
→

KRITISCHES FEEDBACK:
→

ANPASSUNGSWÜNSCHE:
→ Änderung 1:
→ Änderung 2:
→ Änderung 3:

OFFENE FRAGEN KUNDE:
→

ENTSCHEIDUNG KUNDE:
☐ Freigabe erteilt — Umsetzung startet
☐ Anpassungen gewünscht — neue Version nötig
☐ Bedenkzeit — Follow-up Termin:

NÄCHSTE SCHRITTE:
→
```

---

## FREIGABE-SZENARIEN

### Szenario A — Direkte Freigabe
```
Kunde gibt grünes Licht
→ Freigabe-Dokument unterzeichnen
→ Hermes erstellt ersten Umsetzungsauftrag
→ Roadmap Phase 1 startet
→ Analyseprozess abgeschlossen ✅
```

### Szenario B — Anpassungen gewünscht
```
Kunde möchte Änderungen
→ GF dokumentiert Änderungswünsche
→ Hermes koordiniert Überarbeitung
→ Neue Version erstellt (v2)
→ Erneuter Termin → zurück zu Szenario A oder B
```

### Szenario C — Bedenkzeit
```
Kunde braucht Zeit
→ Follow-up Termin vereinbaren (max. 14 Tage)
→ PDF-Report wurde übergeben
→ GF bleibt in Kontakt
→ Nach Freigabe → Szenario A
```

---

## UMSETZUNGSSTART

Nach Kunden-Freigabe:

```
Hermes erstellt:
→ AUF_[Datum]_[Kundenname]_Phase1_Umsetzung
→ Aufgaben je Meilenstein aus P_032
→ Zuweisung an Fachabteilungen
→ Checkpoint-Plan für GF

Erster Auftrag läuft regulär durch Q7-System:
→ 01_INPUT → Hermes → Fachabteilungen → QM → GF-Freigabe → OUTPUT
```

---

## ABLAGESTRUKTUR

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
└── 10_Freigabe_Umsetzung/
    ├── KF_[Datum]_[Kundenname]_Feedback-Präsentation.md
    ├── FREIGABE_[Datum]_[Kundenname]_Kunde.md
    └── AUF_[Datum]_[Kundenname]_Phase1_Start.md
```

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Präsentation durchführen | GF (persönlich) |
| Feedback dokumentieren | GF |
| Anpassungen koordinieren | Hermes (A01) |
| Freigabe-Dokument | A07_Recht + GF |
| Umsetzungsauftrag erstellen | Hermes (A01) |
| Umsetzung starten | Fachabteilungen A02–A13 |

---

## QUALITÄTS-REGELN

```
⚠️  GF führt Präsentation immer persönlich — kein Agent
⚠️  Pflichtbausteine werden nicht verhandelbar kommuniziert
⚠️  Feedback-Protokoll max. 24h nach Termin fertig
⚠️  Ohne schriftliche Kunden-Freigabe startet keine Umsetzung
⚠️  Anpassungen max. 2 Runden — danach GF entscheidet
```

---

## PROZESS-ABSCHLUSS

```
P_034 abgeschlossen =
Kunden-Analyse & Transformationsprozess vollständig ✅

→ Kunde ist vollständig aufgenommen & analysiert
→ IST-Zustand dokumentiert
→ SOLL-Zustand & Roadmap vereinbart
→ Umsetzung läuft als regulärer Q7-Auftrag
→ Alle Dokumente in KD_[Nr]_[Name]/ abgelegt
→ Audit-Trail vollständig
```

---

## OUTPUT

```
📄 FREIGABE_[Datum]_[Kundenname]_Kunde.md → unterzeichnet
📄 AUF_[Datum]_[Kundenname]_Phase1_Start.md → erstellt
→ Umsetzungsphase aktiv
→ Analyseprozess vollständig abgeschlossen ✅
```

---

*P_034_A01_Kunden-Freigabe-Start_v1.0.md | Q7-System v22.0*
*Dateiname korrigiert: Konvention P_[ID]_[AGENT]_[NAME]_v[X].md*
