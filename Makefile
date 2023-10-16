
DOCKER_COMPOSE = ./srcs/docker-compose.yml

build:
	if [ ! -d "/home/lmaurin-/data" ]; then mkdir -p "/home/lmaurin-/data"; fi
	sudo docker compose -f $(DOCKER_COMPOSE) build
up:
	sudo docker compose -f $(DOCKER_COMPOSE) up -d
down:
	sudo docker compose -f $(DOCKER_COMPOSE) down
clean:
	sudo docker compose -f $(DOCKER_COMPOSE) down -v
	if [ -d "/home/lmaurin-/data" ]; then rm -r "/home/lmaurin-/data"; fi
	sudo docker rmi $(sudo docker images -a -q)
re:	clean build