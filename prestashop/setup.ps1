Write-Host ""
Write-Host "=========================================="
Write-Host " PrestaShop - Clean Fresh Installation"
Write-Host "=========================================="
Write-Host ""

# 1. Check .env.dev file
if (!(Test-Path ".env.dev")) {
    Write-Host "[X] Error: .env.dev file not found!"
    exit 1
}

Write-Host "[*] Loading environment variables from .env.dev ..."

$envContent = Get-Content ".env.dev"

foreach ($line in $envContent) {
    if ($line -match "^PS_DOMAIN=(.*)$") {
        $PS_DOMAIN = $Matches[1]
    }
    elseif ($line -match "^PS_FOLDER_ADMIN=(.*)$") {
        $PS_FOLDER_ADMIN = $Matches[1]
    }
}

if (-not $PS_DOMAIN) {
    Write-Host "[X] PS_DOMAIN missing in .env.dev"
    exit 1
}
if (-not $PS_FOLDER_ADMIN) {
    Write-Host "[X] PS_FOLDER_ADMIN missing in .env.dev"
    exit 1
}

Write-Host "[+] Environment variables loaded."
Write-Host ""

# 2. Remove containers & volumes
Write-Host "Step 1: Removing old containers and volumes..."
docker compose down -v | Out-Null
Write-Host "[+] Containers and volumes removed."
Write-Host ""

# 3. Remove PrestaShop config files
Write-Host "Step 2: Removing PrestaShop configuration files..."

$files = @(
    "src\config\settings.inc.php",
    "src\app\config\parameters.php",
    "src\install.lock"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        Remove-Item $file -Force
        Write-Host "  [+] Removed $file"
    }
}

Write-Host "[+] Configuration files removed."
Write-Host ""

# 4. Start installation
Write-Host "Step 3: Starting fresh installation..."

docker compose --env-file .env.dev up -d --build

if ($LASTEXITCODE -ne 0) {
    Write-Host "[X] Docker failed to start."
    exit 1
}

Write-Host ""
Write-Host "=========================================="
Write-Host " [+] Clean Installation Started!"
Write-Host "=========================================="
Write-Host ""
Write-Host "Frontend:   https://$PS_DOMAIN"
Write-Host "Admin:      https://$PS_DOMAIN/$PS_FOLDER_ADMIN"
Write-Host "PhpMyAdmin: http://localhost:8081"
Write-Host ""
Write-Host "Watch logs:"
Write-Host "   docker logs -f prestashop"
Write-Host ""
Write-Host "Installation will take a few minutes..."
