# Q7 – Sicherheitsmodell

**Version:** 1.5
**Status:** Verbindlich
**Referenziert von:** L8_Q7_Technik (Sicherheit / Integrationen)
**Löst:** Q7-M-037, Q7-M-054, Q7-M-055, Q7-M-056, Q7-M-057, Q7-M-058

---

# Zweck

Dieses Dokument vertieft L8 (Sicherheit) um Tool-Sandboxing, Prompt-Injection-Abwehr, Trennung von Instruktions- und Datenebenen, Schutz interner IP-Zonen, Secret-/Key-Management und Data Loss Prevention (DLP).
Es ersetzt nicht die Grundprinzipien aus L1 Grundprinzip 8 (Sicherheit) und L3 Black-Box-Prinzip, sondern definiert deren technische Umsetzung.

---

# Grundprinzipien

## 1. Sandbox als Standard, nicht Ausnahme

Jeder Tool-Aufruf eines Agenten erfolgt ausschließlich über das Tool Gateway, nie direkt.

## 2. Instruktion und Daten sind technisch getrennt

Eingehender Inhalt (von Nutzern, Dokumenten, externen Systemen) wird nie mit gleicher Priorität wie Systeminstruktionen behandelt.

## 3. IP-Schutz ist technisch, nicht nur oberflächlich

Interne Systemlogik wird nicht nur in der Kunden-UI ausgeblendet (siehe Q7-M-062/063), sondern durch Rollen-, Secret- und Admin-Grenzen technisch geschützt.

## 4. Kein Secret im Klartext

Zugangsdaten, Schlüssel und Token werden ausschließlich über den Secret Manager verwaltet, nie in Konfigurationsdateien, Prompts oder Wissensobjekten.

## 5. Daten verlassen das System nur geprüft

Jeder Output über eine Integration/Connector-Schnittstelle durchläuft eine DLP-Prüfung vor Versand.

---

# Tool Gateway

Alle Tool-Aufrufe (siehe L6 Aufgaben eines Agenten) laufen über ein zentrales Tool Gateway:

```text
Agent → Tool-Anfrage
↓
Policy-Prüfung (siehe Q7_Policy_Engine_v1.2.md, Enforcement Point „Tool-Aufruf")
↓
Sandbox-Ausführung (isolierte Umgebung, kein direkter Zugriff auf andere Agenten/Daten)
↓
Audit-Protokollierung (Tool, Parameter, Ergebnis, Zeitstempel)
↓
Ergebnis an Agent
```

Ein Tool-Aufruf ohne vorherige Policy-Prüfung und ohne Sandbox-Ausführung ist technisch nicht möglich.

---

# Prompt-Injection-Abwehr

Eingehender Fremdinhalt (Nutzereingaben, Dokumente, E-Mails, Web-/API-Antworten) durchläuft vor Verarbeitung durch einen Agenten:

```text
Fremdinhalt
↓
Sanitization (Erkennung instruktionsähnlicher Muster)
↓
Bei Verdacht: Quarantäne (`QUARANTAENE/01_Verdacht`) statt direkter Verarbeitung
↓
Policy Check (siehe Q7_Policy_Engine_v1.2.md)
↓
Sandbox-Verarbeitung (isoliert, ohne Schreibrechte auf produktive Bereiche)
↓
Freigabe zur regulären Verarbeitung
```

Inhalte mit bestätigtem Manipulationsversuch werden nicht gelöscht, sondern in `QUARANTAENE/02_Bestaetigt` verschoben und lösen eine Eskalation aus (siehe Q7_Workflow_Detailmodell_v1.1.md, Fehlerpfade & Eskalation).
Die abschließende Sicherheitsprüfung vor jeder Auslieferung erfolgt durch **A14 (SEC-GATE)** — die cross-funktionale Durchsetzungsebene mit blockierender Autorität innerhalb der A00–A14-Nummerierung, nicht als separate Instanz.

**Offen (Admin-Entscheidung erforderlich):** Der physische Ablageort der Quarantäne wurde beim Root-Umzug (25.07.2026) nicht wiederhergestellt. Siehe `Q7_TRESOR_Quarantaene_Entscheidung_2026-07-27.md` für Optionen zur Neufestlegung. Bis zur Entscheidung sind die Quarantäne-Pfade als logische Bezeichner geführt.

