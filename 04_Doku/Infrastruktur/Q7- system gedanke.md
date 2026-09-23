# Q7 Enterprise Agent System – Systemarchitektur & Standards

> **Status:** Entwurf / Aktiv  
> **Backend-Stack:** NestJS (TypeScript), LangGraph, PostgreSQL (pgvector)  
> **Primärer Orchestrator:**  Assistent (A01)  
> **Lizenz-Basis:** Open-Source Frameworks (MIT / Apache 2.0)

---

## 1. Systemüberblick & Leitphilosophie

Das **Q7-Betriebssystem** ist ein modulares, entkoppeltes Multi-Agenten-System für Unternehmensworkflows. 

* **Agenten-Identitäten (Gehirn):** Liegen als reine Markdown/YAML-Dateien vor (`/identity`, `/boundaries`, `/skills`, `/knowledge`).
* **Agenten-Harness (Schaltwerk):** Wird im NestJS-Backend gesteuert.
* **To-Spec & Quality Gate:** Kein Fachagent arbeitet ohne ein von A01 geprüftes und validiertes Auftragspaket (`SPEC.json`).

---

## 2. Ordnerstruktur (NestJS Backend)

```text
apps/q7-core-backend/
├── src/
│   ├── modules/
│   │   ├── agent-loader/        # Liest YAML-Frontmatter & Markdown-Regeln
│   │   ├── inbox-matcher/       # Vector Search (pgvector) für Pattern Matching
│   │   ├── orchestrator/        # A01  Logik & Routing
│   │   └── langgraph-harness/   # LangGraph State-Machine & Nodes
│   ├── schemas/                 # JSON-Schemas für SPEC.json & DTOs
│   └── main.ts
├── data/
│   └── agents/                  # Single Source of Truth für Agenten-Mds
│       ├── A01_Orchestrator/
│       ├── A02_Technik/
│       └── A03_Marketing/
└── ARCHITECTURE.md