#!/bin/sh
git clone git@github.com:alpoprosi/aki-web.git ./repos/aki-web
make -C ./repos/aki-web build

docker run --rm -d --network=aki_network --name aki-web aki-web:latest

rm -rf ./repos/aki-web
