#!/bin/sh
git clone git@github.com:alpoprosi/aki.git ./repos/aki
make -C ./repos/aki build

docker run --rm -e PG_DSN="postgres://user:password@postgres/aki?sslmode=disable" --network=aki_network --name aki -d aki:latest

rm -rf ./repos/aki