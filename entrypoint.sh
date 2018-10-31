#!/bin/bash -x
set -e

mkdir -p $HOME/log

if [ ! -f $HOME/default.ini ]; then
  cp $HOME/rocketstation_DedicatedServer_Data/StreamingAssets/default.ini $HOME
  # change default password
  sed -i s/RCONPASSWORD=stationeers/RCONPASSWORD=$(pwgen 15 1)/g $HOME/default.ini
fi


MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
exec ${MODIFIED_STARTUP}

#./rocketstation_DedicatedServer.x86_64 \
#  -batchmode -nographics -autostart \
#  "$@"
