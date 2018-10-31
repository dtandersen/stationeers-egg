FROM debian:latest
MAINTAINER https://github.com/dtandersen/stationeers-egg

ENV  USER container
ENV  HOME /home/container
ENV  BETA public

RUN apt-get update && \
  apt-get install pwgen wget lib32gcc1 -y && \
  mkdir -p $HOME && \
  adduser --disabled-password --home /home/container --no-create-home --gecos "" container && \
  chown -R container:container $HOME

USER container

WORKDIR $HOME

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
