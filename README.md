kylerw/material-usenet-dashboard


Usage

docker create \ 
  --name=mud \
  -v /etc/localtime:/etc/localtime:ro \
  -v <path to data>:/config \
  -v <path to storage devices>:/storage:ro \
  -e PGID=<gid> -e PUID=<uid>  \
  -p 3000:3000 \
  kylerw/material-usenet-dashboard
Parameters

-p 3000 - Port for webui
-v /etc/localtime for timesync - optional
-v /config Containes plexpy config and database
-v /mnt/user Map this directory with storage devices
-e PGID for for GroupID - see below for explanation
-e PUID for for UserID - see below for explanation
It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do docker exec -it plexpy /bin/bash.

User / Group Identifiers

TL;DR - The PGID and PUID values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own PUID and PGID. This avoids nasty permissions errors with relation to data volumes (-v flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

Updates

Upgrade to the latest version simply docker restart mud.
To monitor the logs of the container in realtime docker logs -f mud.

Versions
22.12.2015: Inital Release