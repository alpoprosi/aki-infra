#!/bin/sh

cmd=`make --no-print-directory -C ./repos/aki version`

git clone git@github.com:alpoprosi/aki.git ./repos/aki
make -C ./repos/aki build

docker run -e PG_DSN="postgres://user:password@postgres/aki?sslmode=disable" --network=aki_network -d aki:latest

rm -rf ./repos/aki