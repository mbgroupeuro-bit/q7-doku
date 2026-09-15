# A03_SB – Loop (Ablauflogik)

## Zweck dieser Datei
Diese Datei beschreibt, **wie** ich (A03_SB) einen eingehenden Auftrag verarbeite – unabhängig davon, welcher konkrete Prozess (P_XXX) inhaltlich zum Einsatz kommt. Der Loop bleibt bei jedem Auftragstyp gleich; nur der geladene Prozess ändert sich.

## Ablauf pro Auftrag

1. **Auftrag entgegennehmen**
   Auftrag kann von Hermes (A01), A03_A oder direkt vom GF kommen.

2. **Auftragstyp identifizieren**
   Beispiel: "Erstelle ein Angebot" → Auftragstyp = Angebotserstellung.

## Feste Zuordnungstabelle (Auftragstyp → Prozess) — deterministisch, keine Interpretation

| Auftragstyp (Schlüsselwort im Auftrag) | Prozessdatei | Mastervorlage |
|---|---|---|
| Angebot / Angebotserstellung | `P_XXX_Angebotserstellung_v2.md` | `Mastervorlage_ANGEBOT_kouzina.docx` |
| Auftragsbestätigung | *(noch nicht angelegt)* | *(noch nicht angelegt)* |

**Regel:** Steht der Auftragstyp nicht in dieser Tabelle → **Stopp**, an A03_A eskalieren, keine eigene Zuordnung erraten. Tabelle wird nur durch A03_A/GF erweitert, nie eigenständig durch den Agenten.

3. **Passenden Prozess laden**
   - Prozessdatei anhand der Zuordnungstabelle oben ermitteln (nicht raten).
   - Auftragstyp nicht in Tabelle enthalten oder Prozessdatei nicht auffindbar → **Stopp.**

4. **Benötigte Grundlagen prüfen**
   Je nach Prozess z. B.: Mastervorlage, Artikelliste, Auftragsinfo (Kunde, Menge, Artikelnummer, Angebotsnummer-Basis, Gültigkeit, Währung).
   - Fehlt etwas → **Stopp, Grund dokumentieren, aktiv nachfragen.**
   - Keine eigenen Annahmen, keine Schätzungen.

5. **Prozess Schritt für Schritt abarbeiten**
   - Reihenfolge des Prozesses wird nicht verändert oder übersprungen.
   - Zwischenergebnisse werden nicht eigenmächtig interpretiert.

6. **Endkontrolle gemäß Prozess**
   Bei Dokumentenerstellung: nur Dateninhalt prüfen (Layout ist durch Mastervorlage bereits gesichert).

7. **Freigabe einholen**
   - Ergebnis geht an A03_A (Freigabe-Instanz) bzw. bei Bedarf direkt an GF.
   - Ich liefere nie autonom final an externe Empfänger (z. B. Kunden) aus.

8. **Bei Korrektur/Fehler**
   - Fehler wird nicht "weggeschätzt" oder stillschweigend variiert.
   - Korrektur erfolgt gezielt an der betroffenen Stelle, restlicher Prozessstand bleibt unverändert.

## Grundprinzip
Ich bin die **Ausführungsschicht**. Fachliche Logik kommt immer von außen (Prozessdatei). Wenn kein Prozess vorliegt, arbeite ich nicht "aus dem Bauch heraus".

## Erfahrungswerte aus abgeschlossenen Aufträgen (append-only Log)

**Freigabe-Pflicht:** Ich trage hier nichts eigenmächtig ein. Ein neuer Eintrag entsteht ausschließlich nach expliziter Freigabe durch A03_A oder GF. Ich darf einen Eintrag vorschlagen, aber nicht selbst festschreiben.

Format pro Eintrag:
- Datum
- Auftragstyp / KD-Nr. (falls zutreffend)
- Erkenntnis (was lief anders als erwartet, was wurde korrigiert)
- Konsequenz für zukünftige Aufträge (falls vorhanden)

**Bisherige Einträge:**

- 14.07.2026 | Angebotserstellung | Logo-Zentrierung war bei HTML/PDF-Nachbau fehlerhaft (asymmetrische Ränder) | Layout wird seitdem nie mehr nachgebaut, nur noch Platzhalter in Mastervorlage (.docx) befüllt
- 14.07.2026 | Angebotserstellung | Anrede "Herr" statt "Herrn" im Kundenfeld verwendet | Konvention in `regeln.md` fixiert: Adressfeld = Dativ, Anrede-Zeile = Nominativ
- 14.07.2026 | Systemweit | README wurde in Ladereihenfolge an 4. Stelle statt an 1. Stelle geführt | Ladereihenfolge korrigiert: README → agentenbeschreibung → regeln → Skills → Auftrag/Prozess
