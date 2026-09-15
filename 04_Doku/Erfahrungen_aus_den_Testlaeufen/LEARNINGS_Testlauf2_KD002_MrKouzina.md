# LEARNINGS — TESTLAUF 2 — KD_002_MrKouzina
**Datum:** 21.06.2026 | **System-Version:** v21.0 | **Erstellt durch:** Hermes (H-00)

---

## 1. PROZESS-LEARNINGS

### P_016.1 — Kunden-Stammdaten-Aufnahme
```
✅ GUT GELAUFEN:
→ A14 PII-Trennung funktionierte reibungslos
→ Quarantäne-Prüfung korrekt (v1.0 Formular erkannt)
→ DP1 "Frage statt Annahme" konsequent angewendet
→ Fehlende Pflichtfelder (Scope, Geschäftsmodell) 
  sauber nachgefragt

⚠️  VERBESSERUNGSBEDARF:
→ Kunde hat v1.0 Formular eingereicht statt v2.0
   → Lösung: Beim Kundenkontakt immer v2.0 mitsenden
→ Eingangsdatum fehlte — sollte vom System 
  automatisch gesetzt werden
```

### P_016.2 — Mystery Shopping
```
✅ GUT GELAUFEN:
→ Wettbewerber-Eigenrecherche durch Hermes/A12
  funktionierte (Google-Suche statt GF fragen)
→ Flexibler Testplan (Variante A) korrekt angewendet
→ Fallback 1-Tester korrekt dokumentiert
→ Ixina als Nicht-Direktkonkurrent erkannt & begründet

⚠️  VERBESSERUNGSBEDARF:
→ BUG_010: A12 muss Eigenrecherche-Pflicht haben —
  Wettbewerber selbst suchen bevor GF gefragt wird
  (bereits als Bug geloggt)
→ Tester-Protokoll teilweise nur mündlich —
  strukturierter Bogen sollte konsequent ausgefüllt werden
→ Wettbewerber-Screenshots digital = wertvolles Material
  Empfehlung: Standard-Checkliste für digitalen 
  Wettbewerber-Scan mitgeben
```

### P_016.3 — Digital Audit
```
✅ GUT GELAUFEN:
→ Screenshot-basierter Audit funktioniert gut
→ Direktvergleich Wettbewerb war präzise & belastbar
→ Facebook-Inaktivität (seit 2025) als strategische 
  Chance erkannt
→ Fehlende Instagram-Präsenz Dar Cuisines 
  korrekt verifiziert

⚠️  VERBESSERUNGSBEDARF:
→ Web-Fetch von Facebook/Instagram nicht möglich
  (robots.txt blockiert) — Screenshots vom GF nötig
  Empfehlung: Standard-Screenshot-Liste für GF definieren
→ Falsche URL in Bio (stadt-junge.de) erst spät entdeckt
  → In P_016.3 Checkliste aufnehmen: "URL in Bio prüfen"
→ Follower-Zahlen aus Recherche vs. Screenshot 
  differierten — Screenshot ist immer Quelle der Wahrheit
```

### P_016.4 — SWOT-Analyse
```
✅ GUT GELAUFEN:
→ SWOT vollständig aus vorhandenen Daten abgeleitet
→ Scope C korrekt berücksichtigt (keine CI-Entwicklung)
→ Strategische Ableitungen SO/ST/WO/WT erstellt
→ USP "Reiner Küchenfachhandel" klar herausgearbeitet

⚠️  VERBESSERUNGSBEDARF:
→ SWOT ohne eigenen Showroom-Besuch gestartet
  → Reihenfolge korrekt: P_016.2 erst vollständig
  abschließen, dann SWOT — diesmal korrekt gewartet ✅
```

### P_016.6 — Gap-Analyse
```
✅ GUT GELAUFEN:
→ Vollständige Gap-Tabelle mit Direktvergleich
→ P_016.5 Benchmarks korrekt übersprungen (Scope C)
→ Executive Summary präzise & verwendbar

⚠️  VERBESSERUNGSBEDARF:
→ Finanzieller Gap konnte nicht bewertet werden
  (kein Finanz-Scope) — korrekt dokumentiert als
  "außerhalb Scope C" ✅
```

---

## 2. SYSTEM-LEARNINGS

### Prozess-Lücken entdeckt
```
BUG_010 (NEU):
→ A12_Zukunftsforschung muss Wettbewerber-Recherche
  selbständig durchführen wenn keine Namen vorliegen
→ Fix: P_016.2 + A12_Wissensbasis ergänzen

BESTÄTIGT aus Testlauf 1:
→ BUG_009 (behoben): .md Whitelist ✅
→ A14 PII-Trennung funktioniert stabil ✅
```

