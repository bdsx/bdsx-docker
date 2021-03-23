FROM alpine
EXPOSE 19132/udp
COPY ./entrypoint.sh /root/entrypoint.sh

RUN apk update
RUN apk add freetype git nodejs npm wine gnutls ncurses-libs

WORKDIR /root
RUN mkdir bdsx
WORKDIR /root/bdsx
RUN git init
RUN git config pull.ff only
RUN git remote add upstream https://github.com/bdsx/bdsx.git

ENTRYPOINT /root/entrypoint.sh
