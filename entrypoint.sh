#!/bin/sh

mkdir -p /config

# create a new config file if none found
if [ ! -f /config/config.yml ]; then
  cp example_config.yml /config/config.yml
  echo "config.yml created. edit the file and fill in your client values before running again."
  exit 1
fi

# run script once
spotify-to-tidal

# pass off to cmd
exec "$@"
