#!/bin/sh

docker system prune -a --force
docker build -t nginx_service .
docker images
