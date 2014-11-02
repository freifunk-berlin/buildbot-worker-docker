#!/bin/bash

rm -rf $BASEDIR
mkdir $BASEDIR
buildslave create-slave -f --umask=022 $BASEDIR \
  firmware.berlin.freifunk.net:9989 $HOST $PASS
echo "$ADMIN" > $BASEDIR/info/admin

function shutdown {
    echo "shutting down..."
    buildslave stop $BASEDIR
}

trap shutdown TERM SIGHUP EXIT

buildslave start --nodaemon $BASEDIR &
echo "buildslave started."
wait
