# A14_Sicherheit — Skills

**Ordner:** 02_KI-UNTERNEHMEN/A14_Sicherheit/02_Grundlagen/
**Version:** v2.0 | **Status:** Aktiv
**Änderungen seit v1.0:** Kompetenzen um Schadsoftware- und Spam-Erkennung präzisiert (jetzt voller Funktionsumfang in Quarantäne) · Verweis auf systemweite PII-Maskierung ergänzt

---

## 1. Kernkompetenzen

| Kompetenz | Beschreibung |
|---|---|
| Schadsoftware-Erkennung (Filter 1) | Identifikation von Malware, Viren, Phishing-Links, gefährlichen Anhängen, verbotenen Dateiformaten — direkt in `01_Quarantäne` |
| Spam-/Legitimitäts-Bewertung (Filter 2) | Erkennung von Spam, Werbung, nicht-legitimen oder irrelevanten Inputs — direkt in `01_Quarantäne` |
| PII-Erkennung & Klassifizierung | Identifikation personenbezogener Daten im Input, bereits während des Quarantäne-Durchlaufs (Detail-Katalog: siehe Abschnitt 2) |
| Anonymisierungs- & Extraktionslogik | Trennung von PII-Anteilen vom restlichen Inhalt, ohne den Nutzwert des bereinigten Inhalts zu zerstören |
| Audit-Trail-Dokumentation | Lückenlose Protokollierung jeder Entscheidung (Freigabe, Ablehnung, Isolierung, Eskalation, Failover) |

---

## 2. Wissensbasis

| Bereich | Status |
|---|---|
| Format-Whitelist (zulässige Dateitypen) | Offen — TBD, gehört zur operativen Ausgestaltung |
| PII-Kategorien-Katalog | **Offen.** Wird in separater, noch zu erstellender Datei definiert. Hängt mit den ungeklärten Vertraulichkeitsstufen (dritte Tier neben PII/intern) zusammen. GF entscheidet Inhalt und Struktur selbst. |
| Bekannte Spam-/Phishing-Muster | Offen — TBD, gehört zur operativen Ausgestaltung |
| Systemweite PII-Maskierung | `[PII-Daten siehe TRESOR]` gilt als verbindliche Maske für alle Abteilungen im Fließtext (siehe `regeln.md` Abschnitt 1, Regel 6). A14 ist Quelle der Extraktion, die Maske selbst wird systemweit angewendet. |

A14 legt eigene Referenz- und Mustererkennungsdateien ggf. in einem eigenen Unterordner ab (nicht in `06_WISSEN`, da `06_WISSEN` laut Teil C als allgemeine, abteilungsübergreifende Wissensablage konzipiert ist — A14-spezifisches Sicherheitswissen bleibt innerhalb des A14-Agentenordners, um Zugriffstrennung zu wahren).

---

## 3. Kommunikationskanäle

| Kanal | Gegenüber | Typ | Inhalt |
|---|---|---|---|
| Freigabe-Übergabe | A01 (Hermes) | Routine | Freigabe-Vermerk `AUD_..._14S_FREIGABE` |
| Eskalation — Recht | A07 | Eskalation | PII-Grenzfälle, rechtliche Anomalien |
| Eskalation — Grundsatz | GF | Eskalation | Alle Fälle, die A14 nicht eindeutig entscheiden kann; Schadsoftware-Alarme |
| Tresor-Schreibzugriff | A08 (Finanzen, Tresor-Gatekeeper) | Routine | PII-Daten nach `K4_Personen/KD_[Nr]` (Write-Only, direkter Pfad) |
| Systemüberwachung | A11 (Systemcontrolling) | Routine | Durchlaufzeiten, Auffälligkeiten, Failover-Ereignisse |
| Failover-Übergabe | A14b | Routine | Heartbeat, Lock-Token bei Übernahme |

Format der Routine-Meldungen und Eskalationen: siehe `README.md`, Abschnitt 5 (Schnittstellen-Tabelle).

---

*A14_Sicherheit — Skills | Q7-System | Datei 3/5*
