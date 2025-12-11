#!/bin/bash
# Carriers Installation Script

echo "======================================"
echo "CARRIERS INSTALLATION"
echo "======================================"
echo ""

# Check if SQL file exists
if [ ! -f "carriers_install.sql" ]; then
    echo "ERROR: carriers_install.sql not found!"
    exit 1
fi

docker exec -i some-mysql mysql -uroot -padmin prestashop < carriers_install.sql

if [ $? -ne 0 ]; then
    echo "Failed to import carriers"
    exit 1
fi

echo "Carriers imported"


echo ""
echo "======================================"
echo " INSTALLATION COMPLETE"
echo "======================================"
