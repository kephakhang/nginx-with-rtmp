#!/usr/bin/bash


docker stack ps vod-server

docker service logs vod-server_vod-server

ffmpeg -i rtmp://127.0.0.1:1935/live/stream

