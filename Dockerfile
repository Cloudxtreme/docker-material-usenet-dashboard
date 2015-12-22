FROM linuxserver/baseimage
MAINTAINER kylerw <kylerw@gmail.com>


ENV APTLIST="git python g++ nodejs"

# install packages
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - && \
apt-get install $APTLIST -qy && \

# clean up 
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# Adding Custom files
#ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh && \

# give abc user a home folder
usermod -d /app abc

# ports and volumes
VOLUME /config /storage
EXPOSE 3000