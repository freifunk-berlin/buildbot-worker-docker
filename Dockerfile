FROM ubuntu:14.04.1

MAINTAINER André Gaul <andre@gaul.io>

RUN apt-get update && \
  apt-get install -y python python-dev python-pip && \
  pip install buildbot-slave

RUN useradd -m freifunk
USER freifunk

ENV BASEDIR /home/freifunk/buildbot-slave
ADD ./buildbot-slave.sh /usr/local/bin/

CMD buildbot-slave.sh
