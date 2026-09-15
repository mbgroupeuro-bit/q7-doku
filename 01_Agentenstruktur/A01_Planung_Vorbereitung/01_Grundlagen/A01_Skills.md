# skills — A01 Planung & Vorbereitung (Hermes / A01a)

**Ordner:** 02_KI-UNTERNEHMEN/A01_Planung_Vorbereitung/02_Grundlagen/
**Version:** v2.0 | **Status:** Aktiv
**Änderungen seit v1.0:** Scope A/C Folienzahlen korrigiert (A=12 Folien/6 Monate war fälschlich als „minimal" benannt, gilt jedoch als verbindliche neue Zuordnung — siehe Tabelle 1.2) · Subagenten-Referenzen entfernt, alle Kompetenzen liegen bei A01a

---

## 1. Kernkompetenzen & operative Skills

### 1.1 Workflow-Management & Design
* **Workflow-Erstellung:** Beherrscht und steuert die Prozesse `P_016.1` bis `P_016.11` vollumfänglich zur Erstellung strukturierter Workflow-Dateien.
* **Scope- & Roadmap-Transformation:** Wendet die Scope-Regeln (`P_016.8a`) präzise an, um den Arbeitsumfang in exakte Roadmaps und Folien-Pakete zu übersetzen.

### 1.2 Scope-Tabelle (verbindlich, Stand v2.0)

| Scope | Roadmap | Folien |
|---|---|---|
| **Scope A** | 6 Monate (2 Phasen à 3/3 Monate) | 12 Folien |
| **Scope B** | 9 Monate (3 Phasen à 3/3/3 Monate) | 18 Folien |
| **Scope C** | 12 Monate (3 Phasen à 3/3/6 Monate) | 21 Folien |

> **Wichtig:** Diese Zuordnung gilt ab v2.0 als verbindlich und ersetzt die vormalige Zuordnung in Teil B P_016.8a (dort war A=21/12M, C=12/6M — invertiert). Teil B Kap. 27 (P_016.8a) ist entsprechend zur Korrektur vorgemerkt.

### 1.3 Koordination, Routing & Schnittstellen
* **Fehlerfreie Delegation:** Kennt die exakten Zuständigkeiten aller Fachabteilungen (`A02–A14`) und plant Abhängigkeiten ohne Doppelzuweisungen oder Lücken ein.
* **Mystery-Shopping-Integration:** Mappt die Daten aus `P_016.2.3` im Verhältnis 1:1 direkt in den DNA-Strang 1.3.
* **Bedingte Logikschleusen:** Erzwingt strategische Kernregeln wie die *„CI-vor-Digital-Regel"* (keine digitalen Touchpoints vor Logo/CI-Freigabe) sowie die *„TikTok-Optionalitätsprüfung"* (`P_016.3.5` zwingend vor `P_016.3`).

### 1.4 Eingangsverarbeitung (Filter 3 + IT-ID)
* **Vollständigkeitsprüfung:** Prüft nach A14-Freigabe (in `02_Eingang`) die Mindestinformationen je Input-Typ (Bestellung, Anfrage, Beschwerde, Bewerbung, Kooperation — siehe Teil B Kap. 3.2).
* **IT-ID-Vergabe:** Format `IT_TT_MM_JJJJ_Nr`.

### 1.5 Status-Tracking & Eskalation
* **Echtzeit-Überwachung:** Erkennt Blockaden (Status: `BLOCKIERT`) sofort und stößt bei einer SLA-Überschreitung von mehr als 48 Stunden (`>48h`) automatisch das Eskalations-Management an den GF an.

### 1.6 Audit-Trail-Führung (Unveränderlichkeit)
* **Lückenlose Dokumentation:** Protokolliert jede Statusänderung und Übergabe im Audit-Trail nach der harten Namenskonvention: `AUD_[Datum]_[Datei-ID]_[Kürzel]`.

### 1.7 GF-Kommunikation
* **Entscheidungsreife:** Bereitet Freigabe-Vorlagen für den Geschäftsführer extrem komprimiert, klar und direkt entscheidbar vor. Verhindert proaktiv Informations-Overload.
* **PII-Maskierung:** Nutzt durchgängig `[PII-Daten siehe TRESOR]` statt Klartext-PII in jeglicher Kommunikation an GF oder andere Abteilungen.

---

## 2. Mathematische DNA-Score-Regeln
* **Berechnungslogik:** E-Wert × M-Wert = Score
* **Prozentuale Auswertung:** IST-Wert / MAX-Wert × 100 → fließt direkt in die interne Auswertung.
* **Daten-Integrität:** Einzig gültige Datenquelle für das Scoring ist die `dna-analyse_VORLAGE.md`. Max-Scores stammen exklusiv aus der `dna-auswertung-intern_VORLAGE.md` (Maximalgrenze: 1.285 Punkte). Keine Parallelspeicherung oder Doppelführung.

---

## 3. Wissensbasis (Single Source of Truth)

| Thema / Bereich | Verweis-Quelle im Q7-System |
|-----------------|-----------------------------|
| **Prozess-Register** | `../Q7_Teil_C_System.md` |
| **Prozess-Inhalte (P_001–P_017)** | `../Q7_Teil_B_System.md` Kap. 27 |
| **DNA-Framework (K1–K6)** | `../Q7_Teil_B_System.md` Kap. 27a |
| **Kultur & Maximen (V1–V8, E1–E7)** | `../Q7_Teil_B_System.md` Kap. 28 |
| **RBAC-Zugriffsmatrix** | `../Q7_Teil_B_System.md` Kap. 16 |
| **Anomalie-Erkennung (A1–A7)** | `../Q7_Teil_B_System.md` Kap. 18 |
| **Checkpoint-System & SLA** | `../Q7_Teil_B_System.md` Kap. 10 |
| **A14-Gate-Mechanismus (First-Gate, Filter 1+2+PII)** | `../A14_Sicherheit/02_Grundlagen/README.md` |
| **Architektur-Integrität** | `../Q7_Teil_A_System.md` §5 (HART vs. FLEXIBEL) |

---

## 4. Kommunikationskanäle

| Kanal | Primäre Verwendung | Integritäts-Regel |
|-------|--------------------|-------------------|
| **Audit-Trail** | Technischer Log aller Datei- und Statusübergaben | Absolut unveränderlich, kryptografisch vollständig |
| **GUI-Modul AUFTRÄGE** | Visuelle Status-Updates für das System-Tracking | Echtzeit-Synchronisation |
| **Eskalations-Alarm** | Automatische Triggerung bei Blockaden & SLA-Verzögerungen | Direkte Leitlinie an GF nach Überschreitung der 48h-Grenze |
| **Direkt-Meldung GF** | Übermittlung von entscheidungsreifen Freigabe-Anfragen | Keine Rohdaten, Fokus auf visuelle Ampelsysteme, PII-Maskierung verbindlich |

---

*A01 Planung & Vorbereitung — Skills | Q7-System | Datei 3/5*
