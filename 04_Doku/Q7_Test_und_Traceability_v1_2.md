# Q7 – Test- und Traceability-Modell

**Version:** 1.3
**Status:** Verbindlich
**Referenziert von:** L8_Q7_Technik
**Löst:** Q7-M-073, Q7-M-074, Q7-M-075

---

# Zweck

Dieses Dokument definiert den verbindlichen Standard für Akzeptanzkriterien je Dokument, die Traceability zwischen Mängeln, Lösungsdokumenten und Architektur sowie das Testmodell für Code, Workflows, Prompts, Retrieval, Policies und Outputs.
Es klärt zudem den technisch-organisatorischen Standort des Mängelregisters (siehe L8).

---

# Grundprinzipien

## 1. Jedes verbindliche Dokument trägt Akzeptanzkriterien

Prüfbarkeit ist kein optionaler Zusatz, sondern Pflichtabschnitt jedes L-Dokuments und jedes Vertiefungsdokuments.

## 2. Jeder Mangel ist bis zur Umsetzung rückverfolgbar

Von der Mangel-ID bis zum konkreten Dokumentabschnitt, der ihn löst, muss ein eindeutiger Pfad existieren.

## 3. Tests decken alle Artefakttypen ab, nicht nur Code

Workflows, Prompts, Retrieval-Verhalten, Policy-Entscheidungen und Outputs werden ebenso getestet wie klassischer Code.

---

# M-ID-Register-Standort

Das Mängelregister (`Q7_Maengel_Loesungsvorschlaege_vX.md`) war ein eigenständiges Dokument (SSOT für Mangel-Beschreibung, Lösungsoptionen, Entscheidung) und wurde **nicht** in L2 Governance oder dieses Dokument integriert.

**Status (Q7-VERT2-007, geklärt 19.09.2026):** Das Register wurde gelöscht, nachdem alle darin geführten Mängel behoben waren — kein aktiver Ablageort mehr. Dieser Abschnitt bleibt zur Erklärung erhalten, nicht als offener Punkt: sollte künftig ein neuer Mangel erfasst werden müssen, wäre das Register unter `04_Doku/Infrastruktur/Q7_Maengel_Loesungsvorschlaege_vX.md` neu anzulegen (analog zu den zehn Vertiefungsdokumenten).

Die Traceability Matrix (siehe unten) verweist auf Mangel-IDs, dupliziert deren Inhalt aber nicht (SSOT, siehe L2 Dokumentenregeln).

---

# Standard: Akzeptanzkriterien pro Dokument

Jedes verbindliche Q7-Dokument (L1–L8, jedes Vertiefungsdokument unter `04_Doku/Infrastruktur/`) enthält einen Abschnitt „Akzeptanzkriterien" mit:

- prüfbaren, konkreten Aussagen (kein „sollte", „möglichst")
- Bezug zu einem beobachtbaren Systemzustand oder Testergebnis
- keiner Wiederholung von Inhalten aus anderen Abschnitten desselben Dokuments

**Status:** Bereits umgesetzt — alle acht L-Dokumente (L1–L8) sowie alle Vertiefungsdokumente enthalten diesen Abschnitt. Q7-M-073 ist damit durch bestehende Praxis erfüllt; dieses Dokument formalisiert die Pflicht für alle zukünftigen Dokumente.

---

# Traceability Matrix

Die Matrix verknüpft drei Ebenen:

```text
Mangel-ID (Register) ←→ Lösungsdokument (L-Dokument oder Vertiefungsdokument) ←→ Akzeptanzkriterium
```

| Spalte | Quelle |
|---|---|
| Mangel-ID | Mängelregister |
| Lösungsdokument | L1–L8 oder `04_Doku/Infrastruktur/Q7_*_v1.md` |
| Abschnitt/Zeile | Konkreter Abschnitt im Lösungsdokument |
| Akzeptanzkriterium | Verweis auf das prüfbare Kriterium, das die Lösung nachweist |
| Status | Offen / Umgesetzt / Getestet |

Die Matrix wird als eigenes Register geführt (nicht in diesem Dokument dupliziert), Format und Pflege analog zum Mängelregister. Sie wird bei jedem neuen oder geänderten Vertiefungsdokument aktualisiert.

