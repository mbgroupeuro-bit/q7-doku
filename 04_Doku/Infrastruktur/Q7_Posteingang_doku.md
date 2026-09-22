---
titel: Q7 Posteingang — Feature-Dokumentation
version: 1.0
datum: 2026-08-07
bezug: Q7_Dashboard_Posteingang_Konzept.docx (Abschnitt 5), Q7_Aufgabenliste (Abschnitte L, M)
---

# Q7 Posteingang

## 1. Zweck

Zentrale UI für eingehende Kommunikation über alle Kanäle (Team, Mail, WhatsApp, Telegram, Facebook). Ersetzt die frühere reine Tabellenansicht durch Kanal-Tabs + Split-Layout (Liste links, Detail-/Antwortpanel rechts), laut Mockup in `Q7_Dashboard_Posteingang_Konzept.docx` Abschnitt 5.

## 2. Datenmodell

Nutzt bestehende Prisma-Models, keine neuen Tabellen nötig:

```prisma
model Aufgabe {
  id            String   @id
  kanal         String   // "email" | "whatsapp" | "telegram" | "facebook" | "team"
  absender      String
  zeitstempel   DateTime
  inhalt        String
  status        String   @default("OFFEN")
  anliegen_typ  String?
  konfidenz     String?  // gruen | gelb | rot
  chats         AufgabeChat[]
}

model AufgabeChat {
  id          Int      @id @default(autoincrement())
  aufgabe_id  String
  absender    String   // "admin" | "agent" | "hermes"
  nachricht   String
  zeitstempel DateTime @default(now())
}
```

`AufgabeChat` wird als Antwort-Thread pro Aufgabe genutzt — musste nicht neu gebaut werden, existierte schon.

**Kanal-Werte-Realität (Stand 05.08.2026):** Nur `kanal = "email"` ist tatsächlich befüllt (über die Gmail-Poll-Pipeline). `team`, `whatsapp`, `telegram`, `facebook` haben noch keine reale Datenquelle — Tabs zeigen dafür leer, bis die jeweilige Anbindung existiert.

## 3. UI-Struktur

**Kanal-Tabs (oben):** Alle / Team / Mail / WhatsApp / Telegram / Facebook, mit Live-Zähler pro Tab.

**Liste (links):** Absender, Kanal-Badge, Status-Badge, Konfidenz-Icon (🟢🟡🔴), Nachrichten-Vorschau, Zeitstempel. Aktive Zeile hervorgehoben mit Gold-Akzent (linker Rand + leichter Hintergrund).

**Detail-/Antwortpanel (rechts):** Header (Absender, Kanal, Anliegen-Typ), Chat-Verlauf als Sprechblasen (eingehend links/grau, Admin-Antworten rechts/navy), Antwort-Textfeld unten.

**VerlegenButton ("→ Zu Aufgaben"):** Bereits vorhandene Funktion, erweitert um kompakte Icon-Variante für die Listenzeile (`variant="icon"`), Original-Textvariante bleibt im Detailpanel-Header.

## 4. Design

Durchgängig benannte Tailwind-Tokens aus dem bestehenden Dashboard übernommen (kein Hex-Inline):
- `navy`, `navy-dark` — Text/Akzentflächen
- `gold` — aktive/hervorgehobene Elemente (Tab-Unterstrich, ausgewählte Zeile, Zähler-Badges)
- `neutral-*` — Rahmen, sekundärer Text, Trennlinien

## 5. Antwort-Mechanismus (V1)

**Entscheidung:** Antworten werden in `AufgabeChat` gespeichert, aber **nicht** wirklich über den jeweiligen Kanal an den Kunden verschickt. Kein Connector für WhatsApp-/Telegram-/Facebook-/Mail-Ausgang vorhanden. Bewusst kein Fake-Connector gebaut ("Kein Monster züchten").

UI zeigt bei jedem Kanal außer Team einen Hinweis: *"Versand-Connector für [Kanal] noch nicht aktiv — Antwort wird intern gespeichert."*

