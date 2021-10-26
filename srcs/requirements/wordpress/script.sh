#!/bin/sh

docker system prune -a --force
docker build -t wordpress_service .
docker images
