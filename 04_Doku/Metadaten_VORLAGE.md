---
# ==== PFLICHTFELDER (immer ausfüllen) ====
titel: [Name des Dokuments]
dateityp: prozess              # prozess | theorie | praxis
prozess_id: P_0XX              # nur bei dateityp=prozess, sonst weglassen
agent: A0X_Name                # Haupt-verantwortlicher Agent (Owner der Datei)
version: 1.0
datum: JJJJ-MM-TT
status: Entwurf                # Entwurf | Freigegeben | Veraltet

# ==== KOPIER-RISIKO (Wissensart-Klassifikation) ====
copy_risiko: mittel             # niedrig (theorie) | mittel (prozess) | hoch (praxis)

# ==== VERNETZUNG (macht Wissen dynamisch statt statisch) ====
symptome: []                    # z.B. [Marge zu gering, Umsatz rückläufig]
ursachen_cluster: []            # z.B. [Einkaufskosten, Produktionsausschuss]
verknuepfte_agenten: []         # alle Agenten, die bei diesem Thema relevant sein könnten
verknuepfte_prozesse: []        # andere Prozess-IDs mit Bezug
verknuepfte_experten: []        # z.B. [Kotler, Kapferer] bei Marketing/Branding-Theorie

# ==== ROUTING-RELEVANZ (nur bei dateityp=prozess) ====
anliegen_typ: []                # welche Hermes-Kategorien führen zu dieser Datei
konfidenz_schwelle: standard    # standard | streng | locker
rueckfrage_pflicht: nein        # ja | nein
---

# [Titel des Dokuments]

## Zweck
Ein Satz: wofür ist diese Datei da, wer nutzt sie, wann wird sie herangezogen.

## Geltungsbereich
Was gehört dazu, was ausdrücklich nicht.

## Inhalt / Ablauf
(Der eigentliche fachliche Teil — Prozessschritte, Theorie-Erklärung oder Praxis-Textbausteine, je nach `dateityp`)

## Vernetzung — Kontext für Hermes
Kurzer Klartext-Absatz, WARUM diese Verknüpfungen (symptome/ursachen_cluster/verknuepfte_agenten) bestehen — damit ein Mensch beim Lesen sofort versteht, wieso z.B. A08_Finanzen UND A02_Marketing hier verknüpft sind.

## Offene Punkte
Was fehlt noch, was ist bewusst nicht final.
