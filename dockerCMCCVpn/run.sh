#!/bin/bash
xhost +local:docker
docker stop fcpvpn 2>/dev/null
docker rm fcpvpn 2>/dev/null
docker run -d \
  --privileged \
  --device=/dev/net/tun \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME:$HOME \
  -u lmentaschi \
  --workdir=$HOME \
  --name=fcpvpn \
  -p 2222:2222 \
  -p 2223:22 \
  fcpvpn_pcmenta
