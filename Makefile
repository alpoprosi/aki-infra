up: create-net pg pg-create aki aki-web-dev nginx

create-net:
	docker network create aki_network || echo '' > /dev/null

down: stop
	docker stop aki_nginx aki_postgres

update: stop aki aki-web

update-aki: stop-aki stop-nginx aki nginx
update-web: stop-web stop-nginx aki-web nginx

aki: ; $("SHELL") ./scripts/aki.sh
aki-web: ; $("SHELL") ./scripts/aki-web.sh
aki-web-dev: ; $("SHELL") ./scripts/aki-web-dev.sh

stop: stop-aki stop-web

stop-aki:
	docker stop aki

stop-web:
	docker stop aki-web

stop-nginx:
	docker stop aki_nginx

pg-create:
	docker exec -it aki_postgres sh -c "apk add python3 && python3 /usr/bin/create_databases.py"

nginx:
	docker-compose up -d aki_nginx

pg:
	docker-compose up -d aki_postgres