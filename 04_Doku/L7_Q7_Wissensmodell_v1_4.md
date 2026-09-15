# Q7 – Wissensmodell

**Version:** 1.4
**Status:** Verbindlich

---

# Zweck

Das Wissensmodell definiert die Struktur, Verwaltung und Nutzung sämtlichen Wissens innerhalb von Q7.
Es stellt sicher, dass Wissen zentral gepflegt, wiederverwendet und allen berechtigten Organisationseinheiten einheitlich zur Verfügung gestellt wird.

---

# Grundprinzipien

## 1. Zentrale Wissensbasis

Wissen wird ausschließlich zentral verwaltet.
Es existiert nur eine gültige Quelle je Wissensobjekt.

---

## 2. Trennung von Wissen und Agenten

Agenten besitzen kein dauerhaftes Fachwissen.
Sie greifen ausschließlich auf die zentrale Wissensbasis zu.

---

## 3. Wiederverwendbarkeit

Ein Wissensobjekt kann von beliebig vielen Agenten, Prozessen und Abteilungen genutzt werden.

---

## 4. Konsistenz

Doppelte Inhalte sind nicht zulässig.
Änderungen erfolgen ausschließlich am Original.

---

## 5. Versionierung

Jedes Wissensobjekt besitzt eine Version.
Änderungen sind nachvollziehbar zu dokumentieren.

---

# Wissensarten

Die Wissensbasis kann unter anderem enthalten:

- Frameworks
- Expertenwissen
- Methoden
- Checklisten
- Vorlagen
- SOPs
- Standards
- Gesetze
- Normen
- Unternehmenswissen
- Best Practices
- Erfahrungswissen

---

# Wissensstruktur

Die Wissensbasis besitzt keine feste Ordner- oder Kategorie-Baumstruktur.
Wissensobjekte werden flach abgelegt; Einordnung erfolgt ausschließlich über das Metadatenfeld `Kategorie` je Objekt (siehe Wissensobjekte), nicht über eine physische Struktur.

Begründung: Feste Kategorien erzeugen Grenzfälle (ein Objekt kann mehreren Wissensarten zugleich zuzuordnen sein) und widersprechen dem metadatengetriebenen Retrieval-Modell (siehe Q7-M-042, Hybrid Retrieval mit Metadaten, Volltext, Vektorindex).

**Implementierungshinweis:** Das Metadatenfeld `Kategorie` muss frei/flexibel befüllbar und vom Admin umbenennbar/erweiterbar sein — analog zur bereits flexiblen Upload-Kategorie-Logik (`wissenKategorien` im Store). Aktuell (Stand 26.07.2026) ist `Kategorie` im Code (`types.ts`, `WissenEintrag`) noch als feste Werteliste implementiert — das widerspricht diesem Grundsatz und ist als offener technischer Punkt zu schließen (siehe Aufgabenliste).

---

# Nutzung

Die Wissensbasis wird verwendet von:

- Abteilungen
- Agenten
- Prozessen
- Qualitätsmanagement
- Management

---

# Wissensobjekte

Jedes Wissensobjekt besitzt mindestens:

- ID
- Titel
- Beschreibung
- Kategorie
- Version
- Status
- Autor
- Änderungsverlauf

Artefaktscharfe Vertiefung (Unterscheidung Knowledge/Memory/Experience/Policy als eigene Artefaktklassen, Verbindlichkeitsstufen, Version Registry, Execution Evidence Record, Konfliktregelung bei widersprüchlichem Wissen): `04_Doku/Infrastruktur/Q7_Wissens_Artefaktmodell_v1.md`

---

# Lebenszyklus

Jedes Wissensobjekt durchläuft folgenden Lebenszyklus:

```text
Erstellung
↓
Prüfung
↓
Freigabe
↓
Nutzung
↓
Aktualisierung
↓
Archivierung
```

Prüfung kann durch die fachlich zuständige Abteilung vorbereitet werden.
Die finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

# Qualität

Jedes Wissensobjekt muss:

