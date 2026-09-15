# P_024_A02_Digital-Audit_v2.2.md

**Prozess-ID:** P_024 | **Version:** v2.2 | **Erstellt:** 19.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** A02a (Marketing-Leiter) | Koordination: A01a (Hermes)
**Trigger:** Mystery Shopping abgeschlossen & freigegeben

---

## ZIEL

Vollstaendige digitale Bestandsaufnahme des Kunden und seiner Wettbewerber. Q7-Agenten analysieren alle digitalen Touchpoints ausfuehrlich und objektiv. Ergebnis bildet den digitalen Teil des IST-Zustands.

---

## ABLAUF

```
Mystery Shopping freigegeben
  → A01a (Hermes) weist Auftrag an A02a (Marketing-Leiter) zu
  → A02a verteilt intern an zustaendige Sub-Agenten
  → A02a uebernimmt Markt & Wettbewerb digital
  → Sub-Audits (P_025 GB, P_026 WEB, P_022 IG, P_027 TikTok, FB/IG-Pendants) werden parallel durchgefuehrt
  → A01a konsolidiert Gesamtreport (DA_KONSOLIDIERT)
  → GF Freigabe → SWOT-Analyse (P_028) startet
```

---

## DATENBESCHAFFUNGS-PRINZIP

```
Q7-Analyse-Agenten (Claude-basiert) haben KEINEN nativen Plattform-Zugriff
auf Drittanbieter-Oekosysteme (Meta/Facebook/Instagram, Google/YouTube/
Google Business, etc.) — anders als plattformeigene KIs. Das ist eine
dauerhafte Systemgrenze, kein temporaerer Mangel.

→ Rohdaten-Beschaffung erfolgt durch:
  a) GF (manuell, Screenshot/Export), ODER
  b) eine externe, plattform-autorisierte KI/Tool-Instanz, deren Output
     anschliessend als strukturierter Input uebergeben wird, ODER
  c) Agent-Eigenrecherche, sofern Web-Zugriff im jeweiligen Setup
     verfuegbar ist

Der Q7-Agent (A02a) ist verantwortlich fuer AUSWERTUNG, Bewertung,
Einordnung — NICHT zwingend fuer die Beschaffung selbst.

Jeder Bereich im Report wird mit Datenquelle gekennzeichnet:
→ "Agent-Eigenrecherche" / "GF-Zulieferung" / "Datenluecke — nicht geprueft"
```

---

## SUB-AUDITS VS. KONSOLIDIERUNG

```
Um Doppelarbeit und Namenskonflikte zu vermeiden, gilt folgende Struktur:

1. DETAIL-Ebene (Sub-Audits, eigenstaendige Prozess-IDs):
   → Hier werden die eigentlichen Checklisten abgearbeitet.
   → Dateien: FB_AUDIT_, IG_AUDIT_ (P_022), GB_AUDIT_ (P_025),
     WEB_AUDIT_ (P_026), TT_AUDIT_ (P_027)
   → Verantwortlich: A02a (Marketing-Leiter, Experte je Plattform)

2. KONSOLIDIERUNGS-Ebene (P_024):
   → A01a (Hermes) fasst alle Sub-Audits in EINEM Report zusammen.
   → Datei: DA_KONSOLIDIERT_[Datum]_[Kundenname].md
   → Verantwortlich: A01a (Hermes)

3. DNA-Uebergabe:
   → A01a uebertraegt die aggregierten E-Werte aus den Sub-Audits
     direkt in dna-analyse_VORLAGE_v5.0.md (Strang 2).
   → Es gibt KEINE separaten DA_[Bereich].md Dateien mehr.
```

---

## ANALYSE-BEREICHE

**1. Website (→ P_026 WEB_AUDIT)**
- Design & UX (Benutzerfuehrung, Struktur, Lesbarkeit)
- Mobile Optimierung
- Ladegeschwindigkeit
- Inhalt & Texte (Qualitaet, Tonalitaet, SEO)
- Call-to-Actions
- Kontaktmoeglichkeiten
- Impressum & Datenschutz (rechtliche Vollstaendigkeit)
- Domain-Markenkonsistenz (Pflichtpruefpunkt)

