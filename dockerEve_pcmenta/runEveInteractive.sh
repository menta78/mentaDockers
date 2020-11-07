#!/bin/bash
EHOME=$HOME/workspace/docker_eve/
xhost +
# the param --shm-size=256m increases the shared memory size to 256m (64m is the default), to avoid strange crashes of the launcher
docker run -it --rm -e DISPLAY=$DISPLAY --device=/dev/dri:/dev/dri -v /tmp/.X11-unix/:/tmp/.X11-unix/ --mount type=bind,source="$EHOME",target="$HOME"  -u $USER --workdir=$HOME  --name=eve --shm-size=256m  eveonlineimg bash
