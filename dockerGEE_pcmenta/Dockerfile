FROM ubuntu:18.04

RUN useradd -M -u 1000 lmentaschi

# THIS WORKS INSIDE THE JRC
#RUN echo nameserver 10.191.240.1 > /etc/resolv.conf && apt-get update && apt-get -y upgrade && apt-get -y install python3 python3-pip git
#RUN echo nameserver 10.191.240.1 > /etc/resolv.conf && pip3 install earthengine-api

# THIS WORKS OUTSIDE THE JRC
RUN apt-get update && apt-get -y upgrade && apt-get -y install python3 python3-pip
RUN pip3 install earthengine-api
RUN pip3 install numpy

RUN rm -rf /root/.cache && apt-get clean all 

CMD ["sleep", "infinity"]
