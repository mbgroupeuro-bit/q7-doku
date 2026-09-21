---
Dokument: Q7_Rollenmodell_Lizenznehmer
Datum: 2026-07-26
Status: Entwurf — Diskussionsstand, Admin-Freigabe ausstehend
Verwandte Dateien: Q7_Freigabe_Rechte_Aufgaben_2026-07-25.md, L4_Q7_Organisation, L6_Q7_Agentenmodell (Zugriffsrechte RBAC)
Zweck: Werksvorlage für Rollen/Rechte beim Lizenznehmer + Default-Zustand + Freischaltungs-Workflow
---

# 1. Grundprinzip

Q7 liefert 4 Rollen als **Werksvorlage** mit Standard-Rechten.
**Default-Zustand bei Auslieferung: ausschließlich Admin ist aktiv.**
Alle weiteren Mitglieder (Führung, Sachbearbeiter, Azubi/Gast) existieren nur als Rollen-Gerüst — kein Zugriff, bis der Lizenznehmer sie aktiv freischaltet.

Rechte pro Rolle sind danach frei justierbar (Werkseinstellung → Override → Reset jederzeit möglich, analog Q7_Freigabe_Rechte_Aufgaben Abschnitt 2.4).

---

# 1a. Namenskonvention: Mitglied + Abteilung

Jedes Mitglied wird bei der Anlage einer realen Abteilung des Lizenznehmer-Unternehmens zugeordnet (nicht zu verwechseln mit den Q7-internen Agenten-Abteilungen A02–A13). Anzeigeformat:

```text
[Nachname] ([Abteilung])
```

Beispiel: **Müller (Marketing)**, **Schmidt (Vertrieb)**, **Peter (Azubi, Marketing)**

**Zweck:**
- Sofortige Erkennbarkeit in EINSTELLUNGEN, PROTOKOLL und bei Objekt-Einzelrechten (3b), welchem Bereich ein Mitglied real angehört.
- Grundlage für automatische Startzuordnung bei "Lesen (nur eigene Abteilung)"-Einstellungen (siehe INPUT-Beispiel, 3b) — das System kann die Abteilungszugehörigkeit direkt aus dem Namen/der Zuordnung ableiten, statt sie separat pflegen zu müssen.
- Ein Mitglied kann bei Bedarf mehreren Abteilungen zugeordnet sein (z.B. bei abteilungsübergreifender Tätigkeit) — Anzeige dann `Müller (Marketing, Vertrieb)`.

**Verhältnis zur Rolle (3a):** Abteilung und Rolle sind unabhängige Achsen. Abteilung beantwortet "wo arbeitet die Person", Rolle beantwortet "was darf die Person". Beide zusammen ergeben erst die vollständige Zuordnung (z.B. Müller = Rolle Führung + Abteilung Marketing = Abteilungsleiter Marketing).

---

# 2. Rollentabelle (Werkseinstellung)

| Rolle | Standard-Rechte (Werkseinstellung) | Beispiel | Status bei Auslieferung |
|---|---|---|---|
| **1. Admin** | Vollzugriff (lesen/ändern/löschen/anlegen), nicht-delegierbare Letztentscheidung (L1 Grundprinzip 9) | Geschäftsführer, Systeminhaber | **Aktiv (einzige Rolle ab Start)** |
| **2. Führung** | Lesen/Ändern in eigener Abteilung, keine System-/Freigabe-Rechte über Admin-Ebene hinaus | Abteilungsleiter, Marketingleiter | Inaktiv — Gerüst vorhanden |
| **3. Sachbearbeiter** | Lesen/Ändern nur zugewiesene Aufgaben/Bereiche, kein Löschen | Mitarbeiter Marketing, Vertrieb | Inaktiv — Gerüst vorhanden |
| **4. Azubi/Gast** | Nur Lesen, stark eingeschränkt | Azubi, Praktikant, externer Gast | Inaktiv — Gerüst vorhanden |

---

# 3. Freischaltungs-Workflow (Lizenznehmer → Mitglied)

