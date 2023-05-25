up: pg nginx aki aki-web

update: stop aki aki-web

update-aki: stop-aki aki
update-web: stop-web aki-web

aki: ; $("SHELL") ./scripts/aki.sh
aki-web: ; $("SHELL") ./scripts/aki-web.sh

stop: stop-aki stop-web

stop-aki:
	docker stop aki

stop-aki:
	docker stop aki-web

pg-create:
	docker exec -it slr_postgres sh -c "apk add python3 && python3 /usr/bin/create_databases.py"

nginx:
	docker-compose up nginx

pg:
	docker-compose up postgres