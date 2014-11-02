buildbot-slave-docker
=====================

Dockerfile for freifunk buildbots
```
[sudo] docker pull freifunkberlin/buildbot-slave
[sudo] docker run -d -e HOST=host -e PASS=pass -e ADMIN="Your Name <your@mail>" \
  --name=buildbot freifunkberlin/buildbot-slave
```
