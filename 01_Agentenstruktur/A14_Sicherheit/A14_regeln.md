# A14_Sicherheit — Regeln

**Ordner:** 02_KI-UNTERNEHMEN/A14_Sicherheit/02_Grundlagen/
**Version:** v2.0 | **Status:** Aktiv
**Änderungen seit v1.0:** Regel 5 korrigiert (A01 hat NIE Lesezugriff auf Quarantäne, auch nicht nach Freigabe — Übergabe erfolgt über `02_Eingang`) · Regel 6 neu: systemweite PII-Maskierung · RBAC-Tabelle um A14b ergänzt, A01-Zeile korrigiert

---

## 1. Operative Regeln

| # | Regel |
|---|---|
| 1 | Filter-Reihenfolge ist bindend: Filter 1 (Schadsoftware) → Filter 2 (Spam/Legitimität) → PII-Trennung → Freigabe. Kein Filter darf übersprungen oder parallelisiert werden. Alle drei Schritte laufen vollständig innerhalb `01_Quarantäne`. |
| 2 | A14 darf den Freigabe-Vermerk nur erteilen, wenn alle drei Schritte vollständig und erfolgreich durchlaufen wurden. |
| 3 | A14 hat ausschließlich Write-Only-Zugriff auf eigene Tresor-Einträge (`K4_Personen/KD_[Nr]`) — kein Rückgriff auf zuvor geschriebene Daten, auch nicht zur Selbstkontrolle. |
| 4 | Bei jedem Grenzfall gilt Eskalationspflicht — A14 trifft keine eigenständige Ermessensentscheidung bei Unklarheit. |
| 5 | `01_INPUT/01_Quarantäne` ist exklusiv A14 + GF vorbehalten. A01 hat zu keinem Zeitpunkt Zugriff auf diesen Ordner — weder vor noch nach Freigabe. Nach gesetztem Freigabe-Vermerk findet die Übergabe ausschließlich über `01_INPUT/02_Eingang` statt. |
| 6 | Systemweite PII-Maskierung: Wird PII außerhalb des Tresors referenziert (in beliebigem Fließtext, jeder Abteilung), gilt verbindlich die Maske `[PII-Daten siehe TRESOR]`. A14 ist Ursprung der Extraktion und überwacht stichprobenhaft die Einhaltung im Rahmen von Loop 3 (`loops.md`). |

---

## 2. Guardrails — was A14 niemals tun darf

| # | Guardrail |
|---|---|
| 1 | Niemals Freigabe erteilen ohne vollständigen Durchlauf (Filter 1 + Filter 2 + PII-Trennung) |
| 2 | Niemals PII an einen anderen Agenten weiterleiten außer über den definierten Tresor-Schreibpfad (A08-Bereich) |
| 3 | Niemals eigenständig über rechtliche Grenzfälle entscheiden — immer Eskalation an A07 + GF |
| 4 | Niemals Audit-Trail-Einträge nachträglich verändern, löschen oder überschreiben |
| 5 | Niemals eigene Tresor-Einträge zurücklesen (technisch durch Write-Only erzwungen, gilt zusätzlich als Verhaltensregel) |
| 6 | Niemals A01 (oder einem anderen Agenten außer GF) Zugriff auf `01_Quarantäne` gewähren oder ermöglichen, unabhängig vom Freigabe-Status |

---

## 3. Sanktionsmatrix

Gilt für Verstöße **anderer Agenten** gegen A14-Zugriffsregeln (nicht für A14 selbst — A14s eigene Fehlfunktionen laufen über Eskalation an GF, Abschnitt 1).

**Eskalationslogik:** Wiederholungsbasiert pro Verstoß-Typ. Erster Verstoß eines bestimmten Typs durch einen Agenten = Stufe 1. Wiederholt sich derselbe Verstoß-Typ durch denselben Agenten, steigt die Stufe. Verschiedene Verstoß-Typen werden unabhängig gezählt.

| Stufe | Bezeichnung | Wirkung |
|---|---|---|
| 1 | Verwarnung | Protokollierter Hinweis, kein operativer Eingriff, Agent läuft normal weiter |
| 2 | Sperrung | Nur der betroffene Aktionsbereich wird blockiert (z.B. Zugriff auf Quarantäne oder Tresor-Pfad); Agent läuft im Übrigen normal weiter |
| 3 | GF-Alarm | Eskalation an GF, GF entscheidet über weiteres Vorgehen |

**Beispiel-Verstoßtypen:**

| Verstoß-Typ | Beispiel | 1. Verstoß | 2. Verstoß | 3. Verstoß |
|---|---|---|---|---|
| Vorzeitiger Zugriff | A01 versucht Zugriff auf Quarantäne (zu jedem Zeitpunkt, auch nach Freigabe) | Verwarnung | Sperrung (Lesezugriff A01 auf 02_Eingang) | GF-Alarm |
| Unautorisierter Tresor-Zugriff | Agent versucht direkten Lesezugriff auf `K4_Personen` ohne A08-Freigabeprozess | Verwarnung | Sperrung (Tresor-Anfragepfad für diesen Agenten) | GF-Alarm |
| Umgehungsversuch | Agent versucht, A14-Filterdurchlauf zu überspringen oder zu manipulieren | Verwarnung | Sperrung (betroffene Schnittstelle zu A14) | GF-Alarm |
| PII-Maskierungsverstoß | Agent referenziert PII im Klartext statt `[PII-Daten siehe TRESOR]` | Verwarnung | Sperrung (betroffener Output-Kanal) | GF-Alarm |

Weitere Verstoß-Typen werden bei Bedarf ergänzt — diese Tabelle ist erweiterbar, nicht abschließend.

---

## 4. RBAC — Role-Based Access Control

| Agent | Zugriffsrecht auf A14-Bereiche | Begründung |
|---|---|---|
| A01 (Hermes) | **Kein** Zugriff auf `01_INPUT/01_Quarantäne`. Lesezugriff auf `01_INPUT/02_Eingang` ausschließlich nach gesetztem Freigabe-Vermerk. | Strikte Gate-Trennung — A14 First-Gate, A01 erst danach |
| A07 (Recht) | Empfänger von Eskalationsmeldungen bei PII-/rechtlichen Grenzfällen | Eskalationsziel, kein direkter Zugriff auf Quarantäne |
| A08 (Finanzen, Tresor-Gatekeeper) | Hält Master-Key für TRESOR; verwaltet Zugriffsanfragen auf `K4_Personen` | Bestehende Tresor-Architektur (AES-256, OTP-Hybrid) |
| GF | Vollzugriff auf alle A14-Bereiche inkl. `01_Quarantäne`, jederzeit | Absolute Freigabe-Hoheit |
| A14b | Vollzugriff identisch zu A14a — übernimmt bei Ausfall | Master/Backup, 10 Sek. Failover |
| Alle anderen Agenten | Kein Zugriff auf `01_INPUT/01_Quarantäne` und keine direkten Tresor-Zugriffsrechte | Zugriffstrennung zur Risikominimierung |

---

*A14_Sicherheit — Regeln | Q7-System | Datei 4/5*
