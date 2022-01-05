FROM ubuntu:impish
VOLUME /root/bdsx
EXPOSE 19132/udp

RUN apt-get update
RUN apt-get install -y wget gnupg2 software-properties-common
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key
RUN apt-key add winehq.key
RUN dpkg --add-architecture i386 
RUN add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ impish main'
RUN apt-get install -y --install-recommends winehq-stable
RUN apt-get install -y git nodejs npm xvfb
RUN wine cmd /c

WORKDIR /root
RUN mkdir bdsx
WORKDIR /root/bdsx
RUN git init
RUN git config pull.ff only
RUN git remote add upstream https://github.com/bdsx/bdsx.git

COPY ./entrypoint.sh /root/entrypoint.sh
ENTRYPOINT /root/entrypoint.sh
