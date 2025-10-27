#!/bin/bash
mkdir -p nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout nginx/ssl/nginx-selfsigned.key \
  -out nginx/ssl/nginx-selfsigned.crt \
  -subj "/C=PL/ST=Dev/L=Local/O=LocalDev/OU=IT/CN=localhost"

echo "Self-signed generated in nginx/ssl/"
