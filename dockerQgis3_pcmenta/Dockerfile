FROM ubuntu:18.04

ARG USER
ARG USERID

RUN echo "building for user/userid "$USER"/"$USERID
RUN useradd -M -u $USERID $USER

RUN apt-get update
RUN apt-get install -y software-properties-common apt-utils

# adding qgis3 repo
RUN add-apt-repository ppa:ubuntugis/ppa

RUN apt-get update && apt-get -y upgrade

# installing, non interactive
RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install qgis python3-qgis qgis-plugin-grass

CMD ["sleep", "infinity"]
