#!/bin/bash
docker run -it --rm -e DISPLAY=$DISPLAY --mount type=bind,source="/home/lmentaschi/",target="/home/lmentaschi/" -v /tmp/.X11-unix/:/tmp/.X11-unix/  -u lmentaschi --workdir=/home/lmentaschi --name=qgis3  qgis3img bash -c "export LANG=C.UTF-8; locale -a; qgis"
#docker run -it --rm -e DISPLAY=$DISPLAY --mount type=bind,source="/home/lmentaschi/",target="/home/lmentaschi/" -v /tmp/.X11-unix/:/tmp/.X11-unix/  -u lmentaschi --workdir=/home/lmentaschi --name=qgis3cntnr  qgis3img /bin/bash
