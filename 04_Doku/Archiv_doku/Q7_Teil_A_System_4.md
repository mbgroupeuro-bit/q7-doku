# Q7_Teil_A_System.md — KERNÜBERSICHT
**System-Version:** | **GUI-Version:** GUI_v2.0 | **Aktualisiert:** 27.06.2026
**Änderungen seit letzter Version:** Freigabe-Gate (H-05), TRESOR-Zugriffsspec, A04-Deputy-Failover ergänzt (siehe Abschnitt 14)

> **Ein Satz:** Q7 ist ein KI-Betriebssystem aus spezialisierten Agenten, gesteuert durch einen menschlichen Geschäftsführer (GF). Einziger Mensch im System — alles andere ist KI.

---

## 1. WAS IST Q7?

Q7 ist kein reales Unternehmen mit menschlichen Mitarbeitern. Es ist ein **KI-Betriebssystem** — eine Sammlung von KI-Agenten, die in einer definierten Hierarchie und Struktur zusammenarbeiten, um Aufträge zu bearbeiten. Der einzige Mensch ist der GF (Geschäftsführer), der entscheidet, freigibt und stoppt.

**Zweck:** Kunden-Analyse & digitale Transformation für kleine Unternehmen (Restaurants, Dienstleister, Einzelhandel).

**Status:** Aktive Testphase. Jedes Feature durchläuft: Sandbox → Testlauf → Freigabe.

---

## 2. DREI SÄULEN DES SYSTEMS

| Säule | Was | Wo dokumentiert |
|-------|-----|-----------------|
| **Grob** | Grundgedanke, Architektur, grobe Übersicht | `Q7_Teil_A_System.md` |
| **Detail** | Prozesse, Kultur, Change-Management, Bugs | `Q7_Teil_B_System.md` |
| **Struktur** | Ordner, Agenten, Hierarchie, Zuordnungen + **Prozess-Register** | `Q7_Teil_C_System.md` |

---

## 3. GRUNDARCHITEKTUR — 7 HAUPT-ORDNER

```
📁 ROOT
│
├── 📁 01_INPUT          ← Alles von der Außenwelt
├── 📁 02_KI-UNTERNEHMEN ← Das KI-Betriebssystem (Agenten)
├── 📁 03_OUTPUT         ← Alles was Agenten erstellt haben
├── 📁 04_TRESOR         ← Nur sensible Daten (verschlüsselt)
├── 📁 05_UNTERNEHMEN    ← Unternehmensdaten & Betriebswissen
├── 📁 06_WISSEN         ← Allgemeines & spezielles Wissen
└── 📁 04_Doku           ← Systemdokumentation, Versionen, Learnings
```

**Logik:** Jeder Ordner beantwortet eine Frage:

| Ordner | Frage | Inhalt |
|--------|-------|--------|
| 01_INPUT | Was kommt rein? | Alles von der Außenwelt |
| 02_KI-UNTERNEHMEN | Wer arbeitet? | Das gesamte KI-System |
| 03_OUTPUT | Was geht raus? | Alle Agenten-Ergebnisse |
| 04_TRESOR | Was ist geheim? | Personenbezogene & sicherheitskritische Daten |
| 05_UNTERNEHMEN | Wer sind wir? | Betriebliches Wissen & Dokumentation |
| 06_WISSEN | Was wissen wir? | Externes & allgemeines Wissen |
| 04_Doku | Was ist dokumentiert? | Aktuelle Version, Archiv, Testlearnings |

**Wichtigste Trennlinie:**
- **04_TRESOR:** Kontaktdaten, Bankdaten → verschlüsselt, nur via TZ (Tresor-Zuständiger — Gatekeeper für Tresor-Zugriff; Rolle liegt bei A08). **Technischer Zugriffs-Workflow → siehe Abschnitt 14.2**
- **05_UNTERNEHMEN:** Stammdaten, Analysen → betriebliches Wissen, intern

> **Vollständige Struktur aller Unterordner → siehe `Q7_Teil_C_System.md`**

---

## 4. HIERARCHIE — 5 EBENEN

**4a. BEFEHLSHIERARCHIE — wer berichtet wem:**

```
👑 GF — GESCHÄFTSFÜHRER (Mensch — höchste Instanz)
   ↕
🖥️  DESKTOP-OBERFLÄCHE (GUI_v2.0) — einzige Schnittstelle zum GF
   ↕
🎯 HERMES-AGENT (A01) — koordiniert alle Aufträge, erstellt Workflows
   ↓
📁 A02–A14 FACHABTEILUNGEN — spezialisierte Arbeit
```

**4b. DATENFLUSS — wo A14 und A00 eingreifen:**

