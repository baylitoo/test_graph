COMPOSE ?= docker compose
ENV_FILE ?= .env

.PHONY: up down logs ps restart
up:
	$(COMPOSE) --env-file $(ENV_FILE) up -d
down:
	$(COMPOSE) --env-file $(ENV_FILE) down

logs:
	$(COMPOSE) --env-file $(ENV_FILE) logs -f

ps:
	$(COMPOSE) --env-file $(ENV_FILE) ps

restart:
	$(COMPOSE) --env-file $(ENV_FILE) down
	$(COMPOSE) --env-file $(ENV_FILE) up -d
