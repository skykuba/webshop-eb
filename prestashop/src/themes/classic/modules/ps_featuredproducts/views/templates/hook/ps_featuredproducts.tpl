{**
 * Featured Products - Nowości
 * PrestaShop
 *}
<section class="featured-products clearfix">
  <div class="products-header">
    <h2 class="products-title">Nowości</h2>
    <a class="all-product-link" href="{$allProductsLink}">
      Wszystkie produkty <span class="arrow">&rarr;</span>
    </a>
  </div>

  {include file="catalog/_partials/productlist.tpl" products=$products|@array_slice:0:5 cssClass="row single-row" productClass="single-row-product"}
</section>

<style>
/* --- Nagłówek --- */
.featured-products .products-header {
  display: flex;
  justify-content: space-between; /* tytuł po lewej, link po prawej */
  align-items: center;            /* wyrównanie w pionie */
  margin-bottom: 15px;
}

.featured-products .products-header .products-title {
  margin: 0;
  flex: 1;             /* zajmuje całą przestrzeń */
  text-align: center;  /* wyśrodkowanie tekstu */
  font-size: 28px;
}

.all-product-link {
  display: inline-flex;
  align-items: center;
  font-size: 1.2em;
  text-decoration: none;
  color: #333; /* kolor początkowy linku */
  transition: color 0.3s ease;
}

.all-product-link .arrow {
  margin-left: 0.3em;
  line-height: 1;
  font-size: 1.5em;
  color: inherit; /* dziedziczy kolor z linku */
  transition: inherit;
}

.all-product-link:hover {
  color: #ff6600; /* zmienia kolor tekstu i strzałki */
}

/* --- Produkty: 5 w jednym rzędzie --- */
.featured-products .products {
  display: flex;
  flex-wrap: nowrap;             /* jeden rząd */
  justify-content: space-between; /* równy odstęp między produktami */
}

.featured-products .products .product {
  flex: 0 0 19%; /* 5 produktów */
  box-sizing: border-box;
  margin: 0;
}

/* --- Responsywność (opcjonalnie) --- */
@media (max-width: 1200px) {
  .featured-products .products .product {
    flex: 0 0 24%; /* 4 produkty w rzędzie na mniejszych ekranach */
  }
}

@media (max-width: 992px) {
  .featured-products .products .product {
    flex: 0 0 32%; /* 3 produkty w rzędzie */
  }
}

@media (max-width: 768px) {
  .featured-products .products .product {
    flex: 0 0 48%; /* 2 produkty w rzędzie */
  }
}

@media (max-width: 576px) {
  .featured-products .products .product {
    flex: 0 0 100%; /* 1 produkt w rzędzie */
  }
}
</style>
