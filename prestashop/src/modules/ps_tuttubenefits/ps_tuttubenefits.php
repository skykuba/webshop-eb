<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class Ps_Tuttubenefits extends Module
{
    public function __construct()
    {
        $this->name = 'ps_tuttubenefits';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Twoja Firma';
        $this->need_instance = 0;

        parent::__construct();

        $this->displayName = $this->l('Tuttu Benefits');
        $this->description = $this->l('Wyświetla listę korzyści w sklepie.');
        $this->ps_versions_compliancy = array('min' => '1.7.0.0', 'max' => _PS_VERSION_);
    }

    public function install()
    {
        return parent::install() && $this->registerHook('displayHome');
    }

    
    public function hookDisplayHome($params)
    {
        $this->context->controller->registerStylesheet(
            'module-tuttu-benefits-style',
            'modules/'.$this->name.'/views/css/style.css'
        );
        
        // link do CMS w metodzie, w kontekście
        $idCms = 6; // ID strony CMS
        $linkCms = $this->context->link->getCMSLink($idCms);

        // przekazanie do tpl
        $this->context->smarty->assign('cmsLink', $linkCms);

        return $this->display(__FILE__, 'ps_tuttubenefits.tpl');
    }
}
