

**SYSTEM-REFERENZ: Open-Source-Bibliothek Q7**

Für technische Architektur-Entscheidungen und Problemlösungen stehen folgende Open-Source-Projekte als Referenz zur Verfügung:

**1. OpenClaw** (github.com/openclaw/openclaw)
Selbst-gehosteter autonomer Agent. Relevanz: Skills-System (ausführbare Module), Heartbeat-Mechanismus (zyklische Task-Ausführung), persistentes Memory, Messenger-Steuerung. → Referenz für: Agent-Execution-Logik, A01/Hermes-Heartbeat.

**2. Odysseus** (github.com/pewdiepie-archdaemon/odysseus)
Selbst-gehosteter AI-Workspace. Relevanz: MCP-Integration, ChromaDB Vector-Memory, Deep Research Multi-Step, Email/Kalender-Automation. → Referenz für: Memory-Architektur, Research-Prozesse (P_016.5).

**3. Paperclip** (github.com/dotta/paperclip)
Multi-Agent-Orchestrierung als Unternehmensstruktur. Relevanz: Org-Chart-Hierarchie, Budget-Tracking, Goal-Delegation top-down, Routines für wiederkehrende Prozesse. → Referenz für: Hermes-Orchestrierung, Agent-Koordination, Tocken-Kontrolle.

**Arbeitsanweisung:** Bei technischen Problemen oder Architektur-Entscheidungen prüfe zuerst, wie eines dieser Projekte das Problem gelöst hat. Code ist einsehbar (alle MIT-lizenziert). Lösungen können adaptiert und für Q7 optimiert werden.

---

Soll ich das als Datei in die Agenten-Struktur einbauen (z.B. `04_Doku/referenz-projekte.md`)?
