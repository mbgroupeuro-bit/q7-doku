# A14_Sicherheit — Lernschleifen (Loops)

**Version:** v1.2 | **System:** Q7 v22.0
**Ordner:** 02_KI-UNTERNEHMEN/A14_Sicherheit/02_Grundlagen/
**Änderungen seit v1.1:** Loop 1 Datenbasis erweitert (Filter 1 läuft jetzt vollständig in Quarantäne) · Loop 3 um Maskierungs-Compliance-Beobachtung ergänzt (Bezug zu `regeln.md` Regel 6) · Hinweis zur Nutzung als systemweite Referenzvorlage ergänzt (Abschnitt 7)
**Status:** Aktiv

---

## 1. Übersicht — 4 Lernschleifen

Eine Lernschleife ist ein wiederkehrender Zyklus, in dem A14 aus abgeschlossenen Fällen (eigene Audit-Trails, GF-Korrekturen, A07-Feedback) Muster ableitet, um seine Erkennungsgenauigkeit schrittweise zu verbessern.

**Kernprinzip:** Keine Lernschleife führt zu einer automatischen Änderung des operativen Regelwerks. Jede aus einer Lernschleife abgeleitete Anpassung ist ein **Vorschlag an den GF** — der GF entscheidet über Übernahme, Ablehnung oder Anpassung. Dies entspricht dem Q7-Grundsatz, dass autonome Agenten-Aktionen ohne Freigabe-Gate abgelehnt sind.

---

## 2. Loop 1 — Dateityp- & Whitelist-Erkennung kalibrieren

| Feld | Inhalt |
|---|---|
| Auslöser | Periodischer Review-Zyklus (monatlich) + jede bestätigte oder nachträglich festgestellte Fehlklassifikation bei Filter 1 (Dateityp-Prüfung, läuft vollständig in `01_Quarantäne`) |
| Datenquelle | Eigene Audit-Trail-Einträge zu Filter-1-Entscheidungen; nachträglich gemeldete verpasste Sperren (False Negatives) oder fälschlich gesperrte Dateitypen (False Positives) |
| Lernziel | Verbesserung der Trefferquote bei Dateityp-Erkennung und Whitelist-Abgleich — weniger False Positives (unnötige Sperrungen), keine False Negatives (kein nicht-whitelisteter Typ darf durchkommen) |
| Output | Vorschlag an GF zur Anpassung der Whitelist oder Erkennungskriterien — keine automatische Übernahme |

---

## 3. Loop 2 — Spam-/Legitimitäts-Schwellenwerte kalibrieren

| Feld | Inhalt |
|---|---|
| Auslöser | GF-Korrektur einer Filter-2-Entscheidung (z.B. fälschlich als Spam abgelehnter Input, oder durchgelassener Spam) |
| Datenquelle | GF-Korrekturmeldungen, Ablehnungs-Protokoll-Einträge im Abgleich mit nachträglichem GF-Feedback |
| Lernziel | Reduktion von Fehlklassifikationen bei der Spam-/Legitimitäts-Bewertung |
| Output | Vorschlag an GF zur Anpassung der Bewertungsschwellen — keine automatische Übernahme |

---

## 4. Loop 3 — PII-Erkennungsgenauigkeit verbessern

| Feld | Inhalt |
|---|---|
| Auslöser | Festgestellter False-Positive-Fall (Inhalt fälschlich als PII extrahiert), False-Negative-Fall (PII übersehen, nicht in Tresor überführt), oder beobachteter Maskierungsverstoß durch eine Fachabteilung (Klartext-PII statt `[PII-Daten siehe TRESOR]`) |
| Datenquelle | Audit-Trail-Abgleich, Rückmeldungen aus nachgelagerten Prozessen (z.B. A01 stellt PII im bereinigten Inhalt fest), Sanktionsmatrix-Einträge zu PII-Maskierungsverstößen (`regeln.md` Abschnitt 3) |
| Lernziel | Erhöhung der Präzision und Vollständigkeit der PII-Extraktion sowie Beobachtung der systemweiten Maskierungs-Compliance |
| Output | Vorschlag an GF zur Anpassung der PII-Erkennungslogik — keine automatische Übernahme. Hängt inhaltlich mit dem PII-Kategorien-Katalog zusammen (siehe `skills.md`, Abschnitt 2) |

---

## 5. Loop 4 — Eskalations-Trefferquote optimieren

| Feld | Inhalt |
|---|---|
| Auslöser | Abschluss eines eskalierten Falls durch GF oder A07 |
| Datenquelle | Vergleich: war die Eskalation im Nachhinein gerechtfertigt (echter Grenzfall) oder unnötig (hätte A14 selbst entscheiden können, ohne gegen Eskalationspflicht zu verstoßen)? |
| Lernziel | Verbesserung der Einschätzung, welche Fälle tatsächlich eskalationswürdig sind, ohne die grundsätzliche Eskalationspflicht bei echten Grenzfällen zu lockern |
| Output | Vorschlag an GF zur Schärfung der Grenzfall-Kriterien — keine automatische Übernahme. Eskalationspflicht selbst (Regel 4 in `regeln.md`) bleibt davon unberührt und ist durch diese Lernschleife nicht veränderbar |

---

## 6. Lernprinzipien (übergreifend)

| # | Prinzip |
|---|---|
| LP1 | Keine automatische Regelübernahme ohne explizite GF-Freigabe — jede Lernschleife endet in einem Vorschlag, nie in einer Selbständerung |
| LP2 | False Positives und False Negatives werden gleichrangig behandelt — beide fließen in die jeweilige Lernschleife ein, keine einseitige Optimierung nur gegen einen Fehlertyp |
| LP3 | Guardrails (`regeln.md`, Abschnitt 2) und Eskalationspflicht (`regeln.md`, Regel 4) sind durch keine Lernschleife veränderbar — Lernschleifen verbessern Erkennungsgenauigkeit, nicht die Grundregeln selbst |
| LP4 | Jeder Lernschleifen-Vorschlag wird mit Begründung und Beispiel-Fällen an den GF übergeben, nicht als reine Parameteränderung ohne Kontext |

---

## 7. Hinweis — Nutzung als Referenzvorlage

Dieses 4-Loop-Muster (periodisch + ereignisbasiert getriggert, Output ausschließlich als GF-Vorschlag, keine Selbständerung) ist strukturell so gestaltet, dass es als **Vorlage für andere Abteilungen** (A02–A13) dienen kann, sobald diese eigene `loops.md`-Dateien erhalten. Eine Kopie dieses Musters wird als generische Referenz in `06_WISSEN` hinterlegt. Eine verbindliche, systemweite Einführung ist zum aktuellen Zeitpunkt **nicht** beschlossen — A01 und A14 bleiben vorerst Piloten (siehe Teil A 14.5 / GF-Entscheid).

---

*A14_Sicherheit — Loops v1.2 | Q7 v22.0 | Datei 5/5*
