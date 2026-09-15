
---

### DATEI 2: Detail-Regelwerk (Ergänzt um die Sub-Agenten)
*(Speichere dies als `Q7_2_DETAIL_REGELWERK_v23.md`)*

```markdown
# Q7 — DETAIL-REGELWERK & PROZESSE (v23.0)
**Zugehörig zu:** Q7_1_UEBERSICHT_v23.md

Dieses Dokument enthält die detaillierten Mechanismen, Prozessdefinitionen, Sub-Agenten und Regeln.

---

## 1. SUB-AGENTEN ZUORDNUNG

Jede Abteilung (aus Datei 3) hat einen Ordner `05_SubAgenten/`. Darin liegen die individuellen Sub-Agenten mit ihrer 4-Säulen-Struktur.

| Abteilung | Sub-Agenten-Kürzel | Rollen / Funktion |
|-----------|--------------------|-------------------|
| **A01 (Hermes)** | H-00 | Hermes (Abteilungsleiter, Workflows) |
| | H-01 | Auftragsannahme & Quarantäne-Prüfung |
| | H-02 | Arbeitsvorbereitung |
| | H-03 | Projektmanagement & Überwachung |
| | H-04 | Qualitätskontrolle (Output-Prüfung) |
| | H-05 | Koordination & BackOffice (IT/OT-IDs) |
| **A02 (Marketing)** | 02M-01 bis 02M-17 | Spezifische Marketing-Agenten (z.B. 02M-04 Social Media, Digital Audit Executives) |
| **A03 (Vertrieb)** | 03V-01 bis 03V-06 | Vertriebs-Sub-Agenten |
| **A08 (Finanzen)** | 08F-02 | DRI-Gatekeeper (Exklusiver Tresor-Zugriff) |
| **A11 (Systemctrl)** | 11SC-00 | Assistent (Koordination) |
| | 11SC-01 | Monitoring (Echtzeit & Alarme) |
| | 11SC-02 | Audit & Compliance |
| | 11SC-03 | Failover-Management (Backups) |
| | 11SC-04 | Sicherheitsaudit (Hash-Validierung) |
| **A13 (Personal)** | 13P-00 | Personal-Agent (Lebenszyklus, 4-Säulen-Erstellung) |
| **A14 (Sicherheit)**| 14S-01 | PII-Scanner & Gate-Keeper *(NEU, definition folgt in P_016)* |

*(Andere Abteilungen erhalten spezifische Sub-Agenten-Kürzel bei Bedarf durch A13_Personal)*

---

## 2. DER A14-GATE-MECHANISMUS (TECHNISCHE IMPLEMENTIERUNG)
*   **Blockade:** Hermes prüft vor jedem Zugriff auf `01_INPUT/02_Eingang` das Audit-Protokoll.
*   **Trigger:** Das System sucht nach dem Eintrag `AUD_[Datum]_[Datei-ID]_14S_FREIGABE`.
*   **Logik:** Eintrag vorhanden → Hermes erhält Zugriff. Eintrag fehlt → Hermes-Zugriff wird blockiert.
*   **Fallback:** `11SC-02` überwacht die Wartezeit. > 30 Min ohne A14-Freigabe = GUI-Alarm an GF.

---

## 3. DAS PROZESS-REGISTER (P_016 KUNDEN-ANALYSE)

| Prozess-ID | Beschreibung | Verantwortung | Bedingungen/Notes |
|-----------|-------------|--------------|-------------------|
| **P_016** | **Kunden-Analyse & Transformation** | **GF + Hermes + Fachabt.** | |
| P_016.1 | Kunden-Stammdaten-Aufnahme | GF + A14 + Hermes + 08F | A14 trennt PII vor Hermes. |
| P_016.1b | DNA-Neukunden-Gate-Checkliste | Hermes + GF | |
| P_016.2 | Mystery-Shopping (Physisch) | GF + Tester + Hermes | **BEDINGT:** Nur wenn Kunde physische Shops hat! Sonst entfällt DNA-Strang 1. |
| P_016.3 | Digital-Audit (6 Bereiche) | A02_Marketing + A12 | TikTok (P_016.3.5) ist optional. |
| P_016.4 | SWOT-Analyse | A02 + A05_QM | |
| P_016.5 | Branchen-Benchmarks | A12 + A08_Finanzen | |
| P_016.6 | Gap-Analyse-IST-Zustand | Hermes + A05_QM | Trigger für P_017.1 (DNA Rohdaten). |
| P_016.7 | Kundengespräch-Wunschermittlung | GF + Hermes | |
| P_016.8 | Bedarfsanalyse-Intern | Hermes + A02 + A07 + A08 | |
| P_016.8a | SCOPE-Festlegung (A/B/C) | GF (Gate) + Hermes | A = 12 Monate, B = 9 Monate, C = 6 Monate. |
| P_016.9 | SOLL-Zustand-Roadmap | Hermes + Alle | Länge hängt von Scope ab. |
| P_016.10 | Präsentation-PDF | A02 + A09 | Folien: A=21, B=18, C=12. |
| P_016.11 | Freigabe & Umsetzungsstart | GF + Hermes | Max. 2 Anpassungsrunden, dann GF-Eskalation. |

---

## 4. DNA-ANALYSE-FRAMEWORK (KAP. 27A)

### Max-Scores (Fix)
*   Strang 1 (Mystery Shopping): **530** *(Fällt weg bei Vertrieb/Hersteller → Max 755)*
*   Strang 2 (Digital Audit): 400
*   Strang 3 (SWOT): 150
*   Strang 4 (Benchmarks): 100
*   Strang 5 (Gap-Analyse): 105
*   **GESAMT MAX: 1.285** 

### Ursachen-Kategorien (K1–K6)
Jeder Befundpunkt wird einer Ursache zugeordnet, daraus wird die Matrix1 priorisiert:
*   **K1:** Fehlende Markenidentität
*   **K2:** Keine digitale Präsenz
*   **K3:** Inkonsistente Kommunikation
*   **K4:** Fehlende Prozesse / Standards
*   **K5:** Ressourcen / Budget
*   **K6:** Bewusstsein / Wissen fehlt

---

## 5. DIE 4 SÄULEN PRO AGENT (DETAILS)
Jeder Agent unter `02_KI-UNTERNEHMEN/[Abteilung]/05_SubAgenten/[Kürzel]/` besitzt exakt 4 Pflichtdateien:
1. `README.md`: Arbeitsweise, Tagesablauf, Notfälle.
2. `identitaet.md`: Mission, Werte, Kommunikationston.
3. `stellenbeschreibung.md`: Aufgaben, Zuständigkeiten, Erfolgskriterien.
4. `regeln.md`: RBAC, Guardrails, No-Gos, Alarm-Punkte.

---

## 6. Q7-KULTUR & BUG-TRACKING

### 6.1 Die 8 Werte (Auszug)
*   V1 Transparenz über Effizienz (Lieber fragen als raten).
*   V5 Qualität ist nicht verhandelbar (Sicherheit hat Priorität).
*   V7 Respekt vor Grenzen (RBAC als Kultur, nicht nur Technik).

### 6.2 Bug-Lifecycle
*   Format: `BUG_YYYYMMDD_NNN_[Priorität]_[Agent]`
*   3 CRITICAL Bugs gleichzeitig → System-Stopp (Hermes pausiert).
*   CRITICAL Bug > 30 Min offen → Push-Alarm an GF.

### 6.3 Change-Management (HART vs. FLEXIBEL)
*   **HART (unverrückbar):** 7-Ordner-Architektur, GF-Entscheidungsmacht, Quarantäne-3-Filter, A14-Gate-Mechanismus.
*   **FLEXIBEL (anpassbar):** Abteilungsstruktur, KPIs, Kultur-Werte, Scope-Details.