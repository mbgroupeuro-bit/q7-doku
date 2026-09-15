# Q7-Sicherheitsarchitektur – Finale Version

## 1. Systeme & Eigentümer

| Bereich | Pfad | Eigentümer | Änderungsrecht |
|---------|------|------------|----------------|
| **Q7 Code** | `a:code` | Q7 Entwicklungs Team | **Nur Q7 Entwicklungs Team** |
| **Q7 Dokumentation** | `b:doku` | Q7 Entwicklungs Team | **Nur Q7 Entwicklungs Team** |
| **Q7 Sicherheitsrahmen** | `b:doku/SICHERHEIT/` | Q7 Entwicklungs Team | **Nur Q7 Entwicklungs Team** |
| **Kundendatenbank** | `c:datenbank` | Lizenznehmer | **Nur Admin des Lizenznehmers** |

> **04_TRESOR** wird aufgelöst. Der Inhalt wandert nach `b:doku/SICHERHEIT/` (Rahmenbedingungen) bzw. `c:datenbank` (operative Rechteverwaltung).

---

## 2. Drei Sicherheitsebenen – Zuständigkeiten

| Ebene | Was | Wer macht was | Ort |
|-------|-----|---------------|-----|
| **Extern** | Schutz vor Angriffen von außen, Server in Europa, Verschlüsselung, Firewall, Backups, DDoS-Schutz | **Q7 Entwicklungs Team** | Infrastruktur / `a:code` |
| **Intern (Rahmen)** | Klassifizierung K1–K4, technische Sicherheitsstandards, Export-Sperren-Logik, Audit-Log-Mechanismus | **Q7 Entwicklungs Team** | `b:doku/SICHERHEIT/` |
| **Intern (Operativ)** | Wer darf welche Daten lesen/ändern/löschen, Rollenvergabe, Freigaben pro Mitarbeiter | **Admin des Lizenznehmers** | `c:datenbank` |

---

## 3. Standardberechtigung (c:datenbank)

| Rolle | Lesen | Ändern | Löschen | Anlegen |
|-------|-------|--------|---------|---------|
| **Admin** | ✅ | ✅ | ✅ | ✅ |
| **Mitarbeiter** | ✅ (zugewiesen) | ⚠️ (freigegeben) | ❌ | ⚠️ (je nach Modul) |
| **Gast** | ✅ (eingeschränkt) | ❌ | ❌ | ❌ |

---

## 4. Aufgaben & Zuständigkeiten

| Aufgabe | Implementierung (Code/System) | Konfiguration/Betrieb | Ort |
|---------|------------------------------|----------------------|-----|
| Rollen & Rechte vergeben | Q7 Entwicklungs Team | Admin (Lizenznehmer) | `c:datenbank` |
| Wer darf was lesen/ändern | Q7 Entwicklungs Team | Admin (Lizenznehmer) | `c:datenbank` |
| Klassifizierung K1–K4 (Rahmen/Regeln) | Q7 Entwicklungs Team | — | `b:doku/SICHERHEIT/` |
| Klassifizierung K1–K4 (Zuordnung der Daten) | Q7 Entwicklungs Team | Admin (Lizenznehmer) | `c:datenbank` |
| Export-Sperren, Wasserzeichen, Audit-Log | Q7 Entwicklungs Team | Admin (Lizenznehmer) | `a:code` / `c:datenbank` |
| Verschlüsselung, Firewall, Backup | Q7 Entwicklungs Team | Q7 Entwicklungs Team | Infrastruktur / `a:code` |
| 2FA, Login-Sperre | Q7 Entwicklungs Team | Admin (Lizenznehmer) | `a:code` / `c:datenbank` |

---

## 5. Externe Sicherheit

| Maßnahme | Implementierung | Konfiguration | Ort |
|----------|----------------|---------------|-----|
| SSL/TLS-Verschlüsselung | Q7 Entwicklungs Team | Q7 Entwicklungs Team | Infrastruktur |
| Firewall / DDoS-Schutz | Q7 Entwicklungs Team | Q7 Entwicklungs Team | Infrastruktur |
| Zwei-Faktor-Authentifizierung (2FA) | Q7 Entwicklungs Team | Admin (Lizenznehmer) | `a:code` / `c:datenbank` |
| Brute-Force-Schutz (Login-Sperre) | Q7 Entwicklungs Team | Admin (Lizenznehmer) | `a:code` / `c:datenbank` |
| Automatische Backups + Verschlüsselung | Q7 Entwicklungs Team | Q7 Entwicklungs Team | Infrastruktur |
| IP-Whitelist (optional) | Q7 Entwicklungs Team | Admin (Lizenznehmer) | `a:code` / `c:datenbank` |

---

## 6. Interne Datensicherheit (Insider-Schutz)

| Maßnahme | Implementierung | Konfiguration/Betrieb | Ort |
|----------|----------------|----------------------|-----|
| Klassifizierung K1–K4 (Rahmen) | Q7 Entwicklungs Team | — | `b:doku/SICHERHEIT/` |
| Export-/Download-Sperren | Q7 Entwicklungs Team | Admin (Lizenznehmer) | `a:code` / `c:datenbank` |
| Wasserzeichen bei Anzeige | Q7 Entwicklungs Team | Admin (Lizenznehmer) | `a:code` / `c:datenbank` |
| Session-Timeout / Bildschirmsperre | Q7 Entwicklungs Team | Admin (Lizenznehmer) | `a:code` / `c:datenbank` |
| Keine lokale Speicherung | Q7 Entwicklungs Team | — | `a:code` |
| Audit-Log (Wer hat wann was gesehen?) | Q7 Entwicklungs Team | Admin prüft Verdachtsfälle | `a:code` / `c:datenbank` |

---

## 7. Zusammenfassung

- **Q7 Entwicklungs Team** liefert das sichere System (Code, Server, Klassifizierungsrahmen, technische Schutzmechanismen).
- **Der Lizenznehmer-Admin** entscheidet intern, wer im System was darf – mit den voreingestellten Standards (Admin = volle Kontrolle, Rest = Lesen/eingeschränkt).
