
DOCKER_COMPOSE = ./srcs/docker-compose.yml

build: down create_volumes
	@sudo docker compose -f $(DOCKER_COMPOSE) build

buildnocache: create_volumes
	@sudo docker compose -f $(DOCKER_COMPOSE) build --no-cache

create_volumes:
	@if [ ! -d ~/data ]; then \
	echo "\033[33mCreating volumes folders. . .\033[0m" && \
	mkdir -p ~/data && \
	mkdir -p ~/data/wordpress && \
	mkdir -p ~/data/mariadb && \
	echo "\033[32mVolumes folders created !\033[0m"; \
	else \
	echo "\033[33mData folder already exists !\033[0m"; \
	fi

rm_volumes:
	@if [ -d ~/data ]; then \
	echo "\033[33mDeleting volumes. . . \033[0m" && \
	sudo rm -rf /home/${USER}/data && \
	echo "\033[32mDone !\033[0m"; \
	else \
	echo "\033[33mVolumes already deleted\033[0m"; \
	fi

status:
	@echo "\033[32m---DOCKER COMPOSE PROCESSES---\033[0m"
	@sudo docker compose -f $(DOCKER_COMPOSE) ps
	@echo "\033[32m---DOCKER COMPOSE IMAGES---\033[0m"
	@sudo docker compose -f $(DOCKER_COMPOSE) images

logs:
	@sudo docker compose -f $(DOCKER_COMPOSE) logs -f

up: create_volumes
	@mkdir -p ~/data
	@sudo docker compose -f $(DOCKER_COMPOSE) up -d

down:
	@sudo docker compose -f $(DOCKER_COMPOSE) down

prune: rm_volumes
	@sudo docker compose -f $(DOCKER_COMPOSE) down -v --rmi all --remove-orphans
	@sudo docker system prune -a -f

re:	down rm_volumes buildnocache