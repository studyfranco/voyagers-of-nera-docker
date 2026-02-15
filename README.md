# Voyagers of Nera - Docker Dedicated Server

Docker container for running a **Voyagers of Nera** dedicated server.
Based on the structure of [palworld-docker](https://github.com/studyfranco/palworld-docker).

## Requirements

- Docker
- Docker Compose

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/studyfranco/voyagers-of-nera-docker.git
   cd voyagers-of-nera-docker
   ```

2. Start the server:
   ```bash
   docker compose up -d
   ```

3. The server will automatically download the game files (AppID: 3937860) on the first run. This may take some time depending on your internet connection. Check the logs with:
   ```bash
   docker compose logs -f
   ```

## Configuration

The server configuration is handled via environment variables in `docker-compose.yml`.

| Variable | Default | Description |
|----------|---------|-------------|
| `SERVER_PORT` | `7777` | UDP Port for the server |
| `AUTO_UPDATE` | `true` | Update server on container start |

### Ports

- **UDP 7777**: Main game port.

## Volumes

- `./game`: Stores the game server files and save data.

## Troubleshooting

If the server fails to start, check the logs for SteamCMD errors or missing dependencies. Ensure the mapped volume has correct permissions (runs as UID 1000).

## Last Update
2026-02-15
