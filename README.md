# webshop-eb

## Overview

This repository contains a Docker-based setup for running the webshop (PrestaShop) locally using Docker Compose. The instructions below show how to build and run the services using Docker Compose. 

## Requirements

- Docker 
- Docker Compose v2
- Git

## Quick Start

1. Clone the repository:

    ```git clone```

2. Change into the docker-compose directory:

	```cd docker-compose```

3. Build the images and start the services in detached mode:

    ```docker compose up --build```

    This command will build any images (if needed) and start all services defined in `docker-compose/docker-compose.yml`.


## Common Commands

- Start (attach to terminal):

	```docker compose up```

- Start in background (detached):

	```docker compose up -d```

- Rebuild images and restart:

	```docker compose up --build```

- View running services:

	```docker compose ps```



## Access and Ports

The stack exposes two main web entry points by default (check `docker-compose/docker-compose.yml` for exact mappings):

- phpMyAdmin: http://localhost:8081
- PrestaShop frontend: http://localhost:8080

