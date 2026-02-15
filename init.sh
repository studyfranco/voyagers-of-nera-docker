#!/bin/bash
set -e

APP_ID=3937860
INSTALL_DIR="/home/steam/server"

echo "--- Checking for updates (AppID: $APP_ID) ---"
/home/steam/steamcmd/steamcmd.sh +force_install_dir "$INSTALL_DIR" +login anonymous +app_update "$APP_ID" validate +quit
echo "--- Update check complete ---"
