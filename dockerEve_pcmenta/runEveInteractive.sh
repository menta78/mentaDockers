#!/bin/bash
EHOME=$HOME/workspace/docker_eve/
xhost +
#docker run -it --rm -e DISPLAY=$DISPLAY --device=/dev/dri --mount type=bind,source="$EHOME",target="$HOME" -v /tmp/.X11-unix/:/tmp/.X11-unix/  -u $USER --workdir=$HOME --env="APP=glxgears" --privileged  --name=eve  eveonlineimg bash
docker run -it --rm -e DISPLAY=$DISPLAY --device=/dev/dri:/dev/dri -v /tmp/.X11-unix/:/tmp/.X11-unix/ --mount type=bind,source="$EHOME",target="$HOME"  -u $USER --workdir=$HOME  --name=eve  eveonlineimg bash
