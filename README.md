# buildbot worker Dockerfile for the Freifunk Firmware

You can add your server easily as a buildbot worker in order to help us build the [Freifunk firmware](https://github.com/Freifunk-Spalter). Please write a mail to the [mailing list](http://lists.berlin.freifunk.net/cgi-bin/mailman/listinfo/berlin) and ask for a password (please include a name for the host).

## Setup
Currently (Jan 2020) we do not provide the image on dockerhub. Please build the image by yourself. See below, how to do that.
```
[sudo] docker pull freifunkberlin/buildbot-worker
[sudo] docker run -d -e HOST=host -e PASS=pass -e ADMIN="Your Name <your@mail>" \
  -e HOSTINFO="Your Machine Specs"
  --name=buildbot freifunkberlin/buildbot-worker
```
For HOSTINFO, please give some scpecs of your machine. It's important to us to knowing how much memory there is avaiable for building. This influences, which build-jobs we can drive on your worker.

## Start
```
[sudo] docker start buildbot
```

## Stop
```
[sudo] docker stop buildbot
```

## Build Dockerimage from Scratch
```
[sudo] docker build -t freifunk-buildbot-worker .
[sudo] docker run -d -e HOST=host -e PASS=pass -e ADMIN="Your Name <your@mail>" \
  -e HOSTINFO="Your Machine Specs"
  --name=buildbot freifunk-buildbot-worker
```

