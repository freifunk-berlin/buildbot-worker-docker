FROM ubuntu:20.04

LABEL maintainer="berlin@berlin.freifunk.net"

# Do not prompt for anything while building the image
# https://github.com/phusion/baseimage-docker/issues/319#issuecomment-272568689
ENV DEBIAN_FRONTEND noninteractive

# fix error-prompt: "debconf: delaying package configuration, since apt-utils is not installed"
# https://github.com/phusion/baseimage-docker/issues/319#issuecomment-245857919
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt update && \
  apt install -y python3 python3-dev python3-pip curl rsync sqlite3 && \
  pip3 install buildbot-worker

# TODO: move openwrt dependencies in its own docker container
RUN apt install -y git subversion build-essential libncurses5-dev zlib1g-dev gawk \
  unzip libxml-perl flex wget gawk libncurses5-dev gettext quilt python

RUN useradd -m freifunk
USER freifunk

ENV BASEDIR /home/freifunk/buildbot-worker
ADD ./buildbot-worker.sh /usr/local/bin/

CMD buildbot-worker.sh

# reverse first command for production
ENV DEBIAN_FRONTEND teletype
