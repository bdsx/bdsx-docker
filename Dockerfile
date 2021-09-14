FROM alpine
EXPOSE 19132/udp

RUN apk update
RUN apk add freetype git nodejs npm wine gnutls ncurses-libs xvfb

WORKDIR /root
RUN mkdir bdsx
WORKDIR /root/bdsx
RUN git init
RUN git config pull.ff only
RUN git remote add upstream https://github.com/bdsx/bdsx.git

COPY ./entrypoint.sh /root/entrypoint.sh
ENTRYPOINT /root/entrypoint.sh
