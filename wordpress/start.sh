#!/bin/bash

docker-compose up -d mysql
docker-compose up -d wordpress_1
docker-compose up -d wordpress_2

WP1=`sudo docker inspect -f '{{ .NetworkSettings.IPAddress }}' wordpress_1`
WP2=`sudo docker inspect -f '{{ .NetworkSettings.IPAddress }}' wordpress_2`

cat template.conf | sed -e "s/\${WORDPRESS_1_IP}/$WP1/" | sed -e "s/\${WORDPRESS_2_IP}/$WP2/" > default.conf

docker-compose up -d nginx

