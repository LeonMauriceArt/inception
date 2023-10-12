
DOCKER_COMPOSE = docker-compose.yml

build:
	docker compose -f $(DOCKER_COMPOSE) build
up:
	docker compose -f $(DOCKER_COMPOSE) up -d
down:
	docker compose -f $(DOCKER_COMPOSE) down
clean:
	docker compose -f $(DOCKER_COMPOSE) down -v

re:	clean build
