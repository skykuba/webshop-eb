<?php

define('_PS_ROOT_DIR_', '/var/www/html');

require_once _PS_ROOT_DIR_ . '/config/config.inc.php';

if (getenv('MEMCACHED_HOST')) {
    echo "\n* Configuring Memcached...\n";
    
    // Enable Cache
    Configuration::updateValue('PS_CACHE_ENABLE', 1);
    Configuration::updateValue('PS_CACHING_SYSTEM', 'CacheMemcached');
    
    // Add Server
    $memcached = new CacheMemcached();
    $server_added = $memcached->addServer(getenv('MEMCACHED_HOST'), getenv('MEMCACHED_PORT') ?: 11211,1 );
    if ($server_added) {
        echo "* Memcached server added successfully.\n";
    } else {
        echo "* Failed to add Memcached server in PrestaShop configuration.\n";
    }

    echo "* Cache configuration updated.\n";
}
