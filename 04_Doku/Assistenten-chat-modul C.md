# Assistenten-Chat-Modul C

Stand: 15.09.2026
Status: **Konzept festgehalten, Umsetzung zurückgestellt** (Auflösung von ND-02 aus der Arbeitsliste)
Kontext: Klärungsrunde zu ND-02 ("aufgabe-chat" bauen oder verwerfen?)

---

## 1. Ausgangsfrage (ND-02)

Ursprünglich als möglicherweise separates Feature "aufgabe-chat" in der Arbeitsliste
geführt: Soll man bei einer einzelnen Aufgabe einen eigenen Chat/Kommentarverlauf
führen können?

## 2. Klärung — kein neues Feature nötig

Bei der Klärung hat sich herausgestellt: Das gehört zu einem bereits bestehenden
Konzept, nicht zu einem neuen, separaten Feature.

Laut L4 (Namenskonvention, 3-Ebenen-Modell) ist A01 bereits sowohl:
- die zentrale Koordinationsfunktion im System (interner Name)
- als auch der "Persönliche Assistent" aus Kundensicht (Ebene 3, Black-Box-Name)

Damit sind die in der Klärung diskutierten Optionen A (KI-Chat) und C (persönlicher
Assistent, der Arbeit annimmt) laut bestehender Architektur bereits dasselbe —
kein Design-Entscheid, sondern bereits so angelegt. Nur die Oberfläche zeigt das
aktuell noch nicht in dieser Form.

Klar abzugrenzen bleibt Option B: interner Team-Chat (Slack-artig, Mensch-zu-Mensch),
unabhängig von diesem Modul.

## 3. Zielbild

Ein Symbol/Button für den Assistenten (z. B. oben rechts, wie in vergleichbaren
Tools üblich), der von überall im System aus aufrufbar ist. Wird er aus der
Ansicht einer bestimmten Aufgabe heraus geöffnet, bekommt der Assistent automatisch
den Kontext dieser Aufgabe mitgegeben — der Nutzer muss die Aufgabe nicht erneut
beschreiben.

Beispiel: Nutzer arbeitet an Aufgabe X, öffnet den Assistenten → Assistent kennt
bereits Titel, Beschreibung, Status etc. von Aufgabe X, ohne dass der Nutzer das
manuell eingibt.

## 4. Technische Umsetzung (Entwurf, nicht verifiziert)

Zwei Bausteine, angelehnt an das bestehende Muster aus KA-01 (Cron-Routinen-Kontext
in `lib/ki-agent/orchestrierung.ts`):

1. **Frontend:** Beim Aufruf des Assistenten aus einer Aufgabenansicht heraus wird
   die Aufgaben-ID (`aufgabe.id`) mitgeschickt — kein automatisches "Erraten",
   sondern explizite Übergabe durch die aufrufende Komponente.
2. **Backend:** Die Chat-Route (`app/api/chat/route.ts` oder neuer Endpoint) nimmt
   diese ID, lädt die zugehörigen Aufgaben-Daten aus der DB und baut sie als
   Kontext in den System-Prompt ein — analog zum bestehenden Vorgehen bei den
   Cron-Routinen.

**Nicht verifiziert:** Ob der bestehende Chat-Code aktuell schon eine Mechanik für
kontextabhängige Prompt-Erweiterung besitzt oder das komplett neu gebaut werden
müsste. Vor Umsetzung zu prüfen.

## 5. Nächste Schritte (bei Wiederaufnahme)

- Code-Check: `app/api/chat/route.ts` und `app/api/compare/route.ts` auf bestehende
  Kontext-Injection-Mechanismen prüfen
- Entscheiden: neuer Endpoint oder Erweiterung des bestehenden Chat-Endpoints
- UI-Entwurf für das Assistenten-Symbol (Position, Sichtbarkeit je nach Ansicht)
- Abgrenzung zu Team-Chat (Option B) in der UI klar kommunizieren, damit Nutzer
  nicht verwechseln, mit wem (KI oder Mensch) sie gerade sprechen
