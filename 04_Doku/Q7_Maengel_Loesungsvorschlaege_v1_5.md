# Q7 Mängelregister mit Lösungsvorschlägen — Fortschreibung v1.5

**Dokumenttyp:** Architektur-Mängelregister (Ergänzung zu v1.4)
**Stand:** 26.07.2026 (v1.5 — Q7-M-078 neu)
**Zweck:** Neuer Eintrag zum bestehenden Register `Q7_Maengel_Loesungsvorschlaege_v1_4.md`. Bestehende 77 Einträge (inkl. Q7-M-077) unverändert, hier nicht erneut aufgeführt.

## Neuer Eintrag

|ID|Mangel|V1|V2|V3|Entscheidung|
|-|-|-|-|-|-|
|Q7-M-078|Black-Box-Verstoß im Backend, nicht nur im Frontend (Ergänzung zu Q7-M-077): `app/api/chat/route.ts` gibt in allen 5 Response-Pfaden `agentLabel` als rohen internen Bezeichner zurück (z.B. „A01 · Planung & Vorbereitung (Hermes)"), inkl. hartkodiertem „A14 Sicherheit" im Gate-Block-Pfad. Zusätzlich: `app/api/ablage/route.ts` reicht Fehlermeldungen mit internem „SEC-GATE:"-Präfix unverändert an den Client durch (landet z.B. in `FileUpload.tsx`-`alert()`)|**Backend korrigieren: agentLabel immer Konstante „Assistent"; SEC-GATE-Präfix vor Rückgabe entfernen**|Nur Frontend-seitig abfangen/filtern, Backend unverändert|Generisches Kürzel statt Klartext (z.B. „System" statt „Assistent")|**V1 (26.07.2026)** — konsistent mit Q7-M-077-Entscheidung (kein Agentencode, keine Ausnahme). `app/api/chat/route.ts` korrigiert: `agentLabel` durchgängig Konstante `ASSISTENT_LABEL = "Assistent"`, System-Prompt weist Modell an, sich nur als „der Assistent" zu bezeichnen. `/api/compare` noch zu prüfen (gleiches Muster wahrscheinlich, Code noch nicht vorgelegen). `/api/ablage` SEC-GATE-Präfix-Fix noch offen — Vorschlag: `error: meldung.replace(/^SEC-GATE:\s*/, "")` vor Rückgabe.|

---

## Änderungsprotokoll

- **v1.5 (26.07.2026):** Q7-M-078 neu aufgenommen (Backend-Leck `agentLabel` in `/api/chat`, SEC-GATE-Präfix-Leck in `/api/ablage`, gefunden bei Code-Review der API-Routen 26.07.2026). Entscheidung V1, Admin-Bestätigung 26.07.2026 (konsistent mit Q7-M-077). `/api/chat/route.ts` bereits korrigiert; `/api/compare/route.ts` und `/api/ablage/route.ts` SEC-GATE-Fix noch ausstehend. Alle 77 bestehenden Einträge aus v1.4 unverändert.
