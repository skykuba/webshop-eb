#!/bin/bash
# Carriers Installation Script
# This script imports carriers and their logos into PrestaShop

echo "======================================"
echo "CARRIERS INSTALLATION"
echo "======================================"
echo ""

# Check if SQL file exists
if [ ! -f "carriers_install.sql" ]; then
    echo "ERROR: carriers_install.sql not found!"
    exit 1
fi

echo "[1/2] Importing carriers from SQL..."
docker exec -i some-mysql mysql -uroot -padmin prestashop < carriers_install.sql

if [ $? -ne 0 ]; then
    echo "Failed to import carriers"
    exit 1
fi

echo "Carriers imported"
echo ""

# Install logos
echo "[2/2] Installing carrier logos..."

LOGOS_DIR="logos"
TARGET_DIR="../src/img/s"

if [ ! -d "$LOGOS_DIR" ]; then
    echo "Warning: $LOGOS_DIR not found, skipping logos"
else
    installed=0
    
    for logo in $LOGOS_DIR/*.{jpg,png,gif}; do
        if [ -f "$logo" ]; then
            filename=$(basename "$logo")
            cp "$logo" "$TARGET_DIR/"
            chmod 644 "$TARGET_DIR/$filename"
            echo "  Installed $filename"
            ((installed++))
        fi
    done
    
    if [ $installed -eq 0 ]; then
        echo "Warning: No logo files found in $LOGOS_DIR"
    fi
fi

echo ""
echo "======================================"
echo " INSTALLATION COMPLETE"
echo "======================================"
