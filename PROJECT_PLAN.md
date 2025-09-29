# NutriScore Agent Project Plan

This document breaks the project into sequential, manageable tasks. Each task can be tackled independently while keeping the overall goal in sight: a LangGraph-powered NutriScore calculator that uses Neo4j MCP servers and Azure OpenAI.

## Phase 0 – Foundations & Environment
1. **Repository Scaffolding**  
   - Create Python project structure (src/, tests/, docs/).  
   - Add formatting/linting configs (ruff, black, mypy) and CI stubs.  
   - Provide `.env.example` with required variables (Neo4j, MCP, Azure OpenAI).
2. **Container Orchestration**  
   - Adapt provided `docker-compose.yml` and `.env` for local setup.  
   - Script helper commands (`make` or shell scripts) to bootstrap services.  
   - Verify Neo4j and MCP servers respond via MCP Inspector.
3. **LangGraph App Skeleton**  
   - Initialize virtual environment tooling (uv/poetry/pip).  
   - Create baseline `app.py` connecting to Azure OpenAI and MCP servers.  
   - Implement minimal CLI entry point for manual smoke tests.

## Phase 1 – NutriScore Domain Modeling
4. **Nutrition Ontology Design**  
   - Define node/relationship types representing products, ingredients, metrics, and pillar scores.  
   - Document constraints (allowed node labels, relation types, properties).
5. **Graph Schema Implementation**  
   - Encode schema rules into initialization scripts (Cypher migrations or seed files).  
   - Add validation utilities ensuring new data respects schema.
6. **Pillar Definitions & Scoring APIs**  
   - List required scoring pillars (e.g., Explainability, Trustworthiness, Frugality, Environment).  
   - Specify inputs/outputs and data sources for each pillar.  
   - Align scoring results with the graph schema (nodes/relationships).

## Phase 2 – MCP Tooling Integration
7. **Cypher Tool Workflows**  
   - Wrap common graph operations (querying schema, reading/writing pillars) into LangGraph tool calls.  
   - Add retry/error handling for MCP failures.
8. **Graph Memory Workflows**  
   - Prototype entity/relation creation using `mcp-neo4j-memory`.  
   - Store/retrieve agent observations and derived facts.  
   - Evaluate when to use memory vs direct Cypher writes.
9. **Agent Loop Design**  
   - Build LangGraph state machine for multi-step scoring (data gathering → pillar calculations → aggregation).  
   - Implement tool routing logic and guardrails for each step.  
   - Configure logging/telemetry for tool interactions.

## Phase 3 – NutriScore Calculation Features
10. **Pillar Calculation Agents**  
    - Implement dedicated subgraphs or nodes for each pillar, encapsulating scoring logic.  
    - Ensure deterministic scoring where required (temperature control, caching).
11. **Aggregation Strategy**  
    - Define NutriScore aggregation formula from pillar outputs.  
    - Persist aggregated scores and history in Neo4j.  
    - Provide explanation traces referencing pillar inputs.
12. **Explainability & Auditing**  
    - Capture intermediate reasoning steps via MCP memory.  
    - Generate human-readable reports summarizing how the score was derived.  
    - Add guardrails for missing/uncertain data.

## Phase 4 – GraphRAG Test Case
13. **Document Ingestion Pipeline**  
    - Use LLMGraphBuilder (or similar) to transform sample documents into nodes/edges respecting schema.  
    - Store ingestion configs and prompts for reproducibility.
14. **GraphRAG Retrieval Agent**  
    - Implement a LangGraph workflow that reads from Neo4j to answer nutrition questions.  
    - Validate retrieval accuracy with unit/integration tests.
15. **Evaluation & Benchmarks**  
    - Create test datasets and metrics for pillar accuracy, retrieval precision, and end-to-end NutriScore reliability.  
    - Automate regression checks.

## Phase 5 – Deployment & Documentation
16. **Packaging & Deployment**  
    - Containerize LangGraph app or provide deployment instructions (Docker/Kubernetes).  
    - Secure credentials and configure production-ready settings.
17. **Developer Experience Enhancements**  
    - Add Makefile targets, VSCode devcontainer, or scripts for rapid onboarding.  
    - Document troubleshooting steps for Neo4j/MCP/Azure integration.
18. **User Documentation & Demos**  
    - Write README sections for setup, running agents, and sample workflows.  
    - Produce demo notebooks or CLI scripts showcasing NutriScore calculation and GraphRAG queries.

## Parallel Support Streams
- **Research & Compliance**: Track domain-specific guidelines for nutrition scoring standards.  
- **Prompt Engineering**: Iterate on Azure OpenAI prompts for reliable tool usage.  
- **Monitoring & Observability**: Plan for metrics, tracing, and alerting once services run in production.

Feel free to pick tasks in order or in parallel where dependencies allow. Each section can be expanded into GitHub issues for collaborative tracking.
