# Q7 – Workflow-Detailmodell

**Version:** 1.2
**Status:** Verbindlich
**Referenziert von:** L5_Q7_Prozessmodell (Standardprozess)
**Löst:** Q7-M-008, Q7-M-023, Q7-M-024, Q7-M-025, Q7-M-026, Q7-M-027, Q7-M-028

---

# Zweck

Dieses Dokument vertieft den in L5 definierten linearen High-Level-Standardprozess um ein maschinenlesbares, ausführbares Detailmodell: Zustände, Case-Verwaltung, Fehlerpfade, Human-in-the-Loop-Regeln und Umgang mit Prozessversionen bei laufenden Fällen.
Es ersetzt nicht den in L5 definierten Standardprozess, sondern macht ihn technisch ausführbar.

---

# Grundprinzipien

## 1. Ausführbarkeit vor Beschreibung

Jeder Prozessschritt aus L5 wird hier auf einen maschinenlesbaren Zustand abgebildet, der von der Workflow-Ausführung eindeutig ausgewertet werden kann.

## 2. MVP-Case-Modell, erweiterbar

Für den aktuellen Ausbaustand wird ein leichtgewichtiges, eigenes Case-Modell verwendet (kein Fremdsystem). Eine spätere Migration auf eine etablierte Workflow-Engine ist architektonisch vorzusehen, aber nicht Bestandteil dieser Version.

## 3. Jeder Case ist eindeutig verfolgbar

Jeder Case besitzt eine eindeutige Case-ID, referenziert die zugehörige Prozess-ID (P_xxx, siehe L5) und durchläuft ausschließlich definierte Zustandsübergänge.

## 4. Fehler sind kein Sonderfall

Jeder Zustand besitzt einen definierten Fehlerpfad. Ein Case bleibt nie in einem undefinierten Zustand stehen.

## 5. Human-in-the-Loop ist risikobasiert, nicht pauschal

Ob und an welcher Stelle ein Case eine menschliche Prüfung durchläuft, ergibt sich aus der Policy Engine (siehe Q7_Policy_Engine_v1_3.md), nicht aus einer festen Regel pro Prozesstyp.

---

# Case-Modell

Jeder Case besteht mindestens aus:

- Case-ID
- Prozess-ID (Referenz auf P_xxx, siehe L5)
- Lizenznehmer/Tenant-ID (siehe Q7_Tenant_Modell_v1_2.md)
- aktueller Zustand
- Zustandshistorie (jeder Übergang mit Zeitstempel, auslösendem Agenten/Ereignis)
- Priorität
- zugeordneter Verantwortlicher (Agent oder Admin, siehe L4/L6)

---

# Zustandsmodell (State Machine)

Erweiterung der in L5 gelisteten Prozessstatus zu einer vollständigen State Machine:

```text
Neu
↓
A01-Koordination
↓
Zugewiesen (an Fachabteilung)
↓
In Bearbeitung ⇄ Wartend (z. B. auf externe Eingabe)
↓
In Prüfung
↓ (bei kritischem Prozess: Zweitprüfung, siehe L5 Vier-Augen-Prinzip)
Zur Freigabe vorgelegt
↓
Freigegeben (Admin) ⇄ Abgelehnt (zurück an Bearbeitung)
↓
Abgeschlossen

Jeder Zustand → Abgebrochen (bei Fehler, siehe Fehlerpfade)
```

Zustandsübergänge sind fest definiert; ein Case kann nicht in einen nicht vorgesehenen Zustand wechseln. Neue Prozesstypen (P_xxx) können zusätzliche fachliche Unterzustände innerhalb von „In Bearbeitung" definieren, ohne das Grundmodell zu verändern (Erweiterbarkeit, siehe L5).

---

# Fehlerpfade & Eskalation

Jeder Zustand besitzt einen definierten Übergang nach „Abgebrochen" bei:

- technischem Fehler (z. B. Tool-/Integrationsfehler)
- fachlicher Ablehnung ohne Korrekturmöglichkeit
- Zeitüberschreitung (SLA-Verletzung, siehe Prozess-ID-Definition P_xxx)

Jeder Übergang nach „Abgebrochen" erzeugt automatisch einen Eskalationseintrag mit:

- auslösendem Zustand
- Fehlerursache (Kategorie)
- eskalierter Instanz (zuständiger Abteilungsleiter oder Admin, je nach Kritikalität)
- Frist zur Bearbeitung (aus P_xxx-Definition, siehe L5 Prozessbestandteile)

