# Utwórz folder, jeśli nie istnieje
New-Item -ItemType Directory -Force -Path "nginx\ssl" | Out-Null

# Wygeneruj samopodpisany certyfikat
openssl req -x509 -nodes -days 365 -newkey rsa:2048 `
  -keyout "nginx\ssl\nginx-selfsigned.key" `
  -out "nginx\ssl\nginx-selfsigned.crt" `
  -subj "/C=PL/ST=Dev/L=Local/O=LocalDev/OU=IT/CN=localhost"

Write-Host "Self-signed certificate generated in nginx\ssl\"