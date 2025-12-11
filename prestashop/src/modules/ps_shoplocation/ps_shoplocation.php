<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

class Ps_Shoplocation extends Module
{
    public function __construct()
    {
        $this->name = 'ps_shoplocation';
        $this->version = '1.0.0';
        $this->author = 'Custom';
        $this->tab = 'front_office_features';
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = 'Shop Locations Dropdown';
        $this->description = 'Wyświetla listę miast po kliknięciu ikonki w nagłówku.';
    }

    public function install()
    {
        return parent::install()
            && $this->registerHook('displayNav2');
    }

public function hookDisplayNav2($params)
{
    // Tablica miast z linkami i numerem telefonu
    $cities = [
        [
            'name' => 'Warszawa',
            'link' => $this->context->link->getCMSLink(16),
            'phone' => '22 123 45 67'
        ],
        [
            'name' => 'Wrocław',
            'link' => $this->context->link->getCMSLink(17),
            'phone' => '71 987 65 43'
        ],
        [
            'name' => 'Gdańsk',
            'link' => $this->context->link->getCMSLink(18),
            'phone' => '58 123 45 67'
        ]
    ];

    $this->context->smarty->assign([
        'cities' => $cities
    ]);

    return $this->display(__FILE__, 'displayNav2.tpl');
}

}