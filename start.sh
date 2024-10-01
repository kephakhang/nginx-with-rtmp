#!/usr/bin/bash

# docker swarm init --advertise-addr 172.18.0.1 

docker stack deploy -c docker-compose.yml vod-server

docker stack ps vod-server