**Sobald ein echter Versand-Connector kommt:** `route.ts` (`/api/aufgabe-chat`) ist der richtige Ansatzpunkt, um den tatsächlichen Versand zusätzlich zur Speicherung auszulösen.

## 6. Datei-Übersicht

| Datei | Zielpfad | Inhalt |
|---|---|---|
| `page.tsx` | `a_Q7-code/app/input/page.tsx` | Server Component — lädt `Aufgabe` inkl. `chats`, serialisiert Dates zu ISO-Strings |
| `PosteingangClient.tsx` | `a_Q7-code/app/input/PosteingangClient.tsx` | Client Component — Tabs, Liste, Detail-/Antwortpanel, State-Management |
| `VerlegenButton.tsx` | `a_Q7-code/app/input/VerlegenButton.tsx` | Erweitert um `variant`-Prop ("text"/"icon"), abwärtskompatibel |
| `route.ts` | `a_Q7-code/app/api/aufgabe-chat/route.ts` | POST-Endpunkt — Antwort in `AufgabeChat` speichern |

## 7. Bekannte Bugs & Fixes (dieser Sitzung)

**Hydration-Fehler (verschachteltes `<button>`):** Listenzeile war ursprünglich ein `<button>`, `VerlegenButton` (Icon-Variante) rendert intern ebenfalls ein `<button>` → ungültiges HTML, React-Hydration-Fehler beim ersten Test. **Fix:** äußeres Element von `<button>` auf `<div role="button" tabIndex={0}>` umgestellt, `VerlegenButton`-Klick mit `stopPropagation()` isoliert.

**Gmail-Polling lief nicht automatisch:** Task Scheduler-Job `Q7_Gmail_Polling` (Quelle für `kanal = "email"`) hatte unter "Bedingungen" → "Energie" zwei aktivierte Haken ("nur im Netzbetrieb starten", "bei Akkubetrieb beenden") — auf Peters Laptop im Akkubetrieb lief der Task nie automatisch, obwohl er als eingerichtet galt. **Fix:** beide Haken entfernt. Bestätigt durch zwei erfolgreiche Live-Testmails.

## 8. A01-Verlegungs-Mechanismus (Konzept, noch nicht gebaut)

Perspektivisch soll A01 selbst erkennen, wenn ein Posteingang-Eintrag Handlungsbedarf hat, der nur ein Mensch ausführen kann (z. B. ein Rückruf-Wunsch), und proaktiv "→ Zu Aufgaben" vorschlagen statt dass der Admin manuell klickt.

**Mechanismus (Details siehe Aufgabenliste Abschnitt M, Q7-A-117–120):**
- Serien-Zählung pro Anliegen-Typ getrennt (nicht global), Reset auf 0 bei jedem Admin-Widerspruch
- Schwellenwert konfigurierbar (Standardvorschlag 10)
- Zwei-Stufen-Cooling-off-Bestätigung, bevor eine Kategorie autonom wird (Tag 1: Vorschlag, Tag 2: Re-Bestätigung)
- Gilt vorerst nur für die aktuelle Testphase mit Rückfrage (Q7-A-103, revidiert 05.08.2026) — danach greift der Lernmechanismus

**Noch offen:** komplette technische Umsetzung (Datenmodell für Serien-Zähler, Bestätigungs-Dialog-UI, Schwellenwert-Konfiguration) — bewusst zurückgestellt bis nach Peters Firmen-Testphase.

## 9. Offene Punkte

| Thema | Status |
|---|---|
| Team/WhatsApp/Telegram/Facebook — reale Datenquellen fehlen noch | Offen |
| Echter Versand-Connector (statt nur Speichern) | Offen, kein Zeitdruck laut "Kein Monster züchten" |
| A01-Verlegungs-Mechanismus technisch umsetzen (Q7-A-117–120) | Offen, nach Testphase |
| Live-Test mit echten Mehrfach-Kanälen (aktuell nur Mail getestet) | Offen |
