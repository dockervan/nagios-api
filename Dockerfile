FROM python:2-slim

MAINTAINER Sullivan SENECHAL <soullivaneuh@gmail.com>

ARG packages='gcc libc6-dev libffi-dev libssl-dev'

RUN apt-get update && apt-get install --yes --no-install-recommends $packages \
&& rm -rf /var/lib/apt/lists/* \
&& pip install nagios-api \
diesel greenlet \
&& apt-get remove --yes --purge $packages \
&& apt-get autoremove --yes

RUN mkdir -p /opt/nagios/var && touch /opt/nagios/var/status.dat

EXPOSE 8080

CMD ["nagios-api", "-p", "8080", "-s", "/opt/nagios/var/status.dat"]
