#!/bin/bash
docker run -it --rm -e DISPLAY=$DISPLAY --mount type=bind,source="$HOME",target="$HOME" -v /tmp/.X11-unix/:/tmp/.X11-unix/  -u $USER --workdir=$HOME --name=qgis3  qgis3img bash -c "export LANG=C.UTF-8; locale -a; qgis"
