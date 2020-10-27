#!/bin/bash
USER=$(whoami)
USERID=$(id -u $USER)
echo "building for user "$USER", user id "$USERID
docker build -t eveonlineimg --build-arg USER=$USER --build-arg USERID=$USERID .
