FROM debian:stretch

RUN apt-get update && apt-get install -y apt-mirror
ADD mirror.list /etc/apt/mirror.list

VOLUME /var/spool/apt-mirror

CMD /usr/bin/apt-mirror 2>&1
