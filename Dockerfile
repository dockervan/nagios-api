FROM python:2.7

RUN pip install nagios-api \
diesel greenlet

RUN mkdir -p /opt/nagios/var && touch /opt/nagios/var/status.dat

EXPOSE 8080

CMD ["nagios-api", "-p", "8080", "-s", "/opt/nagios/var/status.dat"]
