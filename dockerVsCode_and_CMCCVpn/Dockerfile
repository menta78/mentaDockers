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
    && apt-get -y install --allow-unauthenticated \
    wget curl socat vim iputils-ping git rsync \
    libevent-2.1-7 \
    libevent-openssl-2.1-7 \
    libevent-pthreads-2.1-7 \
    libexpat1 \
    libnl-3-200 \
    libnl-route-3-200 \
    iproute2 net-tools

RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb \
    && dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb \
    && rm libssl1.1_1.1.1f-1ubuntu2_amd64.deb

RUN apt-get -y install --allow-unauthenticated --no-install-recommends openssh-client sudo
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN printf '#!/bin/bash\necho "$@" >> /tmp/resolvectl.log\n' > /usr/bin/resolvectl \
    && chmod +x /usr/bin/resolvectl

COPY forcepoint-client_2.5.2+jammy_amd64.deb /tmp/
RUN dpkg -i /tmp/forcepoint-client_2.5.2+jammy_amd64.deb

RUN wget --no-check-certificate -O /etc/apt/trusted.gpg.d/vscode.gpg "https://packages.microsoft.com/keys/microsoft.asc" \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list \
    && apt-get update -o Acquire::Check-Valid-Until=false --allow-insecure-repositories \
    && apt-get -y install --allow-unauthenticated code

RUN apt-get -y install --allow-unauthenticated firefox

CMD socat TCP-LISTEN:2222,reuseaddr,fork EXEC:/bin/bash,pty,stderr,setsid,sigint,sane,ctty