Eskalationsfristen und -instanzen je Prozesstyp werden weiterhin in der jeweiligen P_xxx-Definition festgelegt (siehe L5), nicht hier — dieses Dokument definiert nur das generische Eskalationsverhalten der State Machine.

---

# Human-in-the-Loop

Die Entscheidung, ob ein Case an einer bestimmten Zustandsgrenze eine menschliche Prüfung erfordert, wird zur Laufzeit von der Policy Engine getroffen (siehe Q7_Policy_Engine_v1_3.md, Kritikalitätsprüfung), auf Basis von:

- Kritikalitätsstufe des Prozesses (P_xxx-Definition)
- Datenklasse/Sensibilität des Falls
- Lizenznehmerkonfiguration (siehe Q7_Tenant_Modell_v1_2.md)

Die finale Freigabe bleibt in jedem Fall beim Admin (siehe L1 Grundprinzip 9); Human-in-the-Loop-Regeln bestimmen ausschließlich, ob und welche vorgelagerte Fachprüfung vor der Admin-Freigabe verpflichtend ist.

---

# Prozessversionen bei laufenden Cases

Wird eine P_xxx-Definition geändert, während Cases dieses Prozesstyps aktiv sind:

- Der Case läuft standardmäßig mit der Prozessversion weiter, mit der er gestartet wurde.
- Eine Migration laufender Cases auf die neue Prozessversion wird pro Änderung einzeln entschieden, nicht automatisiert.
- Die Migrationsentscheidung (migriert / nicht migriert, Begründung) wird auditiert und ist der Case-Historie zuordenbar.
- Finale Freigabe der Migrationsentscheidung liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

# Akzeptanzkriterien

- Jeder Case ist zu jedem Zeitpunkt genau einem definierten Zustand der State Machine zugeordnet — kein undefinierter Zwischenzustand.
- Jeder Übergang nach „Abgebrochen" erzeugt nachweislich einen Eskalationseintrag mit Ursache, Instanz und Frist.
- Kein Case erreicht „Freigegeben", ohne dass die Admin-Zuordnung im Protokoll eindeutig nachweisbar ist (siehe L5 Akzeptanzkriterien).
- Für jeden Case ist nachvollziehbar, mit welcher Prozessversion er gestartet wurde und ob eine Migrationsentscheidung getroffen wurde.
- Human-in-the-Loop-Prüfungen sind für jeden Case im Protokoll eindeutig einer Policy-Engine-Entscheidung zuordenbar, nicht einer pauschalen Prozesstyp-Regel.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich das ausführbare Detailmodell (Case, Zustände, Fehlerpfade, Migration).
Es vertieft L5 (Prozessmodell) und verweist auf Q7_Policy_Engine_v1_3.md (Human-in-the-Loop-Entscheidung) und Q7_Tenant_Modell_v1_2.md (Lizenznehmerbezug).
Technische Implementierung der Workflow-Ausführung → L8.
Es ersetzt keine Inhalte dieser Dokumente und dupliziert sie nicht (SSOT, siehe L2 Dokumentenregeln).

---

# Änderungsregel

Änderungen am Workflow-Detailmodell dürfen den in L5 definierten Standardprozess nicht widersprechen.
Jede Änderung ist auf Auswirkungen für laufende Cases zu prüfen (siehe „Prozessversionen bei laufenden Cases").
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (09.07.2026): Ausgangsfassung. Löst Q7-M-008, Q7-M-023–028.
- v1.1 (27.07.2026): Terminologie „GF" → „Admin" durchgängig (Q7-VERT-003). Zustandsname „Hermes-Koordination" → „A01-Koordination" (Q7-VERT-004), konsistent mit L5 v1.4 und L4 v1.8 (3-Ebenen-Namenskonvention). Verweise auf Policy Engine auf v1.2 aktualisiert.
- v1.2 (19.09.2026): „Mandant/Tenant-ID" → „Lizenznehmer/Tenant-ID", „Mandantenkonfiguration" → „Lizenznehmerkonfiguration" (Q7-VERT2-009; „Tenant" als technischer ID-Begriff bewusst unverändert). Interne Querverweise auf reale Dateinamen mit Minor-Version korrigiert (Q7_Policy_Engine_v1_3.md, Q7_Tenant_Modell_v1_2.md).
