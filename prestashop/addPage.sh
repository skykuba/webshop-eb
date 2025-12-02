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
INSERT INTO ps_cms (id_cms_category, active, position, indexation)
VALUES (1, 1, 0, 1);

SET @last_id = LAST_INSERT_ID();

INSERT INTO ps_cms_lang (id_cms, id_lang, meta_title, meta_description, meta_keywords, content, link_rewrite)
VALUES 
(@last_id, 1, 'Trekking', 'Informacje o trekkingu', 'trekking', '<h1>Trekking</h1><p>Treść strony o trekkingu.</p>', 'trekking');

INSERT INTO ps_cms_shop (id_cms, id_shop)
VALUES(@last_id, 1);

-- -----------------------------------

INSERT INTO ps_cms (id_cms_category, active, position, indexation)
VALUES (1, 1, 1, 1);

SET @last_id = LAST_INSERT_ID();

INSERT INTO ps_cms_lang (id_cms, id_lang, meta_title, meta_description, meta_keywords, content, link_rewrite)
VALUES 
(@last_id, 1, 'Gory', 'Informacje o gorach', 'gory', '<h1>Góry</h1><p>Treść strony o gorach.</p>', 'gory');

INSERT INTO ps_cms_shop (id_cms, id_shop)
VALUES(@last_id, 1);

-- -----------------------------------

INSERT INTO ps_cms (id_cms_category, active, position, indexation)
VALUES (1, 1, 2, 1);

SET @last_id = LAST_INSERT_ID();

INSERT INTO ps_cms_lang (id_cms, id_lang, meta_title, meta_description, meta_keywords, content, link_rewrite)
VALUES 
(@last_id, 1, 'Apteczka', 'Informacje o apteczce', 'apteczka', '<h1>Apteczka</h1><p>Treść strony o apteczce.</p>', 'apteczka');

INSERT INTO ps_cms_shop (id_cms, id_shop)
VALUES(@last_id, 1);

INSERT INTO ps_cms (id_cms_category, active, position, indexation)
VALUES (1, 1, 0, 1);

SET @last_id = LAST_INSERT_ID();

INSERT INTO ps_cms_lang (id_cms, id_lang, meta_title, meta_description, meta_keywords, content, link_rewrite)
VALUES 
(@last_id, 1, 'Kajak', 'Informacje o kajakach', 'kajak', '<h1>Kajak</h1><p>Treść strony o kajakach.</p>', 'kajak');

INSERT INTO ps_cms_shop (id_cms, id_shop)
VALUES(@last_id, 1);

-- -----------------------------------

INSERT INTO ps_cms (id_cms_category, active, position, indexation)
VALUES (1, 1, 1, 1);

SET @last_id = LAST_INSERT_ID();

INSERT INTO ps_cms_lang (id_cms, id_lang, meta_title, meta_description, meta_keywords, content, link_rewrite)
VALUES 
(@last_id, 1, 'Skitury', 'Informacje o Skiturach', 'skitury', '<h1>Skitury</h1><p>Treść strony o skiturach.</p>', 'skitury');

INSERT INTO ps_cms_shop (id_cms, id_shop)
VALUES(@last_id, 1);

-- -----------------------------------

INSERT INTO ps_cms (id_cms_category, active, position, indexation)
VALUES (1, 1, 2, 1);

SET @last_id = LAST_INSERT_ID();

INSERT INTO ps_cms_lang (id_cms, id_lang, meta_title, meta_description, meta_keywords, content, link_rewrite)
VALUES 
(@last_id, 1, 'Tropiki', 'Informacje o tropikach', 'tropiki', '<h1>Tropiki</h1><p>Treść strony o Tropikach.</p>', 'tropiki');

INSERT INTO ps_cms_shop (id_cms, id_shop)
VALUES(@last_id, 1);

INSERT INTO ps_cms (id_cms_category, active, position, indexation)
VALUES (1, 1, 0, 1);

SET @last_id = LAST_INSERT_ID();

INSERT INTO ps_cms_lang (id_cms, id_lang, meta_title, meta_description, meta_keywords, content, link_rewrite)
VALUES 
(@last_id, 1, 'Skaly', 'Informacje o skalach', 'skaly', '<h1>Skały</h1><p>Treść strony o skalach.</p>', 'skaly');

INSERT INTO ps_cms_shop (id_cms, id_shop)
VALUES(@last_id, 1);

-- -----------------------------------

INSERT INTO ps_cms (id_cms_category, active, position, indexation)
VALUES (1, 1, 1, 1);

SET @last_id = LAST_INSERT_ID();

INSERT INTO ps_cms_lang (id_cms, id_lang, meta_title, meta_description, meta_keywords, content, link_rewrite)
VALUES 
(@last_id, 1, 'Camping', 'Informacje o camp', 'camping', '<h1>Camping</h1><p>Treść strony o camp.</p>', 'camping');

INSERT INTO ps_cms_shop (id_cms, id_shop)
VALUES(@last_id, 1);

-- -----------------------------------

INSERT INTO ps_cms (id_cms_category, active, position, indexation)
VALUES (1, 1, 2, 1);

SET @last_id = LAST_INSERT_ID();

INSERT INTO ps_cms_lang (id_cms, id_lang, meta_title, meta_description, meta_keywords, content, link_rewrite)
VALUES 
(@last_id, 1, 'Camino', 'Informacje o camino', 'camino', '<h1>camino</h1><p>Treść strony o camino.</p>', 'camino');

INSERT INTO ps_cms_shop (id_cms, id_shop)
VALUES(@last_id, 1);
EOF
)

# --------------------------
# URUCHOMIENIE SQL W DOCKERZE
# --------------------------
docker exec -i "$DB_CONTAINER" mysql -u"$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" -e "$SQL"

echo "Strona CMS 'Gwarancja' została utworzona."
