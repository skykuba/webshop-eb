<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class Ps_listyzakupowe extends Module
{
    public function __construct()
    {
        $this->name = 'ps_listyzakupowe';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'admin';
        $this->need_instance = 0;
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Custom Lists Panel');
        $this->description = $this->l('Wyświetla panel list sprzętowych podobny do podanego HTML.');
        $this->ps_versions_compliancy = ['min' => '1.7', 'max' => _PS_VERSION_];
    }

    public function install()
    {

        return parent::install()
            && $this->registerHook('displayHome')
            && $this->registerHook('displayHeader');
    }

    public function uninstall()
    {
        Configuration::deleteByName('BLOCKCUSTOMLISTS_HTML');
        return parent::uninstall();
    }

    public function getContent()
    {
        $output = '';
        if (Tools::isSubmit('submitBlockCustomLists')) {
            $html = Tools::getValue('BLOCKCUSTOMLISTS_HTML');
            Configuration::updateValue('BLOCKCUSTOMLISTS_HTML', $html);
            $output .= $this->displayConfirmation($this->l('Settings updated'));
        }

        return $output . $this->renderForm();
    }

    protected function renderForm()
    {
        $default_lang = (int)Configuration::get('PS_LANG_DEFAULT');

        $form = [
            'form' => [
                'legend' => ['title' => $this->l('Custom Lists Panel')],
                'input' => [
                    [
                        'type' => 'textarea',
                        'label' => $this->l('HTML panelu'),
                        'name' => 'BLOCKCUSTOMLISTS_HTML',
                        'cols' => 60,
                        'rows' => 20,
                    ],
                ],
                'submit' => ['title' => $this->l('Save')],
            ],
        ];

        $helper = new HelperForm();
        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this;
        $helper->default_form_language = $default_lang;
        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitBlockCustomLists';
        $helper->currentIndex = AdminController::$currentIndex . '&configure=' . $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->fields_value['BLOCKCUSTOMLISTS_HTML'] = Configuration::get('BLOCKCUSTOMLISTS_HTML');

        return $helper->generateForm([$form]);
    }


    public function hookDisplayHome($params)
    {

        // link do CMS w metodzie, w kontekście
        $linkCms1 = $this->context->link->getCMSLink(7);
        $linkCms2 = $this->context->link->getCMSLink(8);
        $linkCms3 = $this->context->link->getCMSLink(9);
        $linkCms4 = $this->context->link->getCMSLink(10);
        $linkCms5 = $this->context->link->getCMSLink(11);
        $linkCms6 = $this->context->link->getCMSLink(12);
        $linkCms7 = $this->context->link->getCMSLink(13);
        $linkCms8 = $this->context->link->getCMSLink(14);
        $linkCms9 = $this->context->link->getCMSLink(15);

        $this->context->smarty->assign('cmsLink1', $linkCms1);
        $this->context->smarty->assign('cmsLink2', $linkCms2);
        $this->context->smarty->assign('cmsLink3', $linkCms3);
        $this->context->smarty->assign('cmsLink4', $linkCms4);
        $this->context->smarty->assign('cmsLink5', $linkCms5);
        $this->context->smarty->assign('cmsLink6', $linkCms6);
        $this->context->smarty->assign('cmsLink7', $linkCms7);
        $this->context->smarty->assign('cmsLink8', $linkCms8);
        $this->context->smarty->assign('cmsLink9', $linkCms9);


        $this->context->smarty->assign('blockcustomlists_html', Configuration::get('BLOCKCUSTOMLISTS_HTML'));
        return $this->display(__FILE__, 'views/templates/hook/displayHome.tpl');
    }
}
