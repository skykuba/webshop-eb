#!/bin/bash

# --------------------------
# KONFIGURACJA
# --------------------------
DB_CONTAINER="some-mysql"     # nazwa kontenera z MySQL/MariaDB
DB_USER="root"          # użytkownik bazy
DB_PASSWORD="admin"     # hasło do bazy
DB_NAME="prestashop"       # nazwa bazy PrestaShop

# --------------------------
# SKRYPT SQL - tworzy stronę CMS 'Gwarancja'
# --------------------------
SQL=$(cat <<'EOF'
INSERT INTO ps_cms (id_cms_category, active, position, indexation)
VALUES (1, 1, 0, 1);

SET @last_id = LAST_INSERT_ID();

INSERT INTO ps_cms_lang (
    id_cms, id_lang, meta_title, meta_description, meta_keywords, content, link_rewrite
)
VALUES (
    @last_id,
    1,
    'Gwarancja',
    'Informacje o gwarancji',
    'gwarancja',
    '<h1>Gwarancja</h1><p>Treść strony dotyczącej gwarancji.</p>',
    'gwarancja'
);

INSERT INTO ps_cms_shop (id_cms, id_shop)
VALUES(@last_id,1);
EOF
)

# --------------------------
# URUCHOMIENIE SQL W DOCKERZE
# --------------------------
docker exec -i "$DB_CONTAINER" mysql -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" -e "$SQL"

echo "Strona CMS 'Gwarancja' została utworzona."
