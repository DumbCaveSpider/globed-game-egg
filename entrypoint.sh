#!/bin/bash
sleep 2
export HOME=/home/container
cd /home/container

uname -m
# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`
curl -Lo ./globed-game-server-x64 https://github.com/dankmeme01/globed2/releases/download/v${VERSION}/globed-game-server-x64
chmod +x ./globed-game-server-x64

# Run the Server
./{{GLOBED_FILE}} {{IP_ADDRESS}}:{{IP_PORT}} {{CENTRAL_ADDRESS}} {{PASSWORD}}
