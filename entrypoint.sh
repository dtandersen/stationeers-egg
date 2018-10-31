#!/bin/bash -x
set -e

mkdir -p $HOME/log

if [ ! -f $HOME/default.ini ]; then
  cp $HOME/rocketstation_DedicatedServer_Data/StreamingAssets/default.ini $HOME
  # change default password
  sed -i s/RCONPASSWORD=stationeers/RCONPASSWORD=$(pwgen 15 1)/g $HOME/default.ini
fi

exec ./rocketstation_DedicatedServer.x86_64 \
  -batchmode -nographics -autostart \
  "$@"
