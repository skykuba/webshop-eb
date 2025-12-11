SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO ps_carrier (
    id_carrier, 
    id_reference, 
    name, 
    active, 
    is_free, 
    shipping_method, 
    shipping_handling, 
    range_behavior, 
    max_weight, 
    max_width, 
    max_height, 
    max_depth, 
    grade, 
    url,
    position,
    deleted,
    is_module,
    shipping_external,
    need_range,
    external_module_name
) VALUES (
    11,
    11,
    'Kurier InPost', 
    1,
    0,
    2,
    1,
    0,
    50.000000,
    0,
    0,
    0,
    0,
    '',
    1,
    0,
    0,
    0,
    1,
    NULL
) ON DUPLICATE KEY UPDATE
    name = VALUES(name),
    active = VALUES(active),
    deleted = 0,
    is_free = VALUES(is_free),
    shipping_method = VALUES(shipping_method),
    shipping_handling = VALUES(shipping_handling),
    max_weight = VALUES(max_weight);

INSERT INTO ps_carrier (
    id_carrier, 
    id_reference, 
    name, 
    active, 
    is_free, 
    shipping_method, 
    shipping_handling, 
    range_behavior, 
    max_weight, 
    max_width, 
    max_height, 
    max_depth, 
    grade, 
    url,
    position,
    deleted,
    is_module,
    shipping_external,
    need_range,
    external_module_name
) VALUES (
    12,
    12,
    'DHL', 
    1,
    0,
    2,
    1,
    0,
    50.000000,
    0,
    0,
    0,
    0,
    '',
    2,
    0,
    0,
    0,
    1,
    NULL
) ON DUPLICATE KEY UPDATE
    name = VALUES(name),
    active = VALUES(active),
    deleted = 0,
    is_free = VALUES(is_free),
    shipping_method = VALUES(shipping_method),
    shipping_handling = VALUES(shipping_handling),
    max_weight = VALUES(max_weight);

INSERT INTO ps_carrier_lang (
    id_carrier, 
    id_shop, 
    id_lang, 
    delay
) VALUES 
    (11, 1, 1, '1-2 dni robocze')
ON DUPLICATE KEY UPDATE
    delay = VALUES(delay);

INSERT INTO ps_carrier_lang (
    id_carrier, 
    id_shop, 
    id_lang, 
    delay
) VALUES 
    (12, 1, 1, '1-2 dni robocze')
ON DUPLICATE KEY UPDATE
    delay = VALUES(delay);

INSERT INTO ps_carrier_zone (id_carrier, id_zone) VALUES
    (11, 1),
    (11, 2)
ON DUPLICATE KEY UPDATE id_zone = VALUES(id_zone);

INSERT INTO ps_carrier_zone (id_carrier, id_zone) VALUES
    (12, 1),
    (12, 7)
ON DUPLICATE KEY UPDATE id_zone = VALUES(id_zone);

INSERT INTO ps_carrier_group (id_carrier, id_group)
SELECT 11, id_group FROM ps_group
ON DUPLICATE KEY UPDATE id_group = VALUES(id_group);

INSERT INTO ps_carrier_group (id_carrier, id_group)
SELECT 12, id_group FROM ps_group
ON DUPLICATE KEY UPDATE id_group = VALUES(id_group);

INSERT INTO ps_range_price (
    id_range_price,
    id_carrier, 
    delimiter1, 
    delimiter2
) VALUES
    (15, 11, 0.000000, 2000.000000),
    (16, 11, 2000.000000, 1000000000.000000)
ON DUPLICATE KEY UPDATE
    delimiter1 = VALUES(delimiter1),
    delimiter2 = VALUES(delimiter2);

INSERT INTO ps_range_price (
    id_range_price,
    id_carrier, 
    delimiter1, 
    delimiter2
) VALUES
    (17, 12, 0.000000, 2000.000000),
    (18, 12, 2000.000000, 3000.000000)
ON DUPLICATE KEY UPDATE
    delimiter1 = VALUES(delimiter1),
    delimiter2 = VALUES(delimiter2);

INSERT INTO ps_delivery (
    id_carrier, 
    id_zone, 
    id_range_price, 
    id_range_weight, 
    price
) VALUES
    (11, 1, 15, 0, 19.000000),
    (11, 1, 16, 0, 0.000000)
ON DUPLICATE KEY UPDATE
    price = VALUES(price);

INSERT INTO ps_delivery (
    id_carrier, 
    id_zone, 
    id_range_price, 
    id_range_weight, 
    price
) VALUES
    (11, 2, 15, 0, 39.000000),
    (11, 2, 16, 0, 0.000000)
ON DUPLICATE KEY UPDATE
    price = VALUES(price);

INSERT INTO ps_delivery (
    id_carrier, 
    id_zone, 
    id_range_price, 
    id_range_weight, 
    price
) VALUES
    (12, 1, 17, 0, 16.000000),
    (12, 1, 18, 0, 0.000000)
ON DUPLICATE KEY UPDATE
    price = VALUES(price);

INSERT INTO ps_delivery (
    id_carrier, 
    id_zone, 
    id_range_price, 
    id_range_weight, 
    price
) VALUES
    (12, 7, 17, 0, 46.000000),
    (12, 7, 18, 0, 0.000000)
ON DUPLICATE KEY UPDATE
    price = VALUES(price);

INSERT INTO ps_carrier_shop (id_carrier, id_shop) VALUES
    (11, 1),
    (12, 1)
ON DUPLICATE KEY UPDATE id_shop = VALUES(id_shop);

SET FOREIGN_KEY_CHECKS = 1;

SELECT id_carrier, name, active, is_free, shipping_method 
FROM ps_carrier 
WHERE deleted = 0 
ORDER BY position;
