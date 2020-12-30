#!/bin/bash

rm -rf $BASEDIR
mkdir $BASEDIR
buildbot-worker create-worker -f --umask=0o22 $BASEDIR \
  buildbot.berlin.freifunk.net:9989 $HOST $PASS
echo "$ADMIN" > $BASEDIR/info/admin
echo "$HOSTINFO" > $BASEDIR/info/host

function shutdown {
    echo "shutting down..."
    buildbot-worker stop $BASEDIR
}

trap shutdown TERM SIGHUP EXIT

buildbot-worker start --nodaemon $BASEDIR &
echo "buildbot-worker started."
wait
