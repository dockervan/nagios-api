FROM python:2-slim

MAINTAINER Sullivan SENECHAL <soullivaneuh@gmail.com>

ADD build.sh /

RUN sh build.sh

RUN mkdir -p /opt/nagios/var && touch /opt/nagios/var/status.dat

EXPOSE 8080

CMD ["nagios-api", "-p", "8080", "-s", "/opt/nagios/var/status.dat"]
