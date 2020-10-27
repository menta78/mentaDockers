# this docker has opengl support. 
# It is not portable, and only works on a ubuntu 16.04 host.
# It should be adapted to the host's version of ubuntu
FROM ubuntu:16.04

ARG USER
ARG USERID

RUN echo "building for user/userid "$USER"/"$USERID
RUN useradd -M -u $USERID $USER; usermod -a -G video $USER

RUN apt update
RUN apt install -y software-properties-common apt-utils
RUN apt -y --force-yes install x-window-system
RUN apt install -y libgl1-mesa-dri libgl1-mesa-dev libgl1-mesa-glx mesa-utils
RUN apt install -y libnss3-tools firefox
RUN apt update; apt-get install -y wine64-development wine64-development-preloader wine64-development-tools libldap-2.4-2 libssl-dev wget
RUN apt install -y libxslt1.1 libxslt1-dev 

RUN mkdir -p /opt/eve/ 
RUN cd /opt/eve; wget https://binaries.eveonline.com/evelauncher-1747682.tar.gz; tar xvf evelauncher-1747682.tar.gz; rm evelauncher-1747682.tar.gz; 
RUN cd /opt/eve/evelauncher; chmod a+x evelauncher.sh

RUN rm -rf /root/.cache && apt-get clean all 

CMD ["sleep", "infinity"]
