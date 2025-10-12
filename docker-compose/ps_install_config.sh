#!/bin/bash
set -e

# ----------------------------------------------
# 1. Wait for MySQL to be ready
# ----------------------------------------------
echo "Waiting for MySQL database at $DB_SERVER..."
# Loop until the database is reachable (attempts connection every 1 second)
until mysql -h "$DB_SERVER" -u "$DB_USER" -p"$DB_ROOT_PASSWORD" -e 'select 1' > /dev/null 2>&1; do
  echo "MySQL is unavailable - sleeping"
  sleep 1
done

echo "MySQL is up and running!"

# ----------------------------------------------
# 2. Check for installation flag and run CLI install
# ----------------------------------------------
# Check if the config file (sign of successful install) does NOT exist
if [ ! -f /var/www/html/config/settings.inc.php ]; then
  echo "PrestaShop is not installed. Starting CLI installation..."

  # The actual installation command
  php /var/www/html/install/index_cli.php \
    --domain=${PS_DOMAIN} \
    --db_server=${DB_SERVER} \
    --db_name=${DB_NAME} \
    --db_user=${DB_USER} \
    --db_password=${DB_ROOT_PASSWORD} \
    --db_create=${PS_DB_CREATE} \
    --name=${PS_SHOP_NAME} \
    --email=${PS_ADMIN_MAIL} \
    --password=${PS_ADMIN_PASSWD} \
    --language=${PS_LANGUAGE} \
    --country=${PS_COUNTRY} \
    --ssl=${PS_SSL} \
    --newsletter=${PS_NEWSLETTER} || {
      echo "PrestaShop CLI installation failed!"
      exit 1
    }

echo ${PS_ADMIN_PASSWD}

  # Remove install folder
  rm -rf /var/www/html/install 
  chown -R www-data:www-data /var/www/html
  mv /var/www/html/admin /var/www/html/${PS_FOLDER_ADMIN} &&
  echo "Installation complete."
else
  echo "PrestaShop config file found. Skipping installation."
fi


