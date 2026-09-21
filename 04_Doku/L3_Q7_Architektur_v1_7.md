# Q7 – Architektur

**Version:** 1.7
**Status:** Verbindlich

---

# Zweck

Die Architektur definiert den strukturellen Aufbau von Q7.
Sie beschreibt die Hauptkomponenten des Systems sowie deren Beziehungen, ohne technische Implementierungsdetails vorzugeben.

---

# Architekturprinzipien

## 1. Modularität

Q7 besteht aus unabhängigen Modulen.
Jedes Modul besitzt einen klar definierten Verantwortungsbereich.

---

## 2. Trennung von Verantwortung

Organisation, Prozesse, Agenten, Wissen und Technik sind voneinander getrennt.
Jede Ebene besitzt eine eigene Aufgabe.
UI ist keine eigenständige Verantwortungsebene, sondern Adapter (siehe Randschicht).

---

## 3. Black-Box-Prinzip

Die interne Systemarchitektur ist für den Lizenznehmer nicht sichtbar.

---

## 4. Zentrale Wissensbasis

Fachwissen wird zentral verwaltet.
Agenten greifen auf dieselbe Wissensbasis zu.

---

## 5. Wiederverwendbarkeit

Komponenten werden einmal entwickelt und mehrfach genutzt.

---

## 6. Erweiterbarkeit

Neue Module können ergänzt werden, ohne bestehende Module grundlegend zu verändern.

---

## 7. Trennung von Dokumentations-/Daten-ROOT und Code-ROOT

Q7 besteht aus zwei unabhängigen, physisch getrennten Ablageorten (siehe Q7_Ablagestruktur_v0_6.md):
Eine Dokumentations-/Daten-ROOT (L1–L8, Vertiefungsdokumente, operative Ablage, Wissensbasis, Agentenstruktur) und eine Code-ROOT (Frontend/Backend-Anwendung).
Die Code-ROOT greift lesend/schreibend auf die Dokumentations-ROOT zu, ersetzt sie aber nicht und dupliziert ihre Inhalte nicht.

---

# Hauptkomponenten

## Kernkomponenten

- Organisation
- Prozesse
- Agenten
- Wissensmodell
- Technik

## Randschicht (Adapter)

