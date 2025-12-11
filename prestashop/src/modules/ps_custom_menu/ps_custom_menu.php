<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class Ps_Custom_Menu extends Module
{
    public function __construct()
    {
        $this->name = 'ps_custom_menu';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Twoje Imię';
        $this->need_instance = 0;
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Custom Menu Block');
        $this->description = $this->l('Wyświetla kafelki z obrazkami i linkami, jak w przykładzie.');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
    }

    public function install()
    {
        return parent::install() && $this->registerHook('displayHome');
    }

    public function hookDisplayHome($params)
    {
        // Dane kafelków
        $tiles = [
            [
                'link' => 'https://localhost/4-men',
                'img_desktop' => 'modules/ps_custom_menu/views/templates/hook/image1.png',
                'alt' => ''
            ],
            [
                'link' => 'https://localhost',
                'img_desktop' => 'modules/ps_custom_menu/views/templates/hook/image2.png',
                'alt' => '3w1 JW'
            ],
            [
                'link' => 'https://localhost',
                'img_desktop' => 'modules/ps_custom_menu/views/templates/hook/image3.png',
                'alt' => ''
            ],
            [
                'link' => 'https://localhost/content/18-gdansk',
                'img_desktop' => 'modules/ps_custom_menu/views/templates/hook/image4.png',
                'alt' => ''
            ],
        ];

        $this->context->smarty->assign('tiles', $tiles);

        return $this->display(__FILE__, 'views/templates/hook/ps_custom_menu.tpl');
    }
}
