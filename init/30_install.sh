#!/bin/bash

if [ ! -d /app/ogar/.git ]; then
	/sbin/setuser abc git clone git://github.com/calvinbui/Material-Usenet-Dashboard.git /app/mud
	cd /app/mud
	/sbin/setuser abc npm install ws
fi