#!/bin/bash

## Repair MongoDB
docker run --rm --volumes-from plateformeDB descol/rpi-mongo unlink "/mongodb/data/mongod.lock"
docker run --rm -it -p 27017:27017 --volumes-from plateformeDB descol/rpi-mongo mongod --dbpath /mongodb/data/ --repair

# Launching platform web server
cd /home/pi/plateformePC/
java -jar /home/pi/plateformePC/build/libs/Plateforme-fat.jar &

# Starting MongoDB
docker start -a plateformeDB # -a to forward stdin/out. See : https://toub.es/2017/08/08/how-to-start-a-docker-container-at-boot-time/
