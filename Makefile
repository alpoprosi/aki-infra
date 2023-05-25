up: create-net pg aki aki-web nginx

create-net:
	docker network create aki_network || echo '' > /dev/null

down: stop
	docker stop nginx postgres

update: stop aki aki-web

update-aki: stop-aki aki
update-web: stop-web aki-web

aki: ; $("SHELL") PG_DSN=$(PGDSN) ./scripts/aki.sh
aki-web: ; $("SHELL") ./scripts/aki-web.sh

stop: stop-aki stop-web

stop-aki:
	docker stop aki

stop-web:
	docker stop aki-web

pg-create:
	docker exec -it slr_postgres sh -c "apk add python3 && python3 /usr/bin/create_databases.py"

nginx:
	docker-compose up -d nginx

pg:
	docker-compose up -d postgres