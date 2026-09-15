# Q7-Sicherheit – Externe Schnittstellen (API, WhatsApp, E-Mail)

> Technische Sicherheitsmaßnahmen für API-Zugänge und Kommunikationskanäle.
> Der Quarantäne-/Eingangs-Datenfluss ist ausgelagert nach `q7_input_schleuse_architektur.md`
> (abgelegt in `c_Q7_datenbank/01_INPUT/01_Quarantaene/`). Dieses Dokument behandelt ausschließlich
> die technische Absicherung der Kanäle selbst, nicht den Prüf-Workflow eingehender Daten.
> Stand: 2026-07-24

---

## 1. Risiken bei API-Zugriffen

| Risiko | Beschreibung |
|---|---|
| **API-Key-Diebstahl** | Schlüssel werden per Mail/Chat weitergegeben oder unsicher gespeichert |
| **Man-in-the-Middle** | Abfangen von Daten zwischen WhatsApp/E-Mail und Q7-System |
| **Phishing über Schnittstellen** | Gefälschte Nachrichten, die über API hereinkommen und als legitim erscheinen |
| **Unautorisierter Zugriff** | Ex-Mitarbeiter oder Dritte nutzen noch gültige API-Zugänge |
| **Datenlecks bei Weiterleitung** | Kundendaten werden unverschlüsselt per WhatsApp/E-Mail verschickt |

---

## 2. API-Sicherheit (technisch) – Q7 Entwicklungs-Team

| Maßnahme | Umsetzung |
|---|---|
| API-Keys niemals im Klartext speichern | Verschlüsselte Speicherung, Hashing mit Salt |
| Key-Rotation | Automatischer Wechsel in festen Intervallen (z. B. 90 Tage) |
| OAuth 2.0 / Token-basiert | Kurzlebige Access-Tokens mit Refresh-Mechanismus statt fester Keys |
| IP-Whitelist pro API-Zugang | Nur bekannte Server/Standorte dürfen zugreifen |
| Rate-Limiting | Begrenzung der Anfragen pro Minute – Schutz vor Brute-Force/Überlastung |
| Webhook-Signaturprüfung | Eingehende Webhooks (z. B. WhatsApp) werden per HMAC-Signatur auf Echtheit geprüft |
| Keine sensiblen Daten in URLs | API-Parameter niemals mit K4-Daten in der URL übertragen |
| TLS 1.3 erzwingen | Alle API-Kommunikation nur über verschlüsselte Verbindungen |

---

## 3. WhatsApp-Schnittstelle

| Maßnahme | Zuständig |
|---|---|
| Offizielle WhatsApp Business API nutzen (keine inoffiziellen Lösungen) | Q7 Entwicklungs-Team |
| Telefonnummer-Verifizierung – nur verifizierte Nummern dürfen senden/empfangen | Admin konfiguriert |
| Keine K4-Daten (Zahlungen, Zugangsdaten) per WhatsApp – System blockiert automatisch | Q7 Entwicklungs-Team |
| Protokollierung aller WhatsApp-Kommunikation im Audit-Log | Q7 Entwicklungs-Team |
| Zustimmung des Kunden einholen, bevor WhatsApp für Geschäftskommunikation genutzt wird | Admin / Lizenznehmer |

---

## 4. E-Mail-Schnittstelle

| Maßnahme | Zuständig |
|---|---|
| SPF, DKIM, DMARC für ausgehende E-Mails (Schutz vor Fälschung) | Q7 Entwicklungs-Team |
| Eingehende E-Mails auf Malware/Phishing prüfen | Q7 Entwicklungs-Team |
| Keine Anhänge mit K4-Daten unverschlüsselt – System warnt/blockiert | Q7 Entwicklungs-Team |
| E-Mail-Adressen-Whitelist – nur bekannte Domains dürfen ins System schreiben | Admin konfiguriert |
| Automatische Sperre bei verdächtigen Mustern (z. B. Massen-E-Mails gleichen Inhalts) | Q7 Entwicklungs-Team |

---

## 5. Zugangsmanagement – Admin des Lizenznehmers

| Maßnahme | Beschreibung |
|---|---|
| API-Zugänge pro Mitarbeiter | Kein gemeinsamer API-Key für alle |
| Rechte minimal vergeben | Nur die APIs freischalten, die wirklich gebraucht werden |
| Sofortige Deaktivierung | Bei Mitarbeiter-Austritt oder Verdacht sofort sperren |
| Keine Weitergabe | API-Keys niemals per WhatsApp, E-Mail oder Chat – nur über sicheres Admin-Panel |
| Regelmäßige Prüfung | Aktive API-Zugänge im Admin-Dashboard kontrollieren |

---

## 6. Audit & Monitoring

| Was | Implementierung | Nutzung |
|---|---|---|
| API-Zugriffs-Log (wer, wann, welche API, welche Daten) | Q7 Entwicklungs-Team | Admin prüft Verdachtsfälle |
| Alert bei ungewöhnlichen API-Aufrufen (nachts, fremdes Land, Massenabfragen) | Q7 Entwicklungs-Team | Admin wird benachrichtigt |
| Automatische Sperre nach X fehlgeschlagenen Authentifizierungen | Q7 Entwicklungs-Team | — |

---

## 7. Zuständigkeiten – Übersicht

| Ebene | Q7 Entwicklungs-Team | Admin (Lizenznehmer) |
|---|---|---|
| Technische Absicherung der APIs | ✅ Implementierung | — |
| Verschlüsselung, Rate-Limiting, Webhook-Prüfung | ✅ Implementierung | — |
| API-Keys vergeben, rotieren, sperren | ✅ System stellt bereit | ✅ Admin führt aus |
| Wer darf welche API nutzen | ✅ Rahmen setzen | ✅ Admin konfiguriert |
| Verdachtsfälle prüfen | ✅ Logs bereitstellen | ✅ Admin wertet aus |

---

## 8. Verweis

Für den Ablauf bei eingehenden, zu prüfenden Daten (Quarantäne, Virenscan, A14-Freigabe-Token, Isolation bei Gefahr) siehe `q7_input_schleuse_architektur.md` in `c_Q7_datenbank/01_INPUT/01_Quarantaene/`.
