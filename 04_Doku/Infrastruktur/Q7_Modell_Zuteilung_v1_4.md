# Q7 – Modell-Zuteilung je Agent (OpenRouter)

**Version:** 1.4
**Status:** Verbindlich
**Referenziert von:** Q7_Technisches_Architekturhandbuch_v1_2.md (AI Observability), Q7_Lizenz_und_Deployment_v1_2.md (Nutzungsmetriken)
**Löst:** Offener Punkt „Auf dem Horizont" — Modell-Mapping OpenRouter; final angepasst an echte Codebasis (11.07.2026)

---

# Zweck

Dieses Dokument beschreibt, wie die Modellwahl je Agent in Q7 technisch funktioniert und welche Empfehlungen für die Konfiguration gelten. Es ersetzt keine Code-Logik — die tatsächliche Implementierung liegt in `app/api/chat/route.ts` und `app/api/compare/route.ts`.

---

# Wichtige Korrektur gegenüber v1.0/v1.1

Frühere Versionen dieses Dokuments gingen von einem eigens erfundenen Variablenschema (`Q7_MODEL_A00`, `Q7_MODEL_A01` etc.) aus, das **nicht der echten Codebasis entsprach**. Die tatsächliche Implementierung nutzt ein bereits bestehendes, einfacheres Schema (siehe unten). Dieses Dokument beschreibt ab v1.2 ausschließlich die reale Konvention.

---

# Technisches Modell (wie es tatsächlich funktioniert)

Kein Modell ist im Code hartkodiert. Die Zuteilung erfolgt ausschließlich über Umgebungsvariablen:

| Variable | Wirkung |
|---|---|
| `OPENROUTER_MODEL` | Globaler Standard für alle Agenten, falls kein spezifischeres Override existiert |
| `OPENROUTER_MODEL_<KUERZEL>` | Override für einen einzelnen Agenten (z. B. `OPENROUTER_MODEL_A01`, `OPENROUTER_MODEL_A14`) |
| `OPENROUTER_COMPARE_MODELS` | Kommagetrennte Modell-Liste für den Vergleichsmodus (`/api/compare`), Fallback: `STANDARD_VERGLEICHS_MODELLE` in `lib/types.ts` |

**Auflösungsreihenfolge je Agent:** `OPENROUTER_MODEL_<KUERZEL>` (falls gesetzt) → `OPENROUTER_MODEL` (falls gesetzt) → Code-Fallback `anthropic/claude-sonnet-5`.

---

# A14 (Sicherheit) — zwei Prüfstufen, ein Modell

Anders als in früheren Entwurfsversionen dieses Dokuments vorgeschlagen (dreistufig mit unterschiedlichen Modellen je Stufe) nutzt die aktuelle Implementierung **eine** Variable (`OPENROUTER_MODEL_A14`) für beide real umgesetzten Prüfstufen:

| Stufe | Ort | Zweck |
|---|---|---|
| Output-Gate | `app/api/chat/route.ts` | Prüft jede Chat-Antwort vor Auslieferung (siehe Q7_Sicherheitsmodell_v1_6.md, „Standardprüfung") |
| Input-Gate | `app/api/compare/route.ts` | Prüft die Nutzereingabe einmalig vor Fan-out an alle Vergleichsmodelle (Admin-Entscheidung 11.07.2026, Option B — Kostenabwägung bei N parallelen Modellaufrufen) |

**Nicht umgesetzt (weiterhin nur konzeptionell, siehe Q7_Sicherheitsmodell_v1_6.md):** Eskalationsprüfung bei bestätigtem Quarantäne-Verdacht, tägliche Reflexionsanalyse. Diese sind fachlich beschrieben, aber nicht Teil der aktuellen Code-Implementierung — falls gewünscht, separat zu beauftragen.

---

# Empfehlung zur Modellwahl (keine Vorgabe im Code)

Diese Tabelle ist eine **Empfehlung für die Werte in `.env.local`**, keine technische Einschränkung — jederzeit änderbar ohne Code-Deployment:

| Agent(en) | Empfehlung | Begründung |
|---|---|---|
| A00, A01 | Höherwertiges Modell (z. B. Sonnet) | Koordination/Überwachung, geringere Frequenz |
| A02–A13 | Kein Override nötig, globaler `OPENROUTER_MODEL` reicht meist | Standardaufgaben |
| A14 | Kleineres/schnelleres Modell (z. B. Haiku) | Hohe Frequenz (jede Chat-Antwort durchläuft das Gate) |

---

# Akzeptanzkriterien

- Kein Agent-Modell ist im Code hartkodiert — jede Zuteilung erfolgt über Umgebungsvariablen.
- A14 nutzt für beide implementierten Gate-Stufen (Output-Gate, Input-Gate) dieselbe konfigurierbare Variable.
- Bei Ausfall des A14-Gates wird die Auslieferung/Verarbeitung blockiert, nicht automatisch freigegeben (Fail-Closed, siehe `chat/route.ts` und `compare/route.ts`).

---

# Geltungsbereich

Dieses Dokument beschreibt ausschließlich das reale Modell-Zuteilungsschema. Es ersetzt keine Code-Logik.

---

# Änderungsregel

Änderungen an diesem Dokument müssen mit dem tatsächlichen Code-Stand übereinstimmen — bei Abweichung gilt der Code als Wahrheitsquelle, nicht dieses Dokument (SSOT-Ausnahme, da es sich um eine reine Beschreibung der Implementierung handelt).
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v0.1 (09.07.2026): Ausgangsfassung als Entwurf (spekulativ).
- v1.0 (09.07.2026): Admin-Freigabe (mit „A01" als vorläufiges Kürzel, spekulatives Variablenschema `Q7_MODEL_*`).
- v1.1 (10.07.2026): Agentenkürzel korrigiert (A00–A14 vollständig), weiterhin spekulatives Variablenschema.
- v1.2 (11.07.2026): Vollständige Korrektur nach Sichtung der echten `app/api/chat/route.ts` und `app/api/compare/route.ts`. Spekulatives `Q7_MODEL_*`-Schema verworfen, ersetzt durch reale `OPENROUTER_MODEL_<KUERZEL>`-Konvention. A14-Modell auf eine gemeinsame Variable für beide real umgesetzten Gate-Stufen reduziert.
- v1.3 (27.07.2026): Terminologie „GF" → „Admin" durchgängig (Q7-VERT-012). Admin-Entscheidung 11.07.2026 präzisiert. Verweis auf Sicherheitsmodell auf v1.5 aktualisiert.
- v1.4 (19.09.2026): Interne Querverweise auf reale Dateinamen mit Minor-Version korrigiert (Q7_Sicherheitsmodell_v1_6.md, Q7_Technisches_Architekturhandbuch_v1_2.md, Q7_Lizenz_und_Deployment_v1_2.md), konsistent mit Konsistenz-Check vom 19.09.2026.