```
01_INPUT/01_Quarantäne (Eingang)
   ↓
🛡️ A14_SICHERHEIT — PII-Gate [technisch erzwungen — kein Bypass]
   ↓ Freigabe
🎯 HERMES-AGENT (A01) — erhält Input erst nach A14-Freigabe
   ↓
📁 Fachabteilungen A02–A14

🧠 A00 (Stab-Agent) ··· beobachtet alle Schritte passiv [kein Eingriff]
```

> **Legende:** `↓` = Befehlskette / Datenfluss | `···` = passive Beobachtung (kein Eingriff) | A14 = Sicherheits-Gate, außerhalb der Befehlshierarchie

| Ebene | Wer | Funktion |
|-------|-----|----------|
| Kontrolle | GF (Mensch) | Entscheidet, freigibt, stoppt — kann jeden Agenten abschalten |
| Beobachtung | Stab-AGENT (A00) | Überwacht alle Ebenen passiv — kein Eingriff, kein Befehl |
| Sicherheits-Gate | A14_Sicherheit | Trennt PII von Sachdaten — eigenständig, außerhalb der Befehlskette |
| Koordination | Hermes-Agent (A01) | Plant, verteilt, prüft — alle Aufträge laufen durch ihn |
| Ausführung | Fachabteilungen A02–A14 | Spezialisierte Arbeit pro Domäne |

**Kernregeln:**
- **GF** = einziger Mensch. Vollständige Kontrolle. Kann jeden Agenten abschalten.
- **GUI** = einzige Schnittstelle zwischen GF und System. Kein direkter Ordnerzugriff.
- **Stab-AGENT (A00)** = beobachtet alle Ebenen passiv. KEINE Entscheidungsbefugnis. Ausnahme: darf Kultur-Vorschläge einreichen (kein Entscheid, nur Vorschlag).
- **A14** = eigenständig, außerhalb der Befehlskette. Kein Agent kann A14-Prüfung umgehen oder beschleunigen. Hermes-Stopp ist technisch erzwungen (Gate-Mechanismus).
- **Hermes (A01)** = erhält Kunden-Input erst NACH A14-Freigabe.
- **Failover (Basis):** Hermes fällt aus → A01b übernimmt automatisch (Master/Backup). **Erweiterte Eskalation bei Doppelausfall → siehe Abschnitt 14.3**

> **Alle Hierarchie-Regeln im Detail → siehe `Q7_Teil_B_System.md` Kap. 1**

---

## 5. HART vs. FLEXIBEL — CHANGE-PHILOSOPHIE

Nicht alles darf geändert werden. Das System unterscheidet:

| HART (unverrückbar) | FLEXIBEL (änderbar) |
|---------------------|---------------------|
| 7-Ordner-Grundarchitektur | Abteilungsstruktur A02–A14 |
| GF als einziger Entscheider | Agenten-Kürzel |
| Quarantäne-3-Filter | Checkpoint-Schwellenwerte |
| Audit-Trail/Hash-Validierung | Kultur-Werte (Erweiterung via GF-Entscheid) |
| RBAC-Grundprinzip | Prozess-Details P_001–P_017 |
| Master/Backup-Failover-Logik | GUI-Module |
| A14-Gate-Mechanismus | KPI-Schwellenwerte |
| **Freigabe-Gate-Mechanismus (H-05)** | Prozess-Inhalte |
| Prozess-Register in Teil C | — |

**Kultur-Änderungsprozess:** A00 schlägt vor → GF entscheidet → A09 dokumentiert.

> **Vollständiges Change-Management → siehe `Q7_Teil_B_System.md` Kap. 29**

---

## 6. ABTEILUNGEN — ÜBERSICHT

**Stab & Koordination:**

| Kürzel | Abteilung | Aufgabe |
|--------|-----------|---------|
| A00 | Stab-Agent | Passiver Beobachter aller Ebenen, Kultur-Vorschläge |
| A01 | Hermes — Planung & BackOffice | Koordination, Workflows, Qualitätskontrolle |
| A01a | Master-Agent | Operative Ausführungs-Koordination (Primär) |
| A01b | Backup-Agent | Operative Ausführungs-Koordination (Sekundär — springt bei A01a-Ausfall automatisch ein) |

**Fachabteilungen:**

