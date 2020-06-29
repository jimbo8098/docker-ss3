FROM ubuntu:xenial

RUN \
  apt-get -y update && \
  apt-get -y install wget lib32gcc1 && \
  apt-get clean && \
  find /var/lib/apt/lists -type f | xargs rm -vf

RUN useradd -m steam

WORKDIR /home/steam
USER steam

ADD ss3functions.sh ss3functions.sh
ADD main main

ENTRYPOINT ["/bin/bash", "main"]
