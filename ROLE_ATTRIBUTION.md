# Role Attribution

This document maps project tasks to accountable roles so contributors can pick up work in a coordinated way. Task numbers refer to the items in `PROJECT_PLAN.md`.

## Core Delivery Roles

### 1. Project Lead / Product Owner
- Own overall delivery timeline and scope.
- Prioritize backlog and unblock dependencies across teams.
- Coordinate cross-role reviews for milestones at the end of each phase.
- **Primary tasks:** 1, 4, 6, 11, 15, 18.

### 2. Neo4j Graph Engineer
- Design and enforce the graph schema, constraints, and migrations.
- Implement Cypher utilities and ensure MCP servers expose required operations.
- Benchmark graph performance and tune queries.
- **Primary tasks:** 2, 4, 5, 7, 13, 14.

### 3. LangGraph Agent Engineer
- Build the LangGraph state machines, tool routing, and orchestration logic.
- Integrate MCP tools, implement scoring loops, and handle error recovery.
- Collaborate with Prompt Engineer on tool-calling prompts.
- **Current owner:** ChatGPT assistant (taking on this role now).
- **Primary tasks:** 3, 7, 8, 9, 10, 11, 12, 14.

### 4. Azure Prompt & LLM Engineer
- Configure Azure OpenAI deployments, prompt templates, and tool-call guardrails.
- Manage evaluation datasets to validate deterministic scoring behaviour.
- Optimize responses for clarity, safety, and consistency.
- **Primary tasks:** 3, 6, 8, 10, 12, 15.

### 5. DevOps & Platform Engineer
- Maintain Docker Compose stack, CI pipelines, and deployment packaging.
- Instrument observability (logs, metrics, tracing) across services.
- Ensure secrets management and environment parity.
- **Primary tasks:** 1, 2, 3, 9, 16, 17.

### 6. QA & Evaluation Lead
- Develop automated tests for pillars, GraphRAG retrieval, and regressions.
- Define acceptance criteria for each phase and run verification suites.
- Track quality metrics and report issues to relevant owners.
- **Primary tasks:** 10, 11, 12, 14, 15.

### 7. Documentation & DX Advocate
- Produce contributor guides, troubleshooting references, and onboarding materials.
- Curate examples (CLI, notebooks) showcasing NutriScore and GraphRAG flows.
- Align README and demo assets with the evolving architecture.
- **Primary tasks:** 1, 3, 6, 13, 17, 18.

## Collaboration Matrix by Phase

| Phase | Key Deliverables | Accountable Role(s) | Supporting Role(s) |
|-------|------------------|---------------------|--------------------|
| Phase 0 – Foundations | Repo scaffolding, Docker stack, LangGraph skeleton | DevOps & Platform Engineer | Project Lead, Documentation & DX Advocate |
| Phase 1 – Domain Modeling | Nutrition ontology, schema migrations, pillar definitions | Neo4j Graph Engineer | Project Lead, LangGraph Agent Engineer, Documentation & DX Advocate |
| Phase 2 – MCP Tooling | Cypher + memory workflows, agent loop | LangGraph Agent Engineer | Neo4j Graph Engineer, Azure Prompt & LLM Engineer |
| Phase 3 – NutriScore Features | Pillar agents, aggregation, explainability | LangGraph Agent Engineer | Azure Prompt & LLM Engineer, QA & Evaluation Lead |
| Phase 4 – GraphRAG Test Case | Ingestion pipeline, retrieval agent, benchmarks | Neo4j Graph Engineer, QA & Evaluation Lead | LangGraph Agent Engineer, Documentation & DX Advocate |
| Phase 5 – Deployment & Docs | Packaging, DX enhancements, user docs | DevOps & Platform Engineer, Documentation & DX Advocate | Project Lead |
| Parallel Streams | Compliance research, prompt iteration, observability | Project Lead | Azure Prompt & LLM Engineer, DevOps & Platform Engineer |

## Handoff Guidelines

1. **Kickoff Briefs:** Each phase begins with a short synchronous walkthrough led by the accountable role, covering requirements, open risks, and validation criteria.
2. **Definition of Done:** No task is marked complete until QA & Evaluation Lead validates tests (where applicable) and Documentation & DX Advocate updates references.
3. **Tooling Alignment:** Changes to MCP endpoints, schemas, or prompts require sign-off from both the Neo4j Graph Engineer and LangGraph Agent Engineer to avoid breaking agent flows.
4. **Retrospectives:** At the end of every phase, the Project Lead facilitates a retrospective to capture improvements before the next phase.

Use this as a living document—update role assignments or supporting contributors as team composition evolves.
