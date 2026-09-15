# Q7 – Policy Engine & ABAC

**Version:** 1.2
**Status:** Verbindlich
**Referenziert von:** L6_Q7_Agentenmodell (Zugriffsrechte)
**Löst:** Q7-M-015, Q7-M-022, Q7-M-033, Q7-M-034

---

# Zweck

Dieses Dokument definiert die zentrale Policy Engine von Q7 sowie die attributbasierte Zugriffskontrolle (ABAC), die das in L6 definierte grobe Rollenmodell (RBAC) um feingranulare, kontextabhängige Regeln ergänzt.
Es vertieft L6 (Agentenmodell), ohne dessen RBAC-Grundlage zu ersetzen (siehe L6, Abschnitt „Zugriffsrechte (RBAC)").

---

# Grundprinzipien

## 1. RBAC bleibt Basis, ABAC ergänzt

Die pauschale Rollenzuordnung aus L6 (Führungs-, Spezial-, Unterstützungsagenten) bestimmt weiterhin den groben Zugriffsrahmen. ABAC verfeinert diesen Rahmen anhand konkreter Attribute, hebt ihn aber nie auf — ein Zugriff, der bereits per RBAC ausgeschlossen ist, kann durch ABAC nicht freigegeben werden.

## 2. Zentrale Durchsetzung (Enforcement Points)

Policy-Entscheidungen werden nicht dezentral von einzelnen Agenten getroffen, sondern zentral durch die Policy Engine geprüft und an definierten Enforcement Points technisch erzwungen (siehe Q7-M-015, Q7-M-054–058).

## 3. Attributbasierte Bewertung

Jede Zugriffsentscheidung berücksichtigt Attribute aus vier Kategorien: Nutzer/Agent, Daten, Prozess, Tool.

## 4. Kritikalitätsprüfung

Bei kritischen Zugriffen (siehe L5, Qualitätskontrolle „kritische Prozesse") prüft die Policy Engine zwingend vor Ausführung, nicht nachträglich.

## 5. Nachvollziehbarkeit

Jede Policy-Entscheidung (Zulassung wie Ablehnung) wird protokolliert (siehe L2 Grundsatz 6, GUI-Modul PROTOKOLL).

---

# Attributmodell

| Kategorie | Beispiele |
|---|---|
| Nutzer/Agent | Agententyp (L6), Abteilung, Rolle, Sicherheitsfreigabe |
| Daten | Datenklasse, Mandant/Tenant-ID (siehe Q7_Tenant_Modell_v1.md), Sensibilität, Datenraum |
| Prozess | Prozessstatus (L5), Kritikalitätsstufe, Prozess-ID |
| Tool | Tool-Typ, Sandbox-Status, Berechtigungsstufe (siehe Q7-M-037 Tool Gateway) |

Attribute werden nicht dupliziert gespeichert, sondern zur Bewertungszeit aus der jeweils zuständigen Quelle gelesen (Agent-Attribute aus L6-Struktur, Daten-Attribute aus Wissensobjekt-/Datenraum-Metadaten, Prozess-Attribute aus dem laufenden Prozessprotokoll).

---

# Policy Engine — Ablauf

```text
Zugriffsanfrage (Agent → Ressource)
↓
RBAC-Vorprüfung (grobe Rollenzuordnung, siehe L6)
↓ (falls RBAC nicht bereits ausschließt)
ABAC-Bewertung (Attribute aus Nutzer, Daten, Prozess, Tool)
↓
Kritikalitätsprüfung (falls Prozess als kritisch markiert, siehe L5)
↓
Entscheidung: Zulassen / Ablehnen / Eskalieren an Admin
↓
Protokollierung (PROTOKOLL-Modul)
```

Eskalation an den Admin erfolgt, wenn eine Policy-Regel eine Entscheidung nicht eindeutig automatisiert treffen kann (siehe L1 Grundprinzip 9).

---

# Enforcement Points

Die Policy Engine wird an folgenden Punkten technisch zwingend durchlaufen (kein Umgehungspfad):

- Vor jedem Zugriff eines Agenten auf die zentrale Wissensbasis (siehe L7)
- Vor jedem Tool-Aufruf durch einen Agenten (siehe Q7-M-037 Tool Gateway)
- Vor jeder Freigabe/Eskalation innerhalb eines Prozesses (siehe L5)
- Vor jedem mandantenübergreifenden Datenzugriffsversuch (siehe Q7_Tenant_Modell_v1.md, Zugriffsgrenzen)
- Vor jedem Retrieval-Zugriff auf den TRESOR-Bereich (siehe Q7_Sicherheitsmodell_v1.5.md, Datenklasse „Niemals Extern") — dieser Enforcement Point blockiert grundsätzlich, unabhängig von RBAC/ABAC-Rolle des anfragenden Agenten (siehe Abschnitt „Absoluter Enforcement Point: TRESOR" unten)

Die konkrete technische Implementierung der Enforcement Points erfolgt gemäß L8; dieses Dokument definiert das fachliche Regelmodell, nicht die Implementierung selbst.

---

# Absoluter Enforcement Point: TRESOR

Ergänzend zu den regulären ABAC-geprüften Enforcement Points (siehe oben) gilt für den TRESOR-Bereich eine verschärfte Regel: Der Zugriff wird nicht anhand von Attributen bewertet, sondern **grundsätzlich verweigert**, unabhängig vom anfragenden Agenten oder dessen Rolle.

```text
Zugriffsanfrage (Agent → TRESOR/*)
↓
SOFORTIGE ABLEHNUNG (kein RBAC-/ABAC-Check, kein Ausnahmepfad)
↓
Protokollierung (PROTOKOLL-Modul, inkl. anfragender Agent, Zeitstempel, Zielpfad)
↓
Eskalation an Admin, wenn Zugriffsversuch wiederholt oder ungewöhnlich häufig auftritt
```

**Begründung für die Abweichung vom Standard-ABAC-Modell:** Reguläre ABAC-Regeln (siehe „Regelverwaltung") können angepasst, erweitert oder für bestimmte Rollen/Kontexte freigegeben werden. Für TRESOR ist das ausdrücklich nicht vorgesehen — auch nicht für A00 in dessen Überwachungsfunktion (siehe L6, „Systemweite Überwachungsfunktion (A00)"), da die dortige Transparenzpflicht sich auf System-/Agentenverhalten bezieht, nicht auf den Inhalt hochsensibler Datenklassen.

**Ausnahme:** Der Admin selbst kann TRESOR-Inhalte über einen vom Agentensystem getrennten Zugriffspfad einsehen (z. B. direkter Dateisystemzugriff außerhalb der Q7-Anwendung) — dieser Enforcement Point betrifft ausschließlich Agentenzugriffe innerhalb des Systems, nicht den Admin-eigenen Zugriff.

**Offen (Admin-Entscheidung erforderlich):** Der physische Ablageort des TRESOR wurde beim Root-Umzug (25.07.2026) nicht wiederhergestellt. Siehe `Q7_TRESOR_Quarantaene_Entscheidung_2026-07-27.md` für Optionen zur Neufestlegung. Bis zur Entscheidung ist dieser Enforcement Point fachlich spezifiziert, technisch nicht an einen physischen Pfad gebunden.

---

# Regelverwaltung

- Policy-Regeln werden versioniert (analog Wissensobjekte, siehe L7 Grundprinzip 5).
- Neue oder geänderte Regeln durchlaufen denselben Freigabeprozess wie andere Systemänderungen (siehe L2 Änderungsprozess) — finale Freigabe durch Admin.
- Regeln werden nicht im Agenten selbst hinterlegt (Verstoß gegen L6 Grundprinzip 5, Zentrale Wissensnutzung), sondern zentral in der Policy Engine.

---

# Akzeptanzkriterien

- Kein Zugriff eines Agenten auf Wissen, Tools oder mandantenfremde Daten ist ohne vorherige Policy-Engine-Prüfung technisch möglich.
- Jede Policy-Entscheidung (Zulassung, Ablehnung, Eskalation) ist im PROTOKOLL-Modul einem konkreten Zugriffsversuch zuordenbar.
- ABAC-Regeln können ein durch RBAC bereits ausgeschlossenes Zugriffsrecht nachweislich nicht erweitern.
- Jeder als kritisch markierte Prozessschritt (L5) weist eine Policy-Engine-Prüfung vor Ausführung nach, nicht nachträglich.
- Jede Änderung einer Policy-Regel ist versioniert und im Änderungsverlauf mit Admin-Freigabe nachvollziehbar.
- Kein Agent (unabhängig von Rolle, inkl. A00) erhält nachweislich Zugriff auf TRESOR-Inhalte über das Agentensystem — jeder Versuch wird abgelehnt und protokolliert.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich das fachliche Regel- und Attributmodell der Policy Engine.
Es vertieft L6 (Agentenmodell) und verweist auf L5 (Prozesskritikalität), L7 (Wissensattribute) und den Tenant-Modell-Anschluss.
Technische Implementierung der Enforcement Points → L8.
Es ersetzt keine Inhalte dieser Dokumente und dupliziert sie nicht (SSOT, siehe L2 Dokumentenregeln).

---

# Änderungsregel

Änderungen am Policy-Modell dürfen bestehende RBAC-Zuordnungen aus L6 nicht unterlaufen.
Jede Änderung ist auf Auswirkungen für Agenten, Prozesse, Wissen und Tenant-Struktur zu prüfen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (09.07.2026): Ausgangsfassung. Löst Q7-M-015, Q7-M-022, Q7-M-033, Q7-M-034.
- v1.1 (11.07.2026): Abschnitt „Absoluter Enforcement Point: 04_TRESOR" ergänzt.
- v1.2 (27.07.2026): Terminologie „GF" → „Admin" durchgängig (Q7-VERT-001). TRESOR-Pfad von `04_TRESOR` auf generischen TRESOR-Bereich umgestellt — physischer Pfad offen bis Admin-Entscheidung (siehe Q7_TRESOR_Quarantaene_Entscheidung_2026-07-27.md). Verweis auf Q7_Sicherheitsmodell auf v1.5 aktualisiert.
