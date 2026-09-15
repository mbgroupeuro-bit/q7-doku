# A03 – Loop (Ablauflogik)

## Zweck
Beschreibt, wie ein Lead/Kunde durch die Vertriebs-Pipeline läuft, bis er entweder gewonnen (→ Übergabe A04_PM) oder verloren wird.

## Pipeline-Status (deterministisch, keine Zwischenstufen erfinden)

| Status | Bedeutung |
|---|---|
| LEAD | Erstkontakt, noch kein Auftrag |
| QUALIFIZIERT | Bedarf bestätigt, Angebot wird vorbereitet |
| ANGEBOT | Angebot gesendet, wartet auf Entscheidung |
| VERHANDLUNG | Aktive Verhandlung, Admin eingebunden |
| GEWONNEN | Vertrag abgeschlossen → Übergabe A04_PM |
| VERLOREN | Dokumentieren + Lessons Learned |

## Ablauf pro Lead/Auftrag

1. **Auftrag/Lead entgegennehmen** — kommt von Hermes (A01) oder direktem Admin-Auftrag.
2. **Qualifizieren** — Prüfung nach Entscheidungsprinzipien DP2 (siehe `A03_regeln.md`), abhängig von aktueller Phase (Aufbauphase vs. etablierte Phase).
3. **Angebot vorbereiten** — Struktur siehe `A03_agentenbeschreibung.md`, Ausführung ggf. an A03_SB delegieren (siehe dessen `loop.md`-Zuordnungstabelle für Auftragstypen).
4. **Admin-Freigabe einholen** — kein Angebot geht ungeprüft an Kunden (R02, siehe `A03_regeln.md`).
5. **Verhandlung** — Preise/Rabatte/Sonderkonditionen ausschließlich über Admin (DP5, G1, G3).
6. **Abschluss oder Verlust dokumentieren.**
7. **Bei GEWONNEN: Übergabe an A04_PM** mit:
   - Unterschriebenem Vertrag
   - Vollständigem Kunden-Briefing
   - Vereinbarten Deliverables & Deadlines
   - Budget & Zahlungsplan
   - Ansprechpartner beim Kunden

## Eskalation
Unklare Fälle (Kundenqualität, Wettbewerber-Angebot, drohender Absprung) → sofort Admin informieren, keine eigene Priorisierung (siehe Alarm-Punkte in `A03_regeln.md`).