| Kürzel | Abteilung | Aufgabe |
|--------|-----------|---------|
| A02 | Marketing | Markenführung, Content, Kundenkommunikation |
| A03 | Vertrieb | Akquise, Angebote, Kundenbeziehungen |
| A04 | Projektmanagement | Projektplanung, Ressourcen, Deadlines. **Zusätzlich: Deputy-Koordination bei Hermes-Doppelausfall (siehe 14.3)** |
| A05 | Qualitätsmanagement | Qualitätssicherung, Standards, Prüfung. **Zusätzlich: Freigabe-Vorprüfung H-04b (siehe 14.1)** |
| A06 | Verwaltung | Interne Organisation, Dokumentenverwaltung |
| A07 | Recht | Compliance, Verträge, Datenschutz. **Zusätzlich: Notfall-Fallback TRESOR-Zugriff (siehe 14.2)** |
| A08 | Finanzen | Rechnungsstellung, Budget, TZ-Gatekeeper (Tresor-Zugriff, Master-Key-Halter) |
| A09 | Dokumentation | Technische Dokumentation, Wissensmanagement |
| A10 | KI-Center | KI-Entwicklung, Modelle, Training |
| A11 | Systemcontrolling | Überwachung, Anomalien, Systemgesundheit, Failover-Alarm |
| A12 | Zukunftsforschung | Trends, Innovation, Benchmarks |
| A13 | Personal | Agenten-Lebenszyklus (Onboarding bis Kündigung) |
| A14 | Sicherheit | PII-Trennung, Datenschutz, Zugriffsschutz, Gate-Mechanismus |

> **Vollständige Agentenliste pro Abteilung → siehe `Q7_Teil_C_System.md`**

---

## 7. PROZESSE — ÜBERBLICK

Alle Prozesse sind vollständig im **Prozess-Register** in `Q7_Teil_C_System.md` dokumentiert.

**Zwei Prozesskategorien:**

| Kategorie | Beschreibung | Beispiele |
|-----------|-------------|---------|
| Systemprozesse | Interne Abläufe — vom Eingang bis zum internen Auftrag | Quarantäne, PII-Trennung, Failover |
| Kundenprozesse | Externe Abläufe — von Kundenkontakt bis Ergebnis-Freigabe | Kundenanalyse P_016, DNA-Dreiteiler P_017 |

**Dateiname-Konvention für alle Prozess-Dateien:**
```
P_[ID]_[KÜRZEL-AGENT]_[KURZNAME]_v[VERSION].md

Beispiel:
P_016_A01_Kundenanalyse_v3.2.md
P_017_A01_DNA-Dreiteiler_v1.0.md
```

**Felder:**
- `P_[ID]` — dreistellig, fortlaufend (P_001, P_016 ...)
- `[KÜRZEL-AGENT]` — verantwortlicher Agent (A01, A05 ...)
- `[KURZNAME]` — max. 20 Zeichen, kein Leerzeichen
- `v[VERSION]` — Major.Minor

> **Vollständiges Prozess-Register mit allen Regeln, Abhängigkeiten und Änderungsprotokoll → siehe `Q7_Teil_C_System.md` Abschnitt: PROZESS-REGISTER**

> **Prozess-Inhalte im Detail → siehe `Q7_Teil_B_System.md` Kap. 27**

---

## 8. Q7-KULTUR — 8 WERTE

| Wert | Kurzform |
|------|----------|
| V1 | Transparenz über Effizienz |
| V2 | Mensch vor Maschine |
| V3 | Fehlertoleranz mit Verantwortung |
| V4 | Zusammenarbeit > Spezialisierung |
| V5 | Qualität ist nicht verhandelbar |
| V6 | Kontinuierliches Lernen |
| V7 | Respekt vor Grenzen |
| V8 | Radikale Ehrlichkeit |

**Änderungsrecht:** Nur GF. Vorschlagsrecht: A00. Dokumentation: A09.

> **Vollständige Kultur mit Code of Conduct, Entscheidungsmaximen, Geschäftsprinzipien → siehe `Q7_Teil_B_System.md` Kap. 28**

---

## 9. AUFTRAGSFLUSS — ÜBERBLICK

```
01_INPUT/01_Quarantäne
   ↓ A01 (Hermes): 3-Filter-Sicherheitsschleuse (max. 15 Min SLA)
   ↓ 01_INPUT/02_Eingang
   ↓ A14: PII-Trennung & Gate-Freigabe (technisch erzwungen)
   ↓ A01 (Hermes): Workflow erstellen
   ↓ H-02: Arbeitsvorbereitung
   ↓ H-03: Koordination & Überwachung
   ↓ Fachabteilungen A02–A14: Facharbeit
   ↓ H-04: Qualitätskontrolle
   ↓ H-04b: Freigabe-Vorprüfung (A05) — technisch erzwungenes Gate [NEU]
   ↓ H-05: Abschluss & Meldung an GF via GUI
   ↓ 03_OUTPUT → GF-Freigabe → Versand
```

