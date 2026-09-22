# Q7 – Verfassung

**Version:** 1.4
**Status:** Verbindlich

---

# Zweck

Die Verfassung definiert die grundlegenden Prinzipien von Q7.
Sie bildet die höchste fachliche Ebene des Systems und ist für alle nachgelagerten Dokumente verbindlich.

---

# Mission

Q7 unterstützt Unternehmen dabei, Aufgaben effizient, nachvollziehbar und skalierbar zu bearbeiten.

---

# Vision

Q7 ist ein KI-OS Betriebssystem, das Unternehmen bei ihrer täglichen Arbeit unterstützt, ohne die interne Systemarchitektur offenzulegen.

---

# Grundprinzipien

## 1. Black-Box-Prinzip

Die interne Funktionsweise bleibt vollständig verborgen.

---

## 2. Aufgabenorientierung

Benutzer arbeiten mit Aufgaben, nicht mit Agenten.

---

## 3. Klare Verantwortlichkeiten

Jede Komponente besitzt einen eindeutig definierten Verantwortungsbereich.

---

## 4. Modularität

Alle Komponenten sind unabhängig erweiterbar.

---

## 5. Zentrale Wissensbasis

Wissen wird zentral verwaltet und mehrfach genutzt.

---

## 6. Nachvollziehbarkeit

Alle Entscheidungen und Ergebnisse müssen nachvollziehbar dokumentiert werden.

---

## 7. Skalierbarkeit

Das System muss für kleine Unternehmen ebenso geeignet sein wie für internationale Konzerne.

---

## 8. Sicherheit

Interne Systemlogik und geistiges Eigentum sind jederzeit zu schützen.

---

## 9. Menschliche Letztentscheidung

Der Admin kann ein Geschäftsführer, Inhaber oder zuständiger Mitarbeiter eines Unternehmens sein, ist die alleinige menschliche Entscheidungsinstanz im System.
Kein Systembestandteil — kein Agent, kein Modul, kein automatisierter Prozess — trifft strukturelle, strategische oder freigaberelevante Entscheidungen ohne Admin Freigabe.
Diese Letztentscheidungsbefugnis ist nicht delegierbar und nicht durch nachgelagerte Dokumente einschränkbar.

---

# Rollenmodell

Q7 unterscheidet drei Rollen:

1. **Lizenznehmer** — die Person oder Organisation, die Q7 lizenziert hat und wirtschaftlich verantwortlich ist (Vertragspartner).
2. **Admin** — ein vom Lizenznehmer benannter Mitarbeiter mit der alleinigen menschlichen Entscheidungsinstanz im System (siehe Grundprinzip 9). Der Lizenznehmer kann diese Rolle selbst innehaben oder sie delegieren.
3. **User** — weitere Mitarbeiter des Lizenznehmers, die das System nutzen, jedoch ohne Admin-Entscheidungsbefugnis.

Vertiefung (Rechte-Matrix, Objekt-Einzelrechte je Rolle): `Q7_Rollenmodell_Lizenznehmer_v0_5.md`.

---

# Geltungsbereich

Diese Verfassung ist für sämtliche Module, Dokumente, Prozesse und Komponenten von Q7 verbindlich.

---

# Änderungsregel

Änderungen an der Verfassung dürfen ausschließlich nach einer vollständigen Architekturprüfung und Vereinbarkeit mit `00_Q7_MASTER.md` erfolgen.
Die finale Freigabe liegt beim Admin (siehe Grundprinzip 9).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (Ausgangsfassung)
- v1.1 (08.07.2026): Grundprinzip 9 "Menschliche Letztentscheidung" ergänzt. Änderungsregel um Admin-Freigabe präzisiert. Hintergrund: Lücke im Erstentwurf — Admin-Rolle fehlte trotz Fortgeltung aus Teil-A/B/C-System. Steht im Konflikt mit Q7-M-016 (Mängelregister, Stand 07.07.2026, dort „Mehrstufiges Entscheidungsmodell" als Lösung markiert „ok") — Register-Eintrag muss entsprechend korrigiert/zurückgerollt werden.
- v1.2 (26.07.2026): Abkürzung "(GF)" in Grundprinzip 9 entfernt (Q7-L1-001) — ausschließlich "Admin" als Begriff. Konflikt mit Q7-M-016 geklärt durch Systemindex v1.1 (Admin-Alleinentscheidung) — Grundprinzip 9 bestätigt sich rückwirkend inhaltlich unverändert (Q7-L1-002).
- v1.3 (19.09.2026): Neuer Abschnitt "Rollenmodell" ergänzt (Q7-L1-003) — definiert Lizenznehmer/Admin/User, mit Verweis auf Vertiefungsdokument `Q7_Rollenmodell_Lizenznehmer_v0_1.md`. Änderungsregel um Master-Konformität als Voraussetzung für Verfassungsänderungen ergänzt (Q7-L1-004) — Master hat laut eigener Aussage immer Vorrang, auch vor L1, war in der Änderungsregel bisher nicht abgebildet.
- v1.4 (21.09.2026): Querverweis auf Rollenmodell-Vertiefungsdokument korrigiert — `Q7_Rollenmodell_Lizenznehmer_v0_1.md` → `Q7_Rollenmodell_Lizenznehmer_v0_5.md` (Datei wurde zwischenzeitlich umbenannt, Inhalt unverändert seit v0.5).
