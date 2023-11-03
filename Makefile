
DOCKER_COMPOSE = ./srcs/docker-compose.yml

build:
	@if [ ! -d "/home/${USER}/data" ]; then mkdir -p "/home/${USER}/data" && chmod +w /home/${USER}/data; fi
	@sudo docker compose -f $(DOCKER_COMPOSE) build

buildnocache:
	@if [ ! -d "/home/${USER}/data" ]; then mkdir -p "/home/${USER}/data"; fi
	@sudo docker compose -f $(DOCKER_COMPOSE) build --no-cache

list:
	@echo "\033[32m---DOCKER COMPOSE PROCESSES---\033[0m"
	@sudo docker compose -f $(DOCKER_COMPOSE) ps
	@echo "\033[32m---DOCKER COMPOSE IMAGES---\033[0m"
	@sudo docker compose -f $(DOCKER_COMPOSE) images

logs:
	@sudo docker compose -f $(DOCKER_COMPOSE) logs

up:
	@sudo docker compose -f $(DOCKER_COMPOSE) up -d

down:
	@sudo docker compose -f $(DOCKER_COMPOSE) down

clean:
	@sudo docker compose -f $(DOCKER_COMPOSE) down -v --rmi all --remove-orphans
	@if [ -d "/home/${USER}/data" ]; then rm -r "/home/${USER}/data"; fi
	@sudo docker system prune -a -f

re:	clean build