> A00 beobachtet alle Schritte passiv — kein Eingriff, nicht im Fluss dargestellt.
> Fehlerflüsse & Eskalationspfade → siehe `Q7_Teil_B_System.md` Kap. 27
> **Details zum Freigabe-Gate (H-04b/H-05) → siehe Abschnitt 14.1**

---

## 10. GUI — SECHS MODULE

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  KI-UNTERNEHMEN (Q7)                             [GF: Name]  [🔒]          │
├──────────┬──────────┬──────────┬──────────┬──────────────┬────────────────┤
│  INBOX   │ AUFTRÄGE │FREIGABEN │ AGENTEN  │   PROTOKOLL  │   🐛 BUGS      │
└──────────┴──────────┴──────────┴──────────┴──────────────┴────────────────┘
```

- **INBOX** — Neue Eingänge aus Quarantäne
- **AUFTRÄGE** — Status aller aktiven Aufträge (anklickbar: Detailansicht mit Einzelschritten)
- **FREIGABEN** — GF entscheidet aktiv; nichts geht ohne Freigabe weiter. **Button "Freigeben" technisch gesperrt, bis A05-QM-Check (H-04b) grünes Licht gibt.**
- **AGENTEN** — Systemstatus aller Agenten auf einen Blick
- **PROTOKOLL** — Lückenloser, unveränderlicher Audit-Trail
- **BUGS** — Bug-Lifecycle: Erkennung → GF-Entscheidung → Lösung

Zugriff: PC/Desktop + Smartphone (mobil, identischer Funktionsumfang). Nur GF hat Login.

---

## 11. KERNPRINZIPIEN (HART/UNVERRÜCKBAR)

| Prinzip | Bedeutung |
|---------|-----------|
| 7-Ordner-Architektur | Fest. Erweiterung nur mit GF-Entscheidung. |
| GF als einziger Entscheider | Keine Autonomie ohne explizite GF-Freigabe. |
| Quarantäne-3-Filter | Jeder Input durchläuft alle drei Filter. Kein Bypass. |
| Audit-Trail / Hash-Validierung | Unveränderlich. Keine Löschfunktion. |
| RBAC-Grundprinzip | Kein Agent greift auf Bereiche außerhalb seiner Rolle zu. |
| Master/Backup-Failover | Automatisch. Kein manueller Eingriff nötig (Basis-Stufe). |
| A14-Gate-Mechanismus | Technisch erzwungen. Hermes wartet — kein manuelles Protokoll. |
| **Freigabe-Gate-Mechanismus** | **Technisch erzwungen wie A14. GF-Freigabe-Button gesperrt ohne A05-Vorprüfung.** |
| Prozess-Register (Teil C) | Einzige Wahrheit über alle Prozesse. Änderungen nur dort. |

---

## 12. DATEI-ÜBERBLICK — WAS STEHT WO?

| Datei | Inhalt | Änderungshäufigkeit |
|-------|--------|---------------------|
| `Q7_Teil_A_System.md` | Diese Datei — Grundgedanke, grobe Architektur | Selten (nur bei Grundsatzentscheidungen) |
| `Q7_Teil_B_System.md` | Alle Regeln, Prozess-Inhalte, Kultur, Change/Bug-Management, Fehlerflüsse | Mittel (bei neuen Prozessen, Kultur-Updates) |
| `Q7_Teil_C_System.md` | Ordnerstruktur, Agenten-Liste, Abteilungs-Zuordnung, **Prozess-Register** | Häufig (bei neuen Agenten, Ordner-Änderungen, **Prozess-Änderungen**) |
| `Q7_Neuerungen_vXX_X.md` | Versionshistorie & Changelog | Jede Version |

---

## 13. GLOSSAR

| Begriff | Definition |
|---------|------------|
| TZ | Tresor-Zuständiger — systeminterner Gatekeeper für Tresor-Zugriff. Rolle liegt bei A08 (Finanzen). Hält Master-Key, generiert Session-OTPs (siehe 14.2). |
| RBAC | Role-Based Access Control — Agenten greifen nur auf Bereiche ihrer definierten Rolle zu. |
| PII | Personally Identifiable Information — personenbezogene Daten (Kontakt, Bank, etc.). Wird von A14 getrennt. |
| SLA | Service Level Agreement — maximale Bearbeitungszeit pro Prozessschritt (z.B. 15 Min für Quarantäne-Filter). |
| Gate-Mechanismus | Technisch erzwungener Stopp im Auftragsfluss. Beispiele: A14-Gate (Eingang), Freigabe-Gate (Ausgang, H-04b/H-05). Kein manueller Bypass möglich. |
| PCR | Prozess-Änderungs-Regel — jede Prozessänderung wird ausschließlich in Teil C (Prozess-Register) dokumentiert. |
| OTP | One-Time-Key — zeitlich begrenzter Zugriffsschlüssel für TRESOR-Zugriffe (gültig 1h), generiert durch A08 (siehe 14.2). |
| Deputy-Mode | Eingeschränkte Notfall-Koordinationsrolle von A04, aktiv nur bei Doppelausfall A01a+A01b bis GF-Entscheidung (siehe 14.3). |

---

## 14. NEUE KOMPONENTEN — GF-FREIGABE 27.06.2026

> **Status:** Freigegeben durch GF am 27.06.2026. Volldokumentation folgt in Teil B/C. Diese Sektion ist die verbindliche Kurzreferenz bis zur Integration in Teil B/C.

### 14.1 Freigabe-Gate (H-04b → H-05)

**Ziel:** GF-Freigabe-Schritt erhält denselben technischen Zwang wie das A14-Gate am Eingang.

```
H-04 (Qualitätskontrolle, bestehend)
   ↓
