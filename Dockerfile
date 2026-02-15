FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    lib32gcc-s1 \
    lib32stdc++6 \
    locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG=en_US.utf8

RUN useradd -m -d /home/steam -s /bin/bash steam

USER steam
WORKDIR /home/steam

RUN mkdir -p /home/steam/steamcmd && \
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - -C /home/steam/steamcmd

ENV PATH="/home/steam/steamcmd:${PATH}"

WORKDIR /home/steam/server

COPY --chown=steam:steam init.sh /init.sh
COPY --chown=steam:steam run.sh /run.sh
RUN chmod +x /init.sh /run.sh

EXPOSE 7777/udp

ENTRYPOINT ["/run.sh"]
