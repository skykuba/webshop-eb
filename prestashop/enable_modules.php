#!/usr/bin/php
<?php
require_once '/var/www/html/config/config.inc.php';

$modules = array(
    'blockreassurance',
    'blockwishlist',
    'contactform',
    'dashactivity',
    'dashgoals',
    'dashproducts',
    'dashtrends',
    'followup',
    'graphnvd3',
    'gridhtml',
    'gsitemap',
    'pagesnotfound',
    'productcomments',
    'ps_accounts',
    'ps_banner',
    'ps_blik',
    'ps_buybuttonlite',
    'ps_categorytree',
    'ps_checkout',
    'ps_checkpayment',
    'ps_contactinfo',
    'ps_crossselling',
    'ps_currencyselector',
    'ps_customeraccountlinks',
    'ps_customersignin',
    'ps_dataprivacy',
    'ps_emailalerts',
    'ps_emailsubscription',
    'ps_facebook',
    'ps_facetedsearch',
    'ps_faviconnotificationbo',
    'ps_featuredproducts',
    'ps_imageslider',
    'ps_languageselector',
    'ps_linklist',
    'ps_mainmenu',
    'ps_mbo',
    'ps_newsletter_route',
    'ps_reminder',
    'ps_searchbar',
    'ps_sharebuttons',
    'ps_shoppingcart',
    'ps_socialfollow',
    'ps_themecusto',
    'psgdpr',
    'psxmarketingwithgoogle',
    'referralprogram',
    'statsbestcategories',
    'statsbestcustomers',
    'statsbestmanufacturers',
    'statsbestproducts',
    'statsbestsuppliers',
    'statsbestvouchers',
    'statscarrier',
    'statscatalog',
    'statscheckup',
    'statsdata',
    'statsforecast',
    'statsnewsletter',
    'statspersonalinfos',
    'statsproduct',
    'statsregistrations',
    'statssales',
    'statssearch',
    'statsstock',
    'welcome'
);

foreach ($modules as $moduleName) {
    $module = Module::getInstanceByName($moduleName);
    if ($module) {
        if (!$module->active) {
            $module->enable();
            echo "Enabled module: $moduleName\n";
        } else {
            echo "Module already enabled: $moduleName\n";
        }
    } else {
        // Try to install if not exists
        $modulePath = _PS_MODULE_DIR_ . $moduleName . '/' . $moduleName . '.php';
        if (file_exists($modulePath)) {
            require_once $modulePath;
            $className = ucfirst($moduleName);
            if (class_exists($className)) {
                $module = new $className();
                if ($module->install()) {
                    $module->enable();
                    echo "Installed and enabled module: $moduleName\n";
                } else {
                    echo "Failed to install module: $moduleName\n";
                }
            } else {
                echo "Module class not found: $moduleName\n";
            }
        } else {
            echo "Module file not found: $moduleName\n";
        }
    }
}

echo "Modules processing completed.\n";
?>
