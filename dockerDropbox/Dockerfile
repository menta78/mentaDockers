FROM ubuntu:22.04
ARG USER
ARG USERID

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "building for user/userid "$USER"/"$USERID
RUN useradd -M -u $USERID $USER

RUN echo 'Acquire::AllowInsecureRepositories "true";' > /etc/apt/apt.conf.d/99insecure \
    && echo 'Acquire::AllowDowngradeToInsecureRepositories "true";' >> /etc/apt/apt.conf.d/99insecure

RUN mkdir -p /var/lib/ucf/cache && touch /var/lib/ucf/hashfile

RUN rm -f /etc/apt/apt.conf.d/docker-clean \
    && apt-get update -o Acquire::Check-Valid-Until=false --allow-insecure-repositories \
    && apt-get -y install --allow-unauthenticated --no-install-recommends \
    wget curl python3 gnupg ca-certificates python3-gpg

RUN echo "deb http://linux.dropbox.com/ubuntu jammy main" > /etc/apt/sources.list.d/dropbox.list \
    && wget --no-check-certificate -O /etc/apt/trusted.gpg.d/dropbox.gpg "https://linux.dropbox.com/fedora/rpm-public-key.asc" \
    && apt-get update -o Acquire::Check-Valid-Until=false --allow-insecure-repositories \
    && apt-get -y install --allow-unauthenticated dropbox

CMD sleep infinity
