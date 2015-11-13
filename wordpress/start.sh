#!/bin/bash

docker-compose -f wordpress.yml up -d mysql
docker-compose -f wordpress.yml up -d wordpress_1
docker-compose -f wordpress.yml up -d wordpress_2

WP1=`sudo docker inspect -f '{{ .NetworkSettings.IPAddress }}' wordpress_1`
WP2=`sudo docker inspect -f '{{ .NetworkSettings.IPAddress }}' wordpress_2`

cat template.conf | sed -e "s/\${WORDPRESS_1_IP}/$WP1/" | sed -e "s/\${WORDPRESS_2_IP}/$WP2/" > default.conf

docker-compose -f wordpress.yml up -d nginx

