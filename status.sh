#!/usr/bin/bash


docker stack ps vod-server

docker service logs vod-server_vod-server

ffmpeg -i rtmp://localhost:1935/live/stream

