FROM ubuntu:14.04.1

MAINTAINER André Gaul <andre@gaul.io>

RUN apt-get update && \
  apt-get install -y python python-dev python-pip && \
  pip install buildbot-slave

# TODO: move openwrt dependencies in its own docker container
RUN apt-get install -y git subversion build-essential libncurses5-dev zlib1g-dev gawk \
  unzip libxml-perl flex wget gawk libncurses5-dev gettext quilt python

RUN useradd -m freifunk
USER freifunk

ENV BASEDIR /home/freifunk/buildbot-slave
ADD ./buildbot-slave.sh /usr/local/bin/

CMD buildbot-slave.sh
