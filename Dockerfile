FROM biseque/steamcmd
MAINTAINER https://github.com/dtandersen/stationeers-egg

USER container
ENV  USER container
ENV  HOME /home/container
ENV  BETA public

RUN apt-get update && \
  apt-get install pwgen -y && \
  /steamcmd/steamcmd.sh +login anonymous +force_install_dir $HOME +app_update 600760 -beta $BETA +quit && \
  find $HOME -name ".svn" -type d -depth -exec rm -r "{}" \; && \
  mkdir -p /root/.config/unity3d/Rocketwerkz/rocketstation && \
  ln -s $HOME/log/Player.log /root/.config/unity3d/Rocketwerkz/rocketstation/Player.log && \
  adduser -D -h /home/container container

WORKDIR $HOME

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