H-04b (NEU): Freigabe-Vorprüfung
   - A05 (QM) prüft alle Qualitäts-Kriterien
   - Ergebnis: Status = "FREIGABE-BEREIT" oder zurück an Fachabteilung
   ↓ (nur wenn FREIGABE-BEREIT)
H-05: Abschluss & GF-Freigabe
   - GUI-Button "Freigeben" technisch gesperrt, solange Status ≠ FREIGABE-BEREIT
   - GF entscheidet: ✓ Freigeben → 03_OUTPUT/Versand | ✗ Ablehnen → zurück an Fachabteilung
```

**SLA:**
- H-04b (A05-Check): 1 Arbeitstag
- GF-Freigabe-Entscheidung: 2 Arbeitstage
- Bei Überschreitung: A11 alarmiert GF (Eskalations-Reminder)

---

### 14.2 TRESOR-Zugriffsspec (OTP-Hybrid)

**Ziel:** Technisch abgesicherter, nachvollziehbarer Zugriff auf 04_TRESOR.

```
Verschlüsselung: AES-256 (at-rest)
Master-Key: gehalten von A08 (TZ), Rotation alle 30 Tage
Zugriffs-Workflow:
  1. Agent fordert TRESOR-Datei an (via GUI)
  2. A08 prüft Berechtigung (RBAC)
  3. Berechtigt → A08 generiert One-Time-Key (OTP), gültig 1h
  4. Agent entschlüsselt Datei mit OTP, OTP verfällt danach automatisch
  5. Zugriff wird geloggt: [Zeitstempel] [Agent] [Datei] [OTP-ID]

Notfall-Fallback (A08-Ausfall):
  - A07 (Recht) hält dokumentierten Notfall-Key
  - Nur für als KRITISCH markierte Zugriffe nutzbar
  - Nachträgliche GF-Review jedes Notfall-Zugriffs verpflichtend
```

**Audit-Trail:** Alle Zugriffe (regulär + Notfall) lückenlos in 04_Doku protokolliert.

---

### 14.3 A11-Failover mit Deputy-Mode (A04)

**Ziel:** Kein Totalausfall der Koordination bei gleichzeitigem A01a+A01b-Ausfall.

```
Stufe 1 (0–10 sec):   A01a fällt aus → A01b übernimmt automatisch (Basis-Failover, bestehend)
Stufe 2 (10–120 sec): A01b fällt ebenfalls aus
   → A11 alarmiert GF (SLA: 2 Min)
   → PARALLEL: A04 aktiviert Deputy-Mode
      - ERLAUBT: neue Eingänge klassifizieren, an verfügbare Agenten weiterleiten
      - NICHT ERLAUBT: strategische Entscheidungen, Freigaben, Prozess-Änderungen
Stufe 3 (>120 sec):  GF reagiert nicht
   → A11 versucht A01-Recovery
   → A04-Deputy-Mode bleibt aktiv
   → Eskalations-Alert an GF (dringlich, z.B. visuell hervorgehoben in GUI)
```

**Audit-Trail:** Jede Failover-Stufe inkl. Zeitstempel wird von A11 protokolliert.

> **Vollintegration dieser drei Komponenten in Teil B (Prozess-Kap. 27) und Teil C (Agenten-Zuordnung, Prozess-Register) folgt als nächster Schritt.**

---

*Q7 ist ein KI-Betriebssystem — ausschließlich Agenten und Maschinen-Logik, gesteuert durch einen menschlichen GF. Das System befindet sich in der aktiven Testphase.*
