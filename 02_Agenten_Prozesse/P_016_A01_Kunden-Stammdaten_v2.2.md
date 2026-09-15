# P_016_A01_Kunden-Stammdaten_v2.2.md

**Prozess-ID:** P_016 | **Version:** v2.2 | **Erstellt:** 20.06.2026 | **Aktualisiert:** 28.06.2026
**Verantwortung:** GF + A01a (Hermes) + A08a (DRI-Gatekeeper)
**Trigger:** Neuer Kunde freigegeben (z. B. nach Vertragsabschluss A03 → A04, oder manueller GF-Start)

---

## ZIEL

Einen neuen Kunden sauber im System anlegen. Trennung von personenbezogenen Daten (TRESOR) und betrieblichem Wissen (UNTERNEHMEN) von Beginn an korrekt durchführen. Grundlage für alle nachfolgenden Schritte.

---

## ABLAUF

```
Neuer Kunde freigegeben (Auftragsformular in 01_INPUT/02_Eingang)
  → Quarantäne: 3-Filter-Prüfung
  → A14_Sicherheit: PII-Trennung (Kontaktdaten → 04_TRESOR),
    bereinigte Datei zurück in 02_Eingang
  → ERST JETZT: A01a (Hermes) erhält Zugriff
  → A01a vergibt Kundennummer (KD_[Nr])
  → A01a legt Ordnerstruktur an (05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/)
  → A01a erfasst betriebliche Stammdaten → stammdaten.md
  → Brand Assets (falls vorhanden) werden gesichert
  → A05a (QM-Leiter) prüft Vollständigkeit
  → GF Freigabe → Prozess startet

Hinweis: A08a (DRI-Gatekeeper) ist zuständig für laufende
TRESOR-Verarbeitung im Betrieb (z. B. Rechnungsstellung), NICHT für
die Eingangs-PII-Trennung — das übernimmt ausschließlich A14_Sicherheit.
```

---

## DATENTRENNUNG (Pflichtprinzip)

```
WICHTIGSTE REGEL VON P_016:

Personenbezogene & sicherheitskritische Daten  → 04_TRESOR/K4_Personen/KD_[Nr]
Betriebliches Wissen & Analysefähiges Material  → 05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]

Nur A08a (DRI-Gatekeeper) darf TRESOR-Daten verarbeiten.
A01a (Hermes) verarbeitet NIEMALS personenbezogene Daten direkt.
```

| Datentyp | Beispiel | Ablageort |
|----------|----------|-----------|
| Name, Adresse, Telefon, E-Mail (Ansprechpartner) | Max Mustermann, 0151... | 04_TRESOR/K4_Personen/KD_[Nr] |
| Bankdaten, Vertragskonditionen | IBAN, Zahlungsplan | 04_TRESOR/K4_Zahlungen |
| Zugangsdaten (Google Business, Social Media) | Logins | 04_TRESOR/K4_Zugangsdaten |
| Unternehmensname, Branche, Filialanzahl | "Café Bohne, Gastronomie, 2 Filialen" | 05_UNTERNEHMEN/09_Kunden/.../stammdaten.md |
| Logo, Farbwelt, bestehende Markenmaterialien | Logo-Dateien, Styleguide | 05_UNTERNEHMEN/09_Kunden/.../brand_assets/ |
| Produkt-/Leistungsangebot | Speisekarte, Servicekatalog | 05_UNTERNEHMEN/09_Kunden/.../produkte.md |

---

## KUNDENNUMMER-VERGABE

```
Format: KD_[3-stellig]_[Kurzname]
Beispiel: KD_001_CafeBohne

Regel:
→ Fortlaufend, nie wiederverwendet (auch bei Kundenverlust)
→ Kurzname: max. 15 Zeichen, keine Leerzeichen/Sonderzeichen
→ KD_000_MUSTER bleibt reserviert als Vorlage — nie als echter Kunde vergeben
```

---

## STAMMDATEN-STRUKTUR (Pflichtformat)

**Dateiname:** `stammdaten.md`

```
KUNDE:
→ Firmenname:
→ Kundennummer: KD_[Nr]
→ Branche:
→ Anzahl Standorte/Filialen:
→ Gruendungsjahr (falls bekannt):

GESCHAEFTSMODELL:
→ Kernleistung:
→ Zielgruppe (laut Kunde):
→ Preispositionierung (guenstig/mittel/premium):

ANSPRECHPARTNER (Verweis):
→ Siehe 04_TRESOR/K4_Personen/KD_[Nr] fuer Kontaktdaten

VERTRAGSRAHMEN:
→ Auftragsumfang:
→ Start-Datum P_016:
→ Verweis Zahlungsplan: 04_TRESOR/K4_Zahlungen/KD_[Nr]

ERSTE GF-EINSCHAETZUNG:
→ Warum dieser Kunde, was ist die strategische Ausgangslage?
```