**Aktueller Abdeckungsstand (Stand 27.07.2026):** Alle Mängel aus den priorisierten Sofortmaßnahmen 1–10 sind einem Lösungsdokument zugeordnet. Die verbleibenden Mängel außerhalb der Sofortmaßnahmen sind größtenteils technische Umsetzung — deren Traceability erfolgt auf Code-/Implementierungsebene, außerhalb dieses Dokuments.

---

# Testmodell

| Artefakttyp | Testansatz |
|---|---|
| Code | Klassische Unit-/Integrationstests |
| Workflows | Zustandsübergangstests je Case-Zustand (siehe Q7_Workflow_Detailmodell_v1_2.md) — jeder definierte Übergang wird mindestens einmal ausgelöst und geprüft |
| Prompts | Regressionstests gegen definierte Beispiel-Inputs inkl. Prompt-Injection-Testfälle (siehe Q7_Sicherheitsmodell_v1_6.md) |
| Retrieval | Prüfung, dass Metadaten-Vorfilterung vor Volltext-/Vektorsuche greift (siehe Q7_Wissens_Artefaktmodell_v1_2.md); Prüfung auf korrekte Scope-/Berechtigungsgrenzen |
| Policies | Testfälle je Enforcement Point (siehe Q7_Policy_Engine_v1_3.md) — insbesondere Fail-Closed-Verhalten bei Ausfall |
| Outputs | Prüfung, dass jeder Output einen vollständigen Execution Evidence Record besitzt (siehe Q7_Wissens_Artefaktmodell_v1_2.md) |

Jeder neue Testfall wird der Traceability Matrix zugeordnet (welches Kriterium/welcher Mangel wird dadurch geprüft).

---

# Akzeptanzkriterien

- Jedes verbindliche Q7-Dokument (L1–L8 und Vertiefungsdokumente) enthält einen Abschnitt „Akzeptanzkriterien" mit prüfbaren Aussagen.
- Zu jeder in der Traceability Matrix geführten Mangel-ID existiert mindestens ein zugeordnetes Lösungsdokument und mindestens ein Akzeptanzkriterium.
- Jeder der sechs Artefakttypen (Code, Workflows, Prompts, Retrieval, Policies, Outputs) besitzt mindestens einen dokumentierten Testansatz.
- Sofern ein Mängelregister aktiv geführt wird, ist sein Ablageort im System eindeutig auffindbar und mit L8 verlinkt (aktuell nicht zutreffend — Register nach vollständiger Mängelbehebung gelöscht, siehe „M-ID-Register-Standort").
- Kein Testfall existiert ohne Zuordnung zu einem Eintrag der Traceability Matrix.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich Akzeptanzkriterien-Standard, Traceability Matrix und Testmodell.
Es vertieft L8 (Technik) und schließt dessen offenen Punkt zum M-ID-Register-Standort.
Es ersetzt keine Inhalte des Mängelregisters oder anderer Dokumente und dupliziert sie nicht (SSOT, siehe L2 Dokumentenregeln).

---

# Änderungsregel

Änderungen am Test- und Traceability-Modell dürfen bestehende Zuordnungen in der Matrix nicht verwaisen lassen.
Jede Änderung ist auf Vollständigkeit der Rückverfolgbarkeit zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (09.07.2026): Ausgangsfassung. Löst Q7-M-073, Q7-M-074, Q7-M-075.
- v1.1 (27.07.2026): Terminologie „GF" → „Admin" (Q7-VERT-008). Abdeckungsstand aktualisiert. Verweise auf Workflow-Detailmodell und Policy Engine auf v1.1/v1.2 aktualisiert.
- v1.2 (19.09.2026): Interne Querverweise auf reale Dateinamen mit Minor-Version korrigiert (Q7_Workflow_Detailmodell_v1_2.md, Q7_Sicherheitsmodell_v1_6.md, Q7_Wissens_Artefaktmodell_v1_2.md, Q7_Policy_Engine_v1_3.md). Fehlen des Mängelregisters im realen Infrastruktur-Ordner als offener Punkt ergänzt (Q7-VERT2-007) — widerspricht dem eigenen Akzeptanzkriterium „eindeutig auffindbar", solange die Datei fehlt.
- v1.3 (19.09.2026): Q7-VERT2-007 abschließend geklärt (Admin-Bestätigung): Mängelregister wurde gelöscht, nachdem alle Mängel behoben waren — kein offener/kaputter Verweis mehr. Abschnitt „M-ID-Register-Standort" und zugehöriges Akzeptanzkriterium entsprechend umformuliert (historischer Zustand statt Fehlstelle).
