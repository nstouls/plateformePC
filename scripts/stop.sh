#!/bin/bash

# Stopping web server
killall java

# Stopping mongoDB
docker stop -t 2 plateformeDB