1. **Mitglied anlegen** — Admin trägt Name/Kontakt des neuen Mitglieds ein.
2. **Rolle zuweisen** — Auswahl aus den 4 Werksrollen (oder bereits angepasste eigene Variante).
3. **Rechte prüfen/anpassen** — Werksrechte übernehmen oder individuell abändern (z.B. Azubi mit erweiterten Rechten).
4. **Berechtigung/Zugang erteilen** — Admin vergibt Zugang (Login/Einladung); Mitglied ist ab hier aktiv freigeschaltet.
5. **Protokollierung** — Freischaltung wird im Audit-Log (PROTOKOLL) erfasst, inkl. Admin als verantwortlicher Instanz.

Ohne Schritt 4 bleibt ein angelegtes Mitglied inaktiv — reines Gerüst ohne Zugriff.

---

# 3a. Rechte-Granularität nach Bereich (Werkseinstellung)

Rechte werden nicht pauschal pro Rolle vergeben, sondern pro Sidebar-Bereich (siehe Q7_Sidebar_Struktur). Zeichenlegende: **V** = Voll (lesen/ändern/löschen/anlegen), **Ä** = Ändern (lesen/ändern, kein Löschen), **L** = nur Lesen, **–** = kein Zugriff.

| Bereich | Admin | Führung | Sachbearbeiter | Azubi/Gast |
|---|---|---|---|---|
| **INPUT** | V | Ä (eigene Abteilung) | Ä (zugewiesene Vorgänge) | L |
| **MEINE AUFGABEN** | V | Ä (eigene + Team) | Ä (eigene) | L (eigene) |
| **KALENDER** | V | Ä | L | L |
| **STUDIO** | V | Ä (eigene Abteilung) | Ä (zugewiesene Tools) | – |
| **SPACES** | V | Ä (zugeordnete Spaces) | L/Ä je nach Zuordnung | L (falls zugeordnet) |
| **OUTPUT** | V (inkl. Freigabe) | L (eigene Abteilung), keine Freigabe-Kompetenz | L (eigene Vorgänge) | – |
| **PROTOKOLL** | V (Volleinsicht) | L (eigene Abteilung) | – | – |
| **ABLAGE** | V (einziger Upload-Berechtigter, siehe Freigabe_Rechte_Aufgaben 2.5) | L (freigegebene Dateien) | L (freigegebene Dateien) | L (nur explizit freigegeben) |
| **EINSTELLUNGEN** | V | – | – | – |

**Grundsatz:** Die finale Freigabe-Kompetenz (OUTPUT → Versand an Endkunde) bleibt in jeder Zeile beim Admin, unabhängig von sonstigen Rechten — auch wenn Führung/Sachbearbeiter volle Ändern-Rechte in ihrem Bereich erhalten (siehe L1 Grundprinzip 9, nicht delegierbar außer per aktiver Standing Order).

**Override-Hinweis:** Diese Matrix ist Werkseinstellung. Der Lizenznehmer kann jede Zelle individuell anpassen (z.B. Azubi mit Ä-Recht in STUDIO ausstatten) — mit Ausnahme der Admin-Freigabe-Kompetenz in OUTPUT/EINSTELLUNGEN-Kernbereich (Systemstruktur), die nicht übertragbar ist.

---

# 3b. Objekt-/Prozessbezogene Einzelrechte (ergänzend zur Rollenmatrix)

Die Rollenmatrix (3a) liefert nur die **Werkseinstellung pro Bereich**. Zusätzlich — und das ist die eigentliche Steuerungsebene — trägt **jedes einzelne angelegte Objekt** (Space, Rubrik, Prozess, Wissensdokument) ein eigenes Rechte-Schild mit drei Zuständen:

- **Kein Zugriff** — Objekt bleibt für das Mitglied unsichtbar/nicht vorhanden
- **Lesen** — Einsicht, keine Änderung
- **Ändern** — volle Bearbeitung innerhalb des Objekts

**Mechanismus:** Admin vergibt diese Rechte nicht pauschal über die Rolle, sondern **pro Objekt und pro Mitglied individuell** — verwaltbar zentral in EINSTELLUNGEN. Die Rolle liefert nur den Startwert; jedes Objekt kann davon abweichend eingestellt werden.

