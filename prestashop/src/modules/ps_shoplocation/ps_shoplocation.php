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
        // TU DEFINIUJESZ MIASTA
        $cities = [
            'Warszawa',
            'Kraków',
            'Poznań',
            'Wrocław',
            'Gdańsk',
            'Łódź',
            'Szczecin'
        ];

        $this->context->smarty->assign([
            'cities' => $cities
        ]);

        return $this->display(__FILE__, 'displayNav2.tpl');
    }
}