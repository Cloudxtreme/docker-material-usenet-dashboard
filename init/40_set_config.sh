#!/bin/bash

[[ ! -f /config/config.json ]] && cp /app/mud/new.config.json /config/config.json

ln -s /config/config.json /app/mud/
chown -R abc:abc /config