### Formular-Management
```
→ Kunden reichen alte Formular-Versionen ein
→ Empfehlung: Versionsprüfung in Quarantäne-Filter 3
  aufnehmen — bei veralteter Version Hinweis an GF
```

### Screenshot als Arbeitsgrundlage
```
→ GF-Screenshots sind primäre Datenquelle für 
  Social Media Analyse — das funktioniert gut
→ Standard-Checkliste "Was soll GF screenshotten" 
  für P_016.3 erstellen → spart Zeit & Rückfragen
```

---

## 3. STRATEGISCHE LEARNINGS

### Über den Markt Marrakesch
```
→ Küchen-Markt digital stark unterentwickelt
→ Kein Wettbewerber hat konsistente Social-Media-Präsenz
→ Google Business ist der entscheidende Kanal (lokal)
→ Authentische Projekt-Fotos sind Differenzierungsmerkmal
→ "Spezialisierung" schlägt "Vollsortiment" 
  in der Wahrnehmung
```

### Über den Kunden-Typ Maßanfertiger
```
→ Keine Produktliste → Leistungsprofil + Referenzfotos
→ Referenzfotos = wichtigstes Asset (meist Baustelle)
  → Empfehlung für künftige Kunden: 
  Fertigfotos vor & nach beauftragen
→ Preisrange "Standard bis Premium" = breite Zielgruppe
  → In Bedarfsanalyse P_016.8 klären welches 
  Segment primär angesprochen werden soll
```

### Über Scope C (Nur Digital)
```
→ Scope C ist sinnvoll wenn CI bereits vorhanden
→ Bei MrKouzina: CI nicht vorhanden + Scope C = 
  Konflikt → muss in P_016.8 angesprochen werden
→ Empfehlung für P_016.3: Wenn keine Markenidentität
  vorhanden → automatisch als Pflichtbaustein 
  vormerken auch bei Scope C
```

---

## 4. QUALITÄTS-LEARNINGS

### Was gut funktioniert hat
```
✅ DP1 "Frage statt Annahme" — konsequent angewendet
✅ Eigenrecherche Wettbewerb — nach Hinweis korrekt
✅ Strategische Einschätzungen waren präzise & belastbar
✅ USP-Identifikation ("Reiner Küchenfachhandel")
✅ Präsentation + PDF als Deliverable — professionell
✅ Prozess-Fluss P_016.1 → .2 → .3 → .4 → .6 stabil
```

### Was verbessert werden muss
```
⚠️  Standard-Screenshot-Checkliste für GF fehlt
⚠️  Formular-Versionsprüfung in Quarantäne fehlt
⚠️  Baustellen-Fotos vs. Fertigfotos — 
    Empfehlung an Kunden fehlt in Prozess
⚠️  Scope C + keine CI = automatischer Hinweis 
    fehlt in P_016.3/P_016.8
```

---

## 5. EMPFEHLUNGEN FÜR V22.0

```
1. P_016.3 — Checkliste "URL in Bio prüfen" ergänzen
2. P_016.2 — A12 Eigenrecherche-Pflicht formalisieren
   (BUG_010 beheben)
3. Auftragsformular — Versionsprüfung in H-01 Filter 3
4. P_016.1 — Empfehlung "Fertigfotos beauftragen" 
   bei Maßanfertigern ergänzen
5. P_016.8 — Automatischer Hinweis wenn 
   Scope C + keine CI vorhanden
6. P_016.3 — Standard-Screenshot-Checkliste für GF
   als Anhang definieren
```

---

## 6. GESAMTBEWERTUNG TESTLAUF 2

```
System-Stabilität:    ⭐⭐⭐⭐   (gut, kleine Lücken)
Prozess-Treue:        ⭐⭐⭐⭐⭐  (konsequent eingehalten)
Datenqualität:        ⭐⭐⭐⭐   (Screenshots sehr hilfreich)
Deliverable-Qualität: ⭐⭐⭐⭐⭐  (Präsentation professionell)
DP1-Anwendung:        ⭐⭐⭐⭐⭐  (keine Annahmen gemacht)

FAZIT:
Testlauf 2 war stabiler als Testlauf 1.
Haupterkenntnis: Das System funktioniert —
die verbleibenden Bugs sind Optimierungen,
keine strukturellen Probleme.
P_016 ist bereit für weitere Realkunden.
```

---

*LEARNINGS_Testlauf2_KD002_MrKouzina.md | Q7-System v21.0 | 21.06.2026*
