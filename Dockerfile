FROM docker-registry.dev.cybozu.xyz:443/debian:jessie
MAINTAINER Akky AKIMOTO <akimoto@gmail.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y git php5-cli php5-curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
ADD https://github.com/spress/Spress/releases/download/v2.1.3/spress.phar /usr/local/bin/spress
RUN chmod 555 /usr/local/bin/spress

VOLUME /data
WORKDIR /data
# Spress' default port
EXPOSE 4000

ENTRYPOINT ["spress"]

