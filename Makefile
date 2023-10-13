
DOCKER_COMPOSE = ./srcs/docker-compose.yml

build:
	sudo docker compose -f $(DOCKER_COMPOSE) build
up:
	sudo docker compose -f $(DOCKER_COMPOSE) up -d
down:
	sudo docker compose -f $(DOCKER_COMPOSE) down
clean:
	sudo docker compose -f $(DOCKER_COMPOSE) down -v

re:	clean build