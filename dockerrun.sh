#!/usr/bin/bash

# run as daemon
#docker run -d -p 8000:80  -p 8443:443 -p 8935:1935 nginx-rtmp:1.0.0


docker run -p 8000:80  -p 8443:443 -p 8935:1935 nginx-rtmp:1.0.0