- vollständig
- korrekt
- aktuell
- nachvollziehbar
- überprüfbar

sein.

---

# Erfahrungen

Erfahrungen entstehen aus der praktischen Anwendung.
Sie ergänzen bestehendes Wissen.
Erfahrungen ersetzen keine Standards oder Frameworks.

---

# Zugriffsprinzip

Der Zugriff erfolgt ausschließlich nach Berechtigung.
Nicht jede Organisationseinheit besitzt Zugriff auf sämtliche Wissensbereiche.
Die zugrunde liegende Berechtigungslogik (RBAC) ist in L6 Agentenmodell, Abschnitt „Zugriffsrechte (RBAC)" definiert.
Feingranulare, attributbasierte Zugriffsregeln (ABAC) für Retrieval: siehe Q7_Policy_Engine_v1.md, Enforcement Point „Zugriff auf zentrale Wissensbasis".

---

# Akzeptanzkriterien

- Kein Wissensobjekt existiert in mehr als einer inhaltlich identischen Fassung (Duplikatsprüfung vor Freigabe).
- Jedes Wissensobjekt trägt vollständig ausgefüllte Pflichtfelder (ID, Titel, Beschreibung, Kategorie, Version, Status, Autor, Änderungsverlauf).
- Jede Freigabe eines Wissensobjekts ist im Änderungsverlauf eindeutig dem Admin zugeordnet.
- Kein Wissensobjekt ist über eine physische Ordnerstruktur kategorisiert — Kategorisierung erfolgt ausschließlich über das Metadatenfeld.
- Zugriff auf ein Wissensobjekt entspricht in jedem geprüften Fall der RBAC-Definition aus L6.

---

# Erweiterbarkeit

Neue Wissensarten dürfen ergänzt werden, sofern sie:

- eindeutig definiert sind,
- keine bestehenden Wissensarten überschneiden,
- dem Wissensmodell entsprechen.

---

# Geltungsbereich

Dieses Dokument definiert ausschließlich die Verwaltung und Nutzung des Wissens.
Organisation wird in L4 beschrieben.
Prozesse werden in L5 beschrieben.
Agenten werden in L6 beschrieben.
Technik wird in L8 beschrieben.

---

# Änderungsregel

Änderungen an der Wissensstruktur müssen auf Auswirkungen für Agenten, Prozesse und Organisation geprüft werden.
Neue Wissensobjekte dürfen bestehende Inhalte nicht duplizieren.
Finale Freigabe liegt beim Admin (siehe L1 Grundprinzip 9, L2 Grundsatz 8).

---

**Status:** Aktiv
**Änderungsprotokoll:**
- v1.0 (Ausgangsfassung)
- v1.1 (08.07.2026): Wissensstruktur von fester Kategorie-Baumstruktur auf Flachstruktur umgestellt (GF-Entscheidung) — konsistent mit Altsystem-Regel v23.4 und Q7-M-042. Lebenszyklus um GF-Freigabeinstanz präzisiert. Zugriffsprinzip verweist auf L6 RBAC-Abschnitt. GF-Freigabe in Änderungsregel ergänzt.
- v1.2 (08.07.2026): Abschnitt "Akzeptanzkriterien" ergänzt (Q7-M-073).
- v1.3 (09.07.2026): Anschlusspunkt-Ergänzung. Verweis auf Q7_Wissens_Artefaktmodell_v1.md unter „Wissensobjekte" ergänzt (artefaktscharfe Vertiefung). Verweis auf Q7_Policy_Engine_v1.md unter „Zugriffsprinzip" ergänzt (ABAC-Retrieval-Regeln).
- v1.4 (26.07.2026): Terminologie "GF" → "Admin" durchgängig (Q7-L7-001). Implementierungshinweis unter "Wissensstruktur" ergänzt: `Kategorie`-Feld muss frei/flexibel sein, aktueller Code-Stand (feste Werteliste in `types.ts`) widerspricht dem Grundsatz und ist als offener Punkt zu schließen (Q7-L7-002).