**2. Social Media (→ P_022 IG, FB-Pendant, P_027 TikTok)**
- Vorhandene Kanaele (FB, Instagram, TikTok, LinkedIn etc.)
- Follower-Anzahl & Wachstumstrend
- Posting-Frequenz & Regelmaessigkeit
- Content-Qualitaet (Bild, Text, Video)
- Engagement-Rate (Likes, Kommentare, Shares)
- Tonalitaet & Markenkonsistenz
- Reaktion auf Kommentare

**3. Google Business (→ P_025 GB_AUDIT)**
- Profil vollstaendig ausgefuellt?
- Bewertungs-Score & Anzahl Bewertungen
- Aktualitaet der Informationen (Oeffnungszeiten, Fotos)
- Antworten auf Bewertungen
- Google Posts aktiv?

**4. Online-Bewertungen (→ in P_025 GB_AUDIT integriert)**
- Google Bewertungen (Score + Analyse Hauptthemen)
- Tripadvisor / Yelp / branchenspezifische Plattformen
- Wiederkehrende Lob-Punkte
- Wiederkehrende Kritik-Punkte

**5. Wettbewerb Digital (→ in ALLEN Sub-Audits parallel geprueft)**
- Gleiche Analyse fuer Top 2–3 Wettbewerber
- Direktvergleich je Kategorie
- Was machen sie besser?
- Was machen sie schlechter?

**6. Markenidentitaet Digital (→ in ALLEN Sub-Audits Section C geprueft)**
- Logo-Konsistenz ueber alle Kanaele
- Farbwelt & Typografie einheitlich?
- Tonalitaet & Sprache konsistent?
- Wiedererkennungswert
- Domain-Check: Eigene Markendomain vorhanden & konsistent ueber alle Kanaele verlinkt? **(PFLICHTPRUEFPUNKT)**

---

## PRUEFTIEFE-MINDESTSTANDARD

```
Ein Analyse-Bereich gilt erst als "GEPRUEFT", wenn folgende
Mindestkriterien erfuellt sind:

1. SOCIAL MEDIA
   → Mind. 3 der letzten Posts inhaltlich ausgewertet (nicht nur
     Follower-/Post-Zahl)
   → Zeitraum der letzten 6 Monate abgedeckt (oder vollstaendige
     Historie, falls Account juenger)

2. WEBSITE
   → Startseite + mind. 1 Unterseite inhaltlich gesichtet
   → Nicht ausreichend: nur Domain-Name notiert

3. GOOGLE BUSINESS
   → Rating + Bewertungsanzahl UND mind. 3 Bewertungs-Inhalte
     (Tenor/Themen) erfasst — nicht nur die nackte Zahl

4. ONLINE-BEWERTUNGEN
   → Mind. 1 Plattform ausserhalb Google geprueft, ODER explizit als
     "nicht vorhanden/nicht relevant" bestaetigt

5. WETTBEWERB DIGITAL
   → Mind. 2 Wettbewerber, JEWEILS in mind. 2 der obigen Kategorien
     erfasst (nicht: 1 Wettbewerber nur digital, 1 nur physisch)

6. MARKENIDENTITAET DIGITAL
   → Domain-Check ist Pflichtpruefpunkt, kein optionaler Punkt
```

**Freigabe-Schwelle:**

```
Report ist NUR freigabefaehig fuer SWOT-Analyse (P_028), wenn mindestens
4 von 6 Bereichen den Pruefiefe-Mindeststandard erfuellen.

Bei < 4/6 erfuellten Bereichen:
→ Status zwingend "🟠 Teilreport" (nie "✅ Freigegeben")
→ GF muss aktiv bestaetigen, dass mit den vorliegenden Luecken
  weitergearbeitet wird (analog Fallback-Logik Mystery Shopping)
→ Jede Luecke wird im konsolidierten Report explizit benannt
```

---

## BEWERTUNGSSYSTEM