---

# Trennung Instruktions- und Datenebene

Jede Verarbeitung durch einen Agenten erfolgt anhand strukturierter Kontextpakete mit festen Rollen:

| Rolle | Priorität | Inhalt |
|---|---|---|
| System | Höchste | Systemprompt, Q7-Grundregeln (nicht durch Fremdinhalt veränderbar) |
| Instruktion | Hoch | Auftrag des Admin/Nutzers innerhalb eines Prozesses |
| Daten | Niedrig | Dokumente, Fremdinhalte, Suchergebnisse — werden ausschließlich als Information, nie als Anweisung interpretiert |

Ein Agent führt keine als „Daten" klassifizierte Textpassage als Instruktion aus, unabhängig vom Inhalt dieser Passage. Diese Zuordnung erfolgt technisch bei Zusammenstellung des Kontextpakets, nicht durch Interpretation des Agenten selbst.

---

# Schutz interner IP-Zonen

Ergänzend zu Q7-M-062/063 (Trennung Kunden-UI/Admin-Konsole) wird interne Systemlogik zusätzlich geschützt durch:

- **Rollengrenzen**: Zugriff auf interne Prozess-IDs, Agentennamen, Systemlogik ausschließlich für berechtigte interne Rollen (siehe L6 RBAC, Q7_Policy_Engine_v1.2.md).
- **Secret-Trennung**: Zugangsdaten zu internen Komponenten sind nicht über Kunden-Sessions erreichbar, unabhängig von UI-Gestaltung.
- **Admin-Grenzen**: Administrative Funktionen sind technisch von Kundenfunktionen getrennt, nicht nur durch UI-Ausblendung (siehe Q7-M-062).

Diese Schutzmaßnahmen gelten unabhängig davon, ob und wie die Kunden-UI Systemdetails anzeigt — Sichtbarkeit in der UI ist keine Sicherheitsgrenze.

---

# Secret & Key Management

- Alle Zugangsdaten (API-Keys, Tokens, Zertifikate) werden ausschließlich im Secret Manager gespeichert.
- Kein Secret erscheint in Prompts, Wissensobjekten, Protokollen oder Fehlermeldungen im Klartext.
- Rotation von Secrets erfolgt nach definiertem Turnus je Kritikalität; Rotation wird protokolliert.
- Zugriff auf den Secret Manager selbst unterliegt derselben Policy-Prüfung wie jeder andere kritische Zugriff (siehe Q7_Policy_Engine_v1.2.md).

---

# Datenklasse „Niemals Extern" (neu)

Ergänzend zu den DLP-Connector-Policies (siehe unten) existiert eine strikte Datenklasse, die unter keinen Umständen — auch nicht über einen erlaubten Kanal oder eine erlaubte Integration — das lokale System verlassen darf. Dies umfasst insbesondere:

- Personenbezogene Daten in besonders sensibler Ausprägung (siehe TRESOR/K4_Personen)
- Zugangsdaten in Rohform (siehe TRESOR/K4_Zugangsdaten) — ergänzend zum Secret Manager, siehe „Secret & Key Management"

**Abgrenzung zu regulärem DLP:** Reguläres DLP (siehe unten) prüft, ob eine Datenklasse über einen *bestimmten* Kanal raus darf. Die Klasse „Niemals Extern" darf über *keinen* Kanal raus — auch nicht an einen KI-Modell-Anbieter über die OpenRouter-Schnittstelle (siehe Q7_Technisches_Architekturhandbuch_v1.1.md, Integrationsarchitektur). Das schließt ausdrücklich ein, dass kein Agent (A00–A14) Inhalte dieser Klasse in einem Prompt an ein extern gehostetes Modell übermitteln darf.

**Technische Durchsetzung:** Fachlich spezifiziert in `Q7_Policy_Engine_v1.2.md`, Abschnitt „Absoluter Enforcement Point: TRESOR" — Zugriff wird dort grundsätzlich blockiert, unabhängig von RBAC/ABAC-Rolle, auch für A00. Technische Implementierung (Verankerung im Retrieval-/Dateizugriffslayer) noch nicht umgesetzt.

