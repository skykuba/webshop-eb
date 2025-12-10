<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class Ps_Mywishlist extends Module
{
    public function __construct()
    {
        $this->name = 'ps_mywishlist';
        $this->author = 'Custom';
        $this->version = '1.0.0';
        $this->bootstrap = true;
        $this->tab = 'front_office_features';

        parent::__construct();

        $this->displayName = $this->l('Custom Wishlist Display');
        $this->description = $this->l('Displays current customer wishlist items from ps_wishlist.');
    }

    public function install()
    {
        return parent::install()
            && $this->registerHook('displayMyWishlist');
    }

    public function hookDisplayMyWishlist($params)
{
    if (!$this->context->customer->isLogged()) {
        return '<p>Zaloguj się, aby zobaczyć listy zakupowe.</p>';
    }

    $idCustomer = (int)$this->context->customer->id;

    // Pobierz wszystkie listy użytkownika
    $sql = '
        SELECT w.id_wishlist, w.name
        FROM '._DB_PREFIX_.'wishlist w
        WHERE w.id_customer = '.(int)$idCustomer;

    $wishlists = Db::getInstance()->executeS($sql);

    foreach ($wishlists as &$list) {

        // Policzenie produktów w każdej liście
        $sqlCount = '
            SELECT COUNT(*)
            FROM '._DB_PREFIX_.'wishlist_product
            WHERE id_wishlist = '.(int)$list['id_wishlist'];

        $list['count'] = (int)Db::getInstance()->getValue($sqlCount);

        // Link do listy
        $list['link'] = $this->context->link->getModuleLink(
            'ps_wishlist',
            'view',
            ['id_wishlist' => $list['id_wishlist']]
        );
    }

    $this->context->smarty->assign([
        'wishlists' => $wishlists,
        'empty'     => empty($wishlists),
        'manageLink' => $this->context->link->getModuleLink('ps_wishlist', 'manage'),
        'boughtProductsLink' => $this->context->link->getPageLink('products-bought'),
    ]);

    return $this->display(__FILE__, 'views/templates/hook/displayMyWishlist.tpl');
}

}
