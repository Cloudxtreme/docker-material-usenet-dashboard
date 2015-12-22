#!/bin/bash

[[ ! -f /config/config.json ]] && cp /app/mud/new.config.json /config/config.json

chown -R abc:abc /config