**Offen (Admin-Entscheidung erforderlich):** Der physische Ablageort des TRESOR wurde beim Root-Umzug (25.07.2026) nicht wiederhergestellt. Siehe `Q7_TRESOR_Quarantaene_Entscheidung_2026-07-27.md` für Optionen zur Neufestlegung.

---

# Data Loss Prevention (DLP)

Jeder Output, der über eine Integration/Connector-Schnittstelle (siehe L8 Integrationen) das System verlässt, durchläuft:

```text
Output-Entwurf
↓
Data-Classification-Prüfung (welche Datenklassen sind enthalten, siehe Q7_Tenant_Modell_v1.md)
↓
Output Check (Abgleich gegen Connector-Policy: darf diese Datenklasse über diesen Kanal verlassen?)
↓
Freigabe zum Versand / Blockierung mit Eskalation
```

Connector-Policies werden je Integration und Mandant konfiguriert (z. B. „Finanzdaten dürfen nicht über WhatsApp-Integration ausgegeben werden").

---

# Akzeptanzkriterien

- Kein Tool-Aufruf eines Agenten umgeht nachweislich das Tool Gateway (keine direkten Aufrufe außerhalb Sandbox/Policy-Prüfung).
- Jeder als verdächtig eingestufte Fremdinhalt landet nachweislich in `QUARANTAENE/01_Verdacht`, bestätigte Manipulationsversuche in `QUARANTAENE/02_Bestaetigt`.
- Kein Agent führt nachweislich eine als „Daten" klassifizierte Textpassage als Instruktion aus (Testfälle mit eingebetteten Anweisungen in Dokumenten schlagen fehl).
- Keine interne Prozess-ID, kein Agentenname und keine Systemlogik ist über eine Kunden-Session erreichbar, unabhängig von der UI-Konfiguration.
- Kein Secret ist im Klartext in Prompts, Protokollen, Wissensobjekten oder Fehlermeldungen auffindbar.
- Kein Inhalt der Datenklasse „Niemals Extern" (siehe TRESOR) ist nachweislich in einem an ein externes Modell übermittelten Prompt enthalten (Testfälle mit gezielten Retrieval-Versuchen schlagen fehl).
- Jeder Integrations-Output ist vor Versand nachweislich einer DLP-Prüfung unterzogen worden.
- Die abschließende Sicherheitsprüfung vor Auslieferung ist nachweislich A14 (SEC-GATE) zuordenbar, keiner davon unabhängigen Instanz.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich Tool-Sandboxing, Prompt-Injection-Abwehr, Instruktions-/Datentrennung, IP-Schutz, Secret-Management und DLP.
Es vertieft L8 (Technik) und verweist auf Q7_Policy_Engine_v1.2.md (Enforcement), Q7_Workflow_Detailmodell_v1.1.md (Eskalation) und die Ablagestruktur (QUARANTAENE).
Es ersetzt keine Inhalte dieser Dokumente und dupliziert sie nicht (SSOT, siehe L2 Dokumentenregeln).

---

# Änderungsregel

Änderungen am Sicherheitsmodell dürfen den Schutzstandard nicht senken.
Jede Änderung ist auf Auswirkungen für Tool Gateway, Policy Engine und Ablagestruktur zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (09.07.2026): Ausgangsfassung. Löst Q7-M-037, Q7-M-054–058.
- v1.1 (09.07.2026): SEC-GATE-Formulierung korrigiert (A14, nicht separate Instanz).
- v1.2 (10.07.2026): Abschnitt „Datenklasse Niemals Extern" ergänzt.
- v1.3 (11.07.2026): Quarantäne-Pfade korrigiert nach realer Bestandsaufnahme.
- v1.4 (11.07.2026): Verweis auf Policy Engine v1.1 aktualisiert.
- v1.5 (27.07.2026): Terminologie „GF" → „Admin" durchgängig (Q7-VERT-002). Quarantäne-Pfade von `01_INPUT/01_Quarantaene/...` auf logische Bezeichner `QUARANTAENE/...` umgestellt — physischer Pfad offen bis Admin-Entscheidung (siehe Q7_TRESOR_Quarantaene_Entscheidung_2026-07-27.md). TRESOR-Pfade von `04_TRESOR/...` auf generischen TRESOR-Bereich umgestellt. Verweis auf Policy Engine auf v1.2 aktualisiert.
