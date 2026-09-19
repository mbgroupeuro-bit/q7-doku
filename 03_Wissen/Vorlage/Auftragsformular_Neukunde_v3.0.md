# AUFTRAGSFORMULAR — Neukunde

**Eingangsdatum:** [TT.MM.JJJJ]
**Formular-ID:** IT_[TT_MM_JJJJ]_[Nr] *(wird von A14 bei Quarantäne-Eingang vergeben)*

**Hinweis v3.0:** Felder mit ⚠️ PFLICHT müssen ausgefüllt sein. Bleibt ein
Pflichtfeld leer, stellt Hermes (A01a) gemäß E1 ("Frage statt Annahme") eine
konkrete Rückfrage, statt mit Annahmen weiterzuarbeiten.

---

## 1. KONTAKTDATEN *(⚠️ personenbezogen — wird durch A14 nach 04_TRESOR verschoben)*

```
Ansprechpartner (Name): ⚠️ PFLICHT
Telefon: ⚠️ PFLICHT
E-Mail: ⚠️ PFLICHT
Adresse: ⚠️ PFLICHT (Hinweis: bei Einzelunternehmern mit 1 Standort kann
  die Geschäftsadresse zugleich personenbezogen sein — A14 behandelt
  dies im Zweifel als PII, siehe A14-Entscheidungsprinzip DP2)
```

---

## 2. UNTERNEHMEN

```
Firmenname: ⚠️ PFLICHT
Branche: ⚠️ PFLICHT
Anzahl Standorte/Filialen: ⚠️ PFLICHT
Standort(e) — Stadt: ⚠️ PFLICHT
Gründungsjahr: (optional, aber gewünscht)
Zielgruppe (so wie der Kunde sie selbst sieht): (optional — "keine
  Definition" ist eine gültige, sogar aufschlussreiche Antwort)
Preispositionierung (günstig/mittel/marktüblich/premium): (optional)
```

---

## 3. GESCHÄFTSMODELL-TYP ⚠️ PFLICHT

```
☐ KATALOG/PRODUKTLINIE — feste Artikel mit Stückpreisen
☐ MASSANFERTIGUNG/PROJEKTGESCHÄFT — individuelle Anfertigung pro Kunde,
  kein fester Artikelkatalog (→ produkte.md wird dann als
  Leistungsprofil + Referenzprojekte geführt, nicht als Artikelliste)
☐ MISCHFORM — sowohl Standardprodukte als auch Maßanfertigung

Falls Maßanfertigung/Mischform:
→ Ungefähre Anzahl bisheriger Referenzprojekte:
→ Referenzfotos/-videos liegen bei: Ja / Nein / werden nachgereicht
```

---

## 4. AUFTRAG

```
Worum geht es? (kurze Beschreibung): ⚠️ PFLICHT

Gewünschter Scope ⚠️ PFLICHT:
☐ A) Vollständig — alle Bereiche (Markenidentität, Digital,
     Produktion/Prozesse, Finanzen, Personal, Logistik)
☐ B) Markenidentität + Digital — Marketing, Website, Social Media,
     Bewertungen, CI (kein Finanz-/Produktions-/Personal-Scope)
☐ C) Nur Digital — Website, Social Media, Sichtbarkeit (CI bereits
     vorhanden)
☐ Sonstiges/Individuell: ____________________

Budget-Rahmen (grob): ⚠️ PFLICHT
Zeitrahmen / gewünschter Start: ⚠️ PFLICHT
```

---

## 5. ZIEL DES KUNDEN

```
Was soll am Ende erreicht sein? ⚠️ PFLICHT
→

Gibt es einen konkreten Anlass? (z.B. Umsatzrückgang, Neueröffnung, Rebranding)
→ (optional)
```

---

## 6. SONSTIGES

```
Anmerkungen:
Angehängte Unterlagen (Logo, bestehende Marketingmaterialien, etc.):
```

---

*Hinweis: Dieses Formular durchläuft nach Eingang in 01_INPUT/01_Quarantäne automatisch
die 3-Filter-Prüfung (A14) und anschließend die PII-Datentrennung (Abschnitt 1 wird
nach 04_TRESOR verschoben). Erst danach erhält Hermes (A01a) Zugriff und P_016
Kunden-Stammdaten-Aufnahme startet.*

---
*Auftragsformular_Neukunde_v3.0.md | Version v3.0 | Q7-System v23.5 | 28.06.2026*
*v3.0: Agent-Kürzel H-01 → A14, H-00 → A01a. System-Version aktualisiert. Behebt V-04.*