| Bewertung | Bedeutung |
|:---------:|-----------|
| ⭐⭐⭐⭐⭐ | Exzellent — Benchmark-Niveau |
| ⭐⭐⭐⭐ | Gut — kleine Optimierungen moeglich |
| ⭐⭐⭐ | Durchschnitt — Handlungsbedarf |
| ⭐⭐ | Schwach — dringender Handlungsbedarf |
| ⭐ | Kritisch — sofortige Massnahmen noetig |

---

## DATEISTRUKTUR OUTPUT

```
05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
    ├── FB_AUDIT_[Datum]_[Kundenname].md      ← Facebook Sub-Audit
    ├── IG_AUDIT_[Datum]_[Kundenname].md      ← P_022
    ├── GB_AUDIT_[Datum]_[Kundenname].md      ← P_025
    ├── WEB_AUDIT_[Datum]_[Kundenname].md     ← P_026
    ├── TT_AUDIT_[Datum]_[Kundenname].md      ← P_027 (optional)
    └── DA_KONSOLIDIERT_[Datum]_[Kundenname].md ← A01a Summary (P_024)

⚠️  Fruehere DA_[Bereich].md Dateien entfallen ersatzlos.
    Die Sub-Audits sind die Source of Truth fuer die Details.
```

> Flache Struktur gemaess Teil C — keine Unterordner in KD_[Nr]_[Name]/

---

## KONSOLIDIERTER REPORT (DA_KONSOLIDIERT)

**Erstellt durch:** A01a (Hermes)
**Inhalt:**
- Gesamtbewertung je Bereich (Tabelle)
- Pruefiefe-Status je Bereich (Mindeststandard erfuellt: Ja/Nein)
- Datenquelle je Bereich (Agent-Eigenrecherche / GF-Zulieferung / Datenluecke)
- Staerkste digitale Punkte
- Kritischste digitale Luecken
- Direktvergleich Kunde vs. Wettbewerb
- Top 5 sofortige Handlungsempfehlungen

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Auftragsverteilung | A01a (Hermes) → A02a (Marketing-Leiter) |
| Sub-Audits durchfuehren (FB/IG/GB/WEB/TT) | A02a |
| Konsolidierung (DA_KONSOLIDIERT) | A01a + A05a (QM-Leiter) |
| Uebergabe an DNA Strang 2 | A01a |
| Freigabe → SWOT-Analyse (P_028) | GF |

---

## QUALITAETS-REGELN

```
⚠️  Jeder Befund mit konkretem Beispiel belegen
⚠️  Keine Meinungen — nur belegbare Fakten & Beobachtungen
⚠️  Wettbewerb-Analyse: mindestens 2, maximal 3 Hauptwettbewerber
⚠️  Pruefiefe-Mindeststandard ist Pflicht — kein Bereich gilt durch
    blosse Erwaehnung als "geprueft"
⚠️  Datenquelle muss je Bereich gekennzeichnet sein
```

---

## OUTPUT

```
📄 DA_KONSOLIDIERT_[Datum]_[Kundenname].md → freigegeben
   (nur bei ≥4/6 Bereichen mit erfuellter Pruefiefe)
→ GF Freigabe → SWOT-Analyse (P_028) startet
```

---

## AENDERUNGSHISTORIE

| Version | Datum | Aenderung | Verantwortlich |
|---------|-------|-----------|----------------|
| v2.1 | 27.06.2026 | Uebergabe-Logik Sub-Audits vs. DA-Dateien geklaert | A09a (Doku-Leiter) |
| v2.2 | 28.06.2026 | BUG-04 behoben — Bewertungstabelle korrigiert | A09a (Doku-Leiter) |
| v2.2 (Migration) | 28.06.2026 | ID-Migration P_016.3 → P_024, Dateiname konformiert, A[NR]a-Schema, ae/oe/ue/ss, Sub-Audit-Verweise auf neue IDs (P_022/P_025/P_026/P_027) aktualisiert | A09a (Doku-Leiter) |

---

*P_024_A02_Digital-Audit_v2.2.md | Q7-System v23.5 | 28.06.2026*
