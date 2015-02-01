## -*- docker-image-name: "mbrgm/znc" -*-

FROM debian:wheezy

RUN apt-get update \
    && apt-get install -y sudo
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y znc \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -r -m -s /usr/sbin/nologin znc

ADD ./assets/init /app/init
RUN chown znc /app/init \
    && chmod u+x /app/init


EXPOSE 7000

VOLUME ["/data"]

ENTRYPOINT ["/app/init"]
