FROM debian:buster
RUN apt-get update
RUN apt-get install tor polipo -y --no-install-recommends && apt-get clean

COPY polipo.conf /etc/polipo/config
COPY tor.conf /etc/tor/torrc
RUN chown debian-tor /etc/tor/torrc
COPY entrypoint.sh /entrypoint.sh

EXPOSE 5090
EXPOSE 8123

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]