**Beispiel INPUT (Kanal-Eingang):**
| Einstellung für Mitglied X | Ergebnis |
|---|---|
| Kein Zugriff | INPUT bleibt komplett leer für X — sieht nicht einmal, dass andere Anfragen existieren |
| Lesen (nur eigene Abteilung) | X sieht nur Eingänge, die seiner Abteilung zugeordnet sind |
| Lesen (komplett) | X sieht alle eingehenden Kundenkontakte, unabhängig von Zuständigkeit |

Grund für diese Granularität: Ein Sachbearbeiter darf z.B. nicht automatisch erfahren, wer alles ein Angebot angefragt hat, wenn das nicht seine Zuständigkeit betrifft.

**Beispiel Prozesse (z.B. Vertriebsprozess):**
Ein einzelner Prozess kann vom Admin als **gesperrt** markiert werden — nur namentlich freigegebene Mitglieder erhalten Lese-/Änderrecht, alle anderen (auch innerhalb derselben Abteilung) sehen ihn nicht. Nützlich für Prozesse mit vertraulichem Inhalt (z.B. Preiskalkulation, Sonderkonditionen).

**Verhältnis zu SPACES (Q7-A-011, teilweise gelöst):** Jeder Space ist in dieser Logik ein Objekt wie jedes andere — trägt Kein Zugriff/Lesen/Ändern pro Mitglied, konfigurierbar unabhängig von der pauschalen Rollenmatrix. Weiterhin offen bleibt nur die technische Durchsetzungstiefe (echte SEC-GATE-Isolation vs. reine UI-Filterung, siehe Abschnitt 6) — das ist an den Multi-User-Auth-Layer gekoppelt (Q7-A-024).

**Verwaltungsort:** Alle Objekt-Einzelrechte sind für den Admin zentral unter **EINSTELLUNGEN** einsehbar und änderbar — pro Mitglied eine vollständige Übersicht, welches Objekt mit welchem Zugriffslevel freigegeben ist.

---

# 3c. Beispiel-Durchlauf: Admin schaltet einen Azubi frei

Konkretes Beispiel entlang des Freischaltungs-Workflows (Abschnitt 3), angewendet auf die Objekt-Einzelrechte (3b):

**Ausgangslage:** Lizenznehmer (Marketingagentur) stellt einen neuen Azubi ein.

| Schritt | Aktion des Admin | Ergebnis |
|---|---|---|
| 1. Mitglied anlegen | Admin trägt "Azubi Peter" in EINSTELLUNGEN ein | Peter existiert als Mitglied, noch ohne Zugriff |
| 2. Rolle zuweisen | Admin wählt Werksrolle "Azubi/Gast" | Peter erbt Standard-Rechte aus 3a (überwiegend L/–) |
| 3. Objekt-Rechte prüfen/anpassen | Admin geht Objekt für Objekt durch: | |
| → INPUT | Admin stellt auf "Kein Zugriff" | Peter sieht nicht, wer Angebote anfragt |
| → STUDIO (nur Marketing-Space) | Admin stellt auf "Ändern" (abweichend von Werkseinstellung "–") | Peter darf im Marketing-Space aktiv Vorlagen bearbeiten, da er dort eingelernt wird |
| → Prozess "Preiskalkulation Vertrieb" | Bleibt auf "Kein Zugriff" (gesperrter Prozess) | Peter sieht diesen Prozess in keiner Liste, auch nicht als ausgegraut |
| → PROTOKOLL | Bleibt Werkseinstellung "–" | Kein Einblick ins Audit-Log |
| 4. Zugang erteilen | Admin schickt Login-Einladung an Peter | Peter kann sich ab jetzt anmelden — sieht nur das, was in Schritt 3 freigegeben wurde |
| 5. Protokollierung | System trägt automatisch ein: "Admin hat Mitglied Peter (Rolle Azubi) am [Datum] freigeschaltet, Abweichungen: STUDIO/Marketing → Ändern" | Nachvollziehbar im PROTOKOLL |

