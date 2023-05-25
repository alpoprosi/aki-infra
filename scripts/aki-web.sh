#!/bin/sh

cmd=$(make --no-print-directory -C ./repos/aki-web version)

git clone git@github.com:alpoprosi/aki-web.git ./repos/aki-web
make -C ./repos/aki-web build

docker run --network=my-net aki-web:latest

rm -rf ./repos/aki-web
