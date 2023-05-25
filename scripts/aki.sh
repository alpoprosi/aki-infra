#!bin/sh
git clone git@github.com:alpoprosi/aki.git ./repos/
make -C ./aki build
docker run aki
