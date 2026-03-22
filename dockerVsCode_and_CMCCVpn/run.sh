#!/bin/bash
xhost +local:docker
docker stop vscode 2>/dev/null
docker rm vscode 2>/dev/null
docker run -d \
  --privileged \
  --shm-size=512m \
  --device=/dev/net/tun \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME:$HOME \
  -u lmentaschi \
  --workdir=$HOME \
  --name=vscode \
  -p 2222:2222 \
  -p 2223:22 \
  vscode_pcmenta
