FROM biseque/steamcmd
MAINTAINER https://github.com/dtandersen/stationeers-egg

ENV  USER container
ENV  HOME /home/container
ENV  BETA public

RUN apt-get update && \
  apt-get install pwgen -y && \
  mkdir -p $HOME && \
#  /steamcmd/steamcmd.sh +login anonymous +force_install_dir $HOME +app_update 600760 -beta $BETA +quit && \
#  find $HOME -name ".svn" -type d -depth -exec rm -r "{}" \; && \
  mkdir -p /root/.config/unity3d/Rocketwerkz/rocketstation && \
  ln -s $HOME/log/Player.log /root/.config/unity3d/Rocketwerkz/rocketstation/Player.log && \
  adduser --disabled-password --home /home/container --no-create-home --gecos "" container && \
  chown -R container:container $HOME && \
  chown -R container:container /steamcmd

USER container

WORKDIR $HOME

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
