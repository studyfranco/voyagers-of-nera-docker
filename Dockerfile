FROM cm2network/steamcmd:root

LABEL maintainer="studyfranco@hotmail.fr"

RUN set -x \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y gosu pigz wine64 wine --no-install-recommends\
    && rm -rf /var/lib/apt/lists/*  \
    && rm -rf /var/log/* \
    && gosu nobody true

RUN mkdir -p /config \
    && chown steam:steam /config

COPY --chmod=700 init.sh /

COPY --chown=steam:steam --chmod=700 *.ini run.sh /home/steam/

WORKDIR /config

ENV SERVER_NAME="VoyagersOfNeraServerByMe" \
    SERVER_PORT=18211 \
    SERVER_QUERY_PORT=27015 \
    RCON_PORT=25575 \
    RCON_PASSWORD="password" \
    STEAMAPPID=3937860 \
    MAXPLAYERS=32 \
    SERVERPASSWORD="password" \
    SERVERADMINPASSWORD="password" \
    PUID=2198 \
    PGID=2198 \
    GAMEBASECONFIGDIR="/config/gamefiles/VoyagersOfNera/Saved/Config" \
    GAMECONFIGDIR="/config/gamefiles/VoyagersOfNera/Saved/Config/LinuxServer" \
    GAMESAVESDIR="/config/gamefiles/VoyagersOfNera/Saved/SaveGames" \
    SKIPUPDATE="false"


ENTRYPOINT [ "/init.sh" ]