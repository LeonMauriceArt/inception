
DOCKER_COMPOSE = ./srcs/docker-compose.yml

build: create_volumes
	@sudo docker compose -f $(DOCKER_COMPOSE) build

buildnocache:
	@sudo docker compose -f $(DOCKER_COMPOSE) build --no-cache

create_volumes:
	mkdir -p /home/${USER}/data
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/mariadb
	sudo chown -R ${USER} /home/${USER}/data
	sudo chmod -R 777 /home/${USER}/data

rm_volumes:
	sudo rm -rf /home/${USER}/data

status:
	@echo "\033[32m---DOCKER COMPOSE PROCESSES---\033[0m"
	@sudo docker compose -f $(DOCKER_COMPOSE) ps
	@echo "\033[32m---DOCKER COMPOSE IMAGES---\033[0m"
	@sudo docker compose -f $(DOCKER_COMPOSE) images

logs:
	@sudo docker compose -f $(DOCKER_COMPOSE) logs -f

up:
	@mkdir -p ~/data
	@sudo docker compose -f $(DOCKER_COMPOSE) up -d

down:
	@sudo docker compose -f $(DOCKER_COMPOSE) down -v

clean: rm_volumes
	@sudo docker compose -f $(DOCKER_COMPOSE) down -v --rmi all --remove-orphans
	@sudo docker system prune -a -f

re:	clean build