**Kernaussage des Beispiels:** Die Werksrolle "Azubi" liefert nur den Ausgangspunkt (überwiegend L/–). Die tatsächliche Freischaltung entsteht erst durch die Objekt-für-Objekt-Entscheidung des Admin in Schritt 3 — inklusive gezielter Abweichungen nach oben (STUDIO/Marketing) und expliziter Sperrungen (Preiskalkulation-Prozess), unabhängig von der Rollenbezeichnung.

---

# 4. Grenzen

- Rollen 2–4 sind vollständig durch den Lizenznehmer anpassbar (Rechte, Namen, Anzahl).
- **Nicht änderbar:** Admin-Letztentscheidungsbefugnis (L1 Grundprinzip 9 / L2 Grundsatz 8) — keine andere Rolle kann damit ausgestattet werden, unabhängig von Rechte-Anpassung.
- Werkseinstellung ist jederzeit über Reset-Funktion wiederherstellbar (analog Abschnitt 2.4, Q7_Freigabe_Rechte_Aufgaben).

---

# 5. Technischer Stand

Dies ist aktuell **Konzept-/Doku-Ebene** (Struktur für `02_Operative_Sicherheit`).
Technische Durchsetzung (echte Mitarbeiter-Logins, Auth-Layer) bleibt gemäß Roadmap zurückgestellt (siehe Q7-A-024, Q7-A-003) — Freischaltungs-Workflow hier beschreibt das Zielverhalten, nicht den aktuellen Implementierungsstand.

---

# 6. Offene Punkte

- Exakte UI-Verortung des Freischaltungs-Workflows (EINSTELLUNGEN vs. eigener Bereich?)
- Technische Durchsetzungstiefe der Objekt-Einzelrechte: echte SEC-GATE-Isolation (A14 prüft je Zugriff) vs. reine UI-Filterung ohne dahinterliegende Zugriffskontrolle — Entscheidung an Multi-User-Auth-Layer gekoppelt (Q7-A-024)
- Verhältnis zu Q7-A-003 (Multi-User-Aufgabenliste) und Q7-A-011 (SPACES) — Zuordnungsprinzip jetzt konzeptionell geklärt (siehe 3b), technische Umsetzung weiterhin zurückgestellt
- Reihenfolge-Priorität: wird dieser Punkt vorgezogen oder bleibt er hinter dem Auth-Layer zurückgestellt?

---

**Änderungsprotokoll:**
- v0.1 (26.07.2026): Ausgangsfassung — Rollentabelle + Default-Zustand (nur Admin aktiv) + Freischaltungs-Workflow als Gerüst-Vorschlag.
- v0.2 (26.07.2026): Abschnitt 3a "Rechte-Granularität nach Bereich" ergänzt — Matrix Rolle x Sidebar-Bereich (V/Ä/L/–), Admin-Freigabe-Kompetenz als durchgängige Ausnahme markiert.
- v0.3 (26.07.2026): Abschnitt 3b "Objekt-/Prozessbezogene Einzelrechte" ergänzt — granulares Rechte-Schild (Kein Zugriff/Lesen/Ändern) pro Objekt (Space, Rubrik, Prozess) und pro Mitglied, unabhängig von Rollenmatrix, zentral verwaltbar in EINSTELLUNGEN. Löst Q7-A-011 (SPACES-Zuordnungsprinzip) konzeptionell, technische Durchsetzungstiefe bleibt offen.
- v0.4 (26.07.2026): Abschnitt 3c "Beispiel-Durchlauf: Admin schaltet einen Azubi frei" ergänzt — konkretes Schritt-für-Schritt-Beispiel entlang Freischaltungs-Workflow + Objekt-Einzelrechte, inkl. gezielter Abweichung von Werksrolle nach oben (STUDIO) und expliziter Prozess-Sperrung (Preiskalkulation).
- v0.5 (26.07.2026): Abschnitt 1a "Namenskonvention: Mitglied + Abteilung" ergänzt — Anzeigeformat `[Nachname] ([Abteilung])`, z.B. Müller (Marketing). Abteilung als eigene Achse neben Rolle, Grundlage für automatische Abteilungs-Zuordnung bei Objekt-Einzelrechten (3b).
