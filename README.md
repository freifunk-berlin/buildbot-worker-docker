# buildbot slave Dockerfile for the Freifunk Firmware

You can add your server easily as a buildbot slave in order to help us build the [Freifunk firmware](https://github.com/freifunk-berlin/firmware). Please write a mail to the [mailing list](http://lists.berlin.freifunk.net/cgi-bin/mailman/listinfo/berlin) and ask for a password (please include a name for the host).

## Setup
```
[sudo] docker pull freifunkberlin/buildbot-slave
[sudo] docker run -d -e HOST=host -e PASS=pass -e ADMIN="Your Name <your@mail>" \
  --name=buildbot freifunkberlin/buildbot-slave
```
## Start
```
[sudo] docker start buildbot
```

## Stop
```
[sudo] docker stop buildbot
```
