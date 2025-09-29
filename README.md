# NutriScore LangGraph Agent

This repository hosts the NutriScore agent that will orchestrate LangGraph workflows across Neo4j-backed Model Context Protocol (MCP) services and Azure OpenAI models. The project plan in [`PROJECT_PLAN.md`](PROJECT_PLAN.md) walks through the broader roadmap; this README focuses on the local developer workflow for standing up the graph infrastructure and tools.

## Prerequisites

* Docker (with the newer `docker compose` plugin)
* Make (or the ability to run the commands listed in the `Makefile`)
* An `.env` file based on [`.env.example`](.env.example) that provides Neo4j credentials, host ports, and Azure OpenAI settings

## Running the local stack

The repository includes a Docker Compose definition that launches Neo4j alongside the two MCP servers that expose Cypher and graph-memory tooling. Helper targets in the `Makefile` wrap the most common lifecycle commands.

```bash
cp .env.example .env  # customise credentials & ports first
make up               # start Neo4j + MCP servers in the background
make ps               # verify container status
make logs             # follow logs for troubleshooting
make down             # stop and remove the stack
```

> **Note:** If you prefer using `docker compose` directly, every target simply forwards to `docker compose --env-file <env> ...`. Override `COMPOSE` or `ENV_FILE` when invoking make to suit your environment: `make COMPOSE="docker compose --project-name nutriscore" up`.

### Services

| Service        | Image                                                    | Purpose                                                     | Host Ports (default) |
| -------------- | -------------------------------------------------------- | ----------------------------------------------------------- | -------------------- |
| `neo4j`        | `neo4j:5.17`                                             | Graph database backing NutriScore data and MCP tools        | 7474 (HTTP), 7687 (Bolt) |
| `mcp-cypher`   | `ghcr.io/modelcontextprotocol/neo4j-cypher-mcp:latest`   | Provides read/write Cypher MCP tools for LangGraph          | 8000                 |
| `mcp-memory`   | `ghcr.io/modelcontextprotocol/neo4j-memory-mcp:latest`   | Exposes graph memory MCP tools (entity & relation helpers)  | 8001                 |

Both MCP services connect to the Neo4j container over the internal Docker network using the credentials supplied in the `.env` file.

### Health checks & readiness

The Neo4j service includes a healthcheck that waits for Bolt authentication to succeed before starting the MCP containers. Because the MCP images use HTTP transports by default, they become reachable at `http://localhost:<port>/mcp/` once the stack is up.

You can quickly inspect the available tools via the MCP inspector:

```bash
npx @modelcontextprotocol/inspector http://localhost:8000/mcp/
npx @modelcontextprotocol/inspector http://localhost:8001/mcp/
```

## Next steps

With the infrastructure running, you can develop and iterate on the LangGraph agent found under `src/nutriscore_agent/`. Future phases will extend the graph schema, add scoring workflows, and document ingestion pipelines as outlined in the project plan.
