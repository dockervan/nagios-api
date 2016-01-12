#!/usr/bin/env sh
set -e

packages='gcc libc6-dev libffi-dev libssl-dev'

apt-get update
apt-get install --yes ${packages}
rm --recursive --force /var/lib/apt/lists/*

pip install nagios-api \
    diesel greenlet

apt-get remove --purge --yes ${packages}
apt-get autoremove --yes
