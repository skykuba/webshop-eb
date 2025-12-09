<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class Ps_wishlistbutton extends Module
{
    public function __construct()
    {
        $this->name = 'ps_wishlistbutton';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Twoja Firma';
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('wishlist button');
        $this->description = $this->l('Wyświetla listę korzyści w sklepie.');
    }

    public function install()
    {
        return parent::install()
            && $this->registerHook('displayNav2');
    }

    
    public function hookDisplayNav2($params)
    {
        $this->context->controller->registerStylesheet(
            'module-wishlistbutton',
            'modules/'.$this->name.'/views/css/style.css'
        );
        
        // link do CMS w metodzie, w kontekście
        $idCms = 6; // ID strony CMS
        $linkCms = $this->context->link->getCMSLink($idCms);

        // przekazanie do tpl
        $this->context->smarty->assign('cmsLink', $linkCms);

        return $this->display(__FILE__, 'views/templates/hook/ps_wishlistbutton.tpl');
    }
}
