#!/bin/sh

docker build -t mariadb ./srcs/requirements/mariadb/
docker build -t wordpress ./srcs/requirements/wordpress
docker build -t nginx ./srcs/requirements/nginx/