- Benutzeroberfläche (UI) — reine Schnittstelle nach außen, keine Geschäftslogik (siehe Q7-M-009, L8 Abschnitt „Frontend")
- Vertiefung (konkrete UI-Spezifikation, Lizenznehmer-UI/Admin-Trennung, Zustandsanzeige): `04_Doku/Infrastruktur/Q7_UI_Spezifikation_v1.md`

Jede Komponente wird im entsprechenden L-Dokument beschrieben.

---

# Dokumentzuordnung

| Dokument | Verantwortlich für |
|----------|--------------------|
| L4 | Organisation |
| L5 | Prozesse |
| L6 | Agenten |
| L7 | Wissen |
| L8 | Technik |

---

# Ablagestruktur (Referenz)

Die physische Ablage von Q7 ist von der Architektur getrennt (siehe Q7-M-003) und folgt keiner Architektur-Bedeutung, sondern rein organisatorischer Ordnung.
Die verbindliche ROOT-Struktur (beide ROOTs, siehe Architekturprinzip 7) wird gepflegt in:
→ `04_Doku/Q7_Ablagestruktur_v0_6.md`

---

# Architekturregeln

- Keine doppelte Verantwortlichkeit.
- Keine fachlichen Inhalte in der Technik.
- Keine Technik in der Organisation.
- Keine Prozesse in der Verfassung.
- Wissen wird ausschließlich im Wissensmodell verwaltet.
- Die Ablagestruktur ist keine Architekturebene (siehe Abschnitt "Ablagestruktur").
- Dokumentations-/Daten-ROOT und Code-ROOT sind physisch getrennt zu halten (siehe Architekturprinzip 7).

---

# Akzeptanzkriterien

- Jede Architekturkomponente ist eindeutig einem L-Dokument zugeordnet (keine Doppelzuordnung, siehe Dokumentzuordnung).
- UI ist in keinem Kontext als gleichrangige Kernkomponente dokumentiert, sondern durchgängig als Randschicht/Adapter geführt.
- Die Ablagestruktur-Referenz verweist auf ein existierendes, real geprüftes Dokument (Q7_Ablagestruktur_v0_6.md).
- Kein Architekturprinzip widerspricht einem Grundprinzip aus L1.
- Neue Module lassen sich ergänzen, ohne dass ein bestehendes Modul in seiner Kernaufgabe verändert werden muss.
- Kein Pfadverweis in verbindlichen Q7-Dokumenten zeigt auf einen nicht real existierenden Ordner (geprüft gegen Bestandsaufnahme vom 26.07.2026).

---

# Geltungsbereich

Die Architektur ist für sämtliche Komponenten von Q7 verbindlich.

---

# Änderungsregel

Architekturänderungen müssen auf Auswirkungen für alle nachgelagerten Ebenen geprüft werden.
Betroffene Dokumente sind entsprechend anzupassen.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (Ausgangsfassung)
- v1.1 (08.07.2026): Q7-M-003 umgesetzt — Ablagestruktur als reine Referenz ausgelagert. Q7-M-009 umgesetzt — UI als Randschicht/Adapter. Prinzip 2 um Agenten ergänzt. GF-Freigabe in Änderungsregel ergänzt.
- v1.2 (08.07.2026): Abschnitt "Akzeptanzkriterien" ergänzt (Q7-M-073).
- v1.3 (09.07.2026): Anschlusspunkt-Ergänzung. Ablagestruktur-Referenzpfad korrigiert (Annahme: innerhalb q7-app). Verweis auf Q7_UI_Spezifikation_v1.md ergänzt. **Hinweis: Pfadkorrektur in v1.3 war fehlerhaft, siehe v1.4.**
- v1.4 (10.07.2026): Korrektur nach realer Bestandsaufnahme (10.07.2026). Neues Architekturprinzip 7 "Trennung von Dokumentations-/Daten-ROOT und Code-ROOT" ergänzt — vorherige Annahme, beide ROOTs seien identisch (q7-app), war falsch. Ablagestruktur-Referenzpfad korrigiert auf `04_Doku/Q7_Ablagestruktur_v0.4.md` (reale Schreibweise "04_Doku", nicht "04_Doku"). Akzeptanzkriterium zur Pfad-Realitätsprüfung ergänzt.
- v1.5 (26.07.2026): Terminologie "GF" → "Admin" in Änderungsregel (Q7-L3-001). Widersprüchlichen Schreibweise-Hinweis ("04_Doku ... nicht 04_Doku") entfernt, obsolet (Q7-L3-002). **Offen (Q7-L3-003): Root-Struktur und Ablagestruktur-Referenzpfad im Dokument entsprechen nicht dem Stand nach Cleanup 25.07.2026 (`D:\Projekt2027\Q7_Entwicklung\`, `a_Q7-code`/`b_Q7-doku`/`c_Q7_datenbank`) — Korrektur noch ausstehend, Admin-Antwort erforderlich.**
- v1.6 (26.07.2026): Q7-L3-003 gelöst — Ablagestruktur-Referenzpfad korrigiert auf `04_Doku/Q7_Ablagestruktur_v0_6.md` (Neufassung nach Root-Umzug, reale Bestandsaufnahme 26.07.2026). Akzeptanzkriterium zur Pfad-Realitätsprüfung auf Bestandsaufnahmedatum 26.07.2026 aktualisiert.
- v1.7 (19.09.2026): Verweis in Abschnitt "Randschicht (Adapter)" korrigiert von "L8 Frontend-Prinzip" (nicht-existente Überschrift) auf "L8 Abschnitt „Frontend"" (Q7-L3-004). "Kunden-UI" → "Lizenznehmer-UI" in Vertiefungsverweis (Q7-L3-005).
