# webshop-eb

An online store project based on PrestaShop.

## Requirements

- Docker
- Docker Compose
- Git

## Docker Compose Configuration

The project uses different `docker-compose` files depending on the environment. All main configuration files are located in the `prestashop/` directory.

### 1. Development Environment
**File:** `docker-compose.yml`

This is the default configuration intended for daily development work.
- **Source code:** Mounted from the host (changes in files are visible immediately).
- **Database:** Local MySQL container.
- **Add-ons:** Includes phpMyAdmin for database management.

**Running:**
```bash
cd prestashop
docker-compose up -d
```

### 2. Production Environment
**File:** `docker-comopose.prod.yml`

Configuration intended for deployment on a production server.
- **Source code:** Uses built images downloaded from the registry (ghcr.io).
- **Database:** Connects to an external, production database instance.
- **SSL:** Includes configuration for SSL certificates.

**Running:**
```bash
cd prestashop
docker-compose -f docker-comopose.prod.yml up -d
```

### 3. Local Production Testing (Local Prod Test)
**File:** `docker-compose.local.prod.test.yml`

Environment for verifying production configuration on a local machine, but using images built from local sources.
- **Images:** Built locally (`build: .`).
- **Database:** Local MySQL container (isolated from production).

**Running:**
```bash
cd prestashop
docker-compose -f docker-compose.local.prod.test.yml up -d --build
```

### 4. Production Images Testing (Prod Test)
**File:** `docker-compose.prod.test.yml`

Environment for testing ready-made images that would go to production, but in a safe local environment.
- **Images:** Downloaded from the registry (just like in production).
- **Database:** Local MySQL container (safe testing without risk of damaging production data).

**Running:**
```bash
cd prestashop
docker-compose -f docker-compose.prod.test.yml up -d
```

## Project Structure

```
webshop-eb/
├── README.md                          # This file
├── prestashop/
│   ├── docker-compose.yml             # DEV Configuration
│   ├── docker-comopose.prod.yml       # PROD Configuration
│   ├── docker-compose.local.prod.test.yml # TEST Configuration (local build)
│   ├── docker-compose.prod.test.yml   # TEST Configuration (images)
│   ├── docker_run.sh                  # PrestaShop installation script
│   ├── setup.sh                       # Configuration script (Windows/Linux helper)
│   ├── gen-cert.sh                    # SSL certificate generator
│   ├── Docker/                        # Dockerfile files
│   ├── nginx/                         # NGINX configuration
│   └── src/                           # PrestaShop source code
├── scraper/                           # Scripts for fetching product data
└── tests/                             # Automated tests
```
