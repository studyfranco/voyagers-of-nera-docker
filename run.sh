#!/bin/bash
set -e

# Run update if AUTO_UPDATE is true
if [ "${AUTO_UPDATE}" = "true" ]; then
    /init.sh
fi

cd /home/steam/server

# Attempt to locate the server executable
# Common pattern for UE5 Linux servers: [ProjectName]/Binaries/Linux/[ProjectName]Server-Linux-Shipping
# We look for "BoatGame" as that is the internal project name
SERVER_BIN=$(find . -name "BoatGameServer-Linux-Shipping" -type f -print -quit)

if [ -z "$SERVER_BIN" ]; then
    # Fallback search for any likely executable if specific one isn't found
    SERVER_BIN=$(find . -type f -name "*Server-Linux-Shipping" -print -quit)
fi

if [ -z "$SERVER_BIN" ]; then
    echo "Error: Server executable not found in /home/steam/server"
    echo "Contents of server directory:"
    ls -R
    exit 1
fi

chmod +x "$SERVER_BIN"

echo "--- Starting Voyagers of Nera Server ---"
echo "Executable: $SERVER_BIN"

# Default arguments
ARGS="-log -port=${SERVER_PORT:-7777}"

# Append any custom arguments passed to the container
exec "$SERVER_BIN" $ARGS "$@"
