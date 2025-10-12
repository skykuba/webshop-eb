# webshop-eb

## Overview

This repository contains a Docker-based setup for running PrestaShop locally using Docker Compose. The setup includes:
- **PrestaShop 1.7.8.10** (PHP-FPM)
- **MySQL 5.7** database
- **NGINX** web server with SSL support
- **phpMyAdmin** for database management

## Requirements

- Docker 
- Docker Compose v2
- Git

## Project Structure

```
docker-compose/
├── docker-compose.yml          # Base configuration (MySQL, PrestaShop, phpMyAdmin)
├── docker-compose.dev.yml      # Development configuration (NGINX)
├── docker_run.sh               # PrestaShop installation script
├── gen-cert.sh					# For SSL
├── prestashop/
│   └── Dockerfile              # Custom PrestaShop image
├── nginx/
│   ├── dev.conf                # NGINX configuration
│   └── ssl/                    # SSL certificates
├── modules/
│   └── testModule/             # Custom PrestaShop modules
└── themes/
    └── myTheme/                # Custom PrestaShop themes
```

## Quick Start

1. **Clone the repository:**
   ```bash
   git clone git@github.com:skykuba/webshop-eb.git
   cd webshop-eb
   ```

2. **Change into the docker-compose directory:**
   ```bash
   cd docker-compose
   ```

3. **Generate SSL certificates (first time only):**
   ```bash
   ./gen-cert.sh
   ```

4. **Build and start all services in dev mode:**
   ```bash
   docker compose --env-file ../.env.dev -f docker-compose.yml -f docker-compose.dev.yml up --build
   ```

   This command will:
   - Build the PrestaShop Docker image with MySQL client
   - Wait for MySQL
   - Auto-install PrestaShop
   - Start NGINX with SSL support

## Common Commands

### Starting Services

- **Start with logs (recommended for first run):**
  ```bash
  docker compose --env-file ../.env.dev -f docker-compose.yml -f docker-compose.dev.yml up --build
  ```

- **Start in background (detached):**
  ```bash
  docker compose --env-file ../.env.dev -f docker-compose.yml -f docker-compose.dev.yml up -d
  ```

### Managing Services

- **View running services:**
  ```bash
  docker compose --env-file ../.env.dev -f docker-compose.yml -f docker-compose.dev.yml ps
  ```

- **View logs:**
  ```bash
  docker compose --env-file ../.env.dev -f docker-compose.yml -f docker-compose.dev.yml logs -f
  ```

- **Stop services:**
  ```bash
  docker compose --env-file ../.env.dev -f docker-compose.yml -f docker-compose.dev.yml down
  ```

- **Stop and remove volumes (clean slate):**
  ```bash
  docker compose --env-file ../.env.dev -f docker-compose.yml -f docker-compose.dev.yml down -v
  ```

### Accessing Containers

- **Access PrestaShop container:**
  ```bash
  docker exec -it prestashop bash
  ```

- **Access MySQL container:**
  ```bash
  docker exec -it some-mysql bash
  ```

## Access and Ports

### Web Interfaces

- **PrestaShop Frontend:** 
  - HTTP: http://localhost
  - HTTPS: https://localhost *(self-signed certificate)*
  
- **PrestaShop Admin Panel:**
  - URL: http://localhost/admin4577
  - Email: `admin@gmial.com`
  - Password: `AdminPassword123`

- **phpMyAdmin:** http://localhost:8081
  - Server: `some-mysql`
  - Username: `root`
  - Password: `admin`

### SSL Certificate

The setup uses self-signed SSL certificates located in `docker-compose/nginx/ssl/`. Your browser will show a security warning - this is normal for development.

## Configuration

### Environment Variables (.env.dev)

Key configuration options:

```bash
PS_SHOP_NAME=tuttu
PS_ADMIN_MAIL=admin@gmial.com
PS_ADMIN_PASSWD=AdminPassword123
PS_ERASE_DB=1
PS_INSTALL_DB=1
DB_NAME=prestashop
DB_SERVER=some-mysql
DB_PORT=3306
DB_USER=root
DB_PREFIX=ps_
DB_ROOT_PASSWORD=admin
PS_DB_CREATE=1
PS_LANGUAGE=pl
PS_COUNTRY=pl
PS_SSL=1
PS_NEWSLETTER=0
PS_FOLDER_ADMIN=admin4577
PS_FOLDER_INSTALL=install4577
```

### Custom Modules and Themes

- Place custom modules in: `docker-compose/modules/`
- Place custom themes in: `docker-compose/themes/`

These are automatically mounted into the PrestaShop container.