---

## BRAND ASSETS — AUFNAHME (falls vorhanden)

```
Pruefen & sichern unter brand_assets/:
→ Logo (alle vorhandenen Varianten/Formate)
→ Bestehende Farbwerte (falls dokumentiert)
→ Bestehender Styleguide (falls vorhanden)
→ Bestehende Werbemittel/Broschueren als Referenz

Falls NICHTS vorhanden:
→ In stammdaten.md vermerken: "Keine Brand Assets vorhanden"
→ Wird automatisch Input fuer P_019 Pflichtbaustein-Pruefung
```

---

## PRODUKTE/LEISTUNGEN — AUFNAHME

**Dateiname:** `produkte.md`

```
VARIANTE A — KATALOG/PRODUKTLINIE:
→ Produkt-/Leistungsliste (so vollstaendig wie moeglich)
→ Preisspanne (grob, falls vom Kunden mitgeteilt)
→ Besonderheiten/Alleinstellungsmerkmale (laut Kunde, unverifiziert)

VARIANTE B — MASSANFERTIGUNG/PROJEKTGESCHAEFT:
→ Leistungsprofil (Art der Massanfertigung, Stilrichtung, Material,
  typische Projektgroesse)
→ Anzahl/Umfang bisheriger Referenzprojekte
→ Referenzfotos/-videos (falls vorhanden) — Verweis auf brand_assets/
→ Positionierungs-Hinweis: Ist der Kunde am Markt mit einer
  Spezialisierung verankert? Falls ja: als Staerke-Punkt fuer SWOT vormerken.
→ Preispositionierung (grob)

VARIANTE C — MISCHFORM:
→ Kombination aus A und B

Hinweis: Vollstaendige Verifizierung erfolgt erst spaeter.
P_016 erfasst nur den Ausgangsstand laut Kundenangabe.
```

---

## ABLAGESTRUKTUR

```
04_TRESOR/K4_Personen/KD_[Nr]_[Name]/
└── kontaktdaten.md
└── zugangsdaten.md (falls vorhanden)

05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/
├── stammdaten.md
├── produkte.md
└── brand_assets/
    └── (Logo, Styleguide, etc. — falls vorhanden)
```

---

## BETEILIGTE

| Aufgabe | Verantwortung |
|---------|--------------|
| Rohdaten liefern | GF |
| Kundennummer vergeben | A01a (Hermes) |
| Ordnerstruktur anlegen | A01a (Hermes) |
| Personenbezogene Daten trennen (PII → TRESOR) | A14_Sicherheit |
| Stammdaten & Produkte erfassen | A01a (Hermes) |
| Brand Assets sichern | A01a (Hermes) → A02a (Marketing) informiert |
| Vollstaendigkeitspruefung | A05a (QM-Leiter) |
| Freigabe | GF |

---

## QUALITAETS-REGELN

```
⚠️  Datentrennung TRESOR vs. UNTERNEHMEN ist NICHT verhandelbar
⚠️  A01a verarbeitet niemals personenbezogene Daten direkt
⚠️  Kundennummer wird nie doppelt vergeben, auch nicht nach Kundenverlust
⚠️  Fehlende Brand Assets werden explizit dokumentiert
⚠️  Ordnerstruktur muss vor P_018-Start vollstaendig stehen
```

---

## OUTPUT

```
📁 05_UNTERNEHMEN/09_Kunden/KD_[Nr]_[Name]/ → vollstaendig angelegt
📄 stammdaten.md → erfasst
📄 produkte.md → erfasst
📁 brand_assets/ → gesichert oder als "nicht vorhanden" vermerkt
📁 04_TRESOR/K4_Personen/KD_[Nr]_[Name]/ → angelegt durch A08a
→ GF Freigabe → P_018 startet
```

---

## AENDERUNGSHISTORIE

| Version | Datum | Aenderung | Verantwortlich |
|---------|-------|-----------|----------------|
| v2.0 | 20.06.2026 | Erstellung | A01a (Hermes) |
| v2.1 | 20.06.2026 | Tippfehler korrigiert | A09a (Doku-Leiter) |
| v2.2 | 28.06.2026 | Dateiname konformiert (P_016_A01), H-00 → A01a, 08F-02 → A08a, Folgeprozess P_018 | A09a (Doku-Leiter) |

---

*P_016_A01_Kunden-Stammdaten_v2.2.md | Q7-System v23.5 | 28.06.2026*
