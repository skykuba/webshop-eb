<aside class="col-3">
<section class="shopping_list_menu">

  <div class="shopping_list_menu__block --lists slm_lists" data-empty="{if $empty}true{else}false{/if}">
      <span class="slm_lists__label">Listy zakupowe</span>

      <ul class="slm_lists__nav">

          <li class="slm_lists__nav_header">
              <span class="slm_lists__label">Listy zakupowe</span>
          </li>

          {if !$empty}
              {foreach from=$wishlists item=list}
              <li class="slm_lists__nav_item">
                  <a class="slm_lists__nav_link" href="{$list.link}">
                      <span class="slm_lists__nav_name">{$list.name}</span>
                      <span class="slm_lists__count">{$list.count}</span>
                  </a>
              </li>
              {/foreach}
          {else}
              <li class="slm_lists__nav_item --empty">
                  <a class="slm_lists__nav_link --empty" href="#">
                      <span class="slm_lists__nav_name">Lista zakupowa</span>
                      <span class="slm_lists__count">0</span>
                  </a>
              </li>
          {/if}

      </ul>

      <a href="{$manageLink}" class="slm_lists__manage d-none align-items-center d-md-flex">
          Zarządzaj listami
      </a>
  </div>

  <div class="shopping_list_menu__block --bought slm_bought">
      <a class="slm_bought__link d-flex" href="{$boughtProductsLink}">
          Lista dotychczas zamówionych produktów
      </a>
  </div>

  <div class="shopping_list_menu__block --info slm_info">
      <strong class="slm_info__label d-block mb-3">Jak działa lista zakupowa?</strong>

      <ul class="slm_info__list">
          <li class="slm_info__list_item d-flex mb-3">
              Po zalogowaniu możesz przechowywać produkty na liście zakupowej bez ograniczeń czasowych.
          </li>
          <li class="slm_info__list_item d-flex mb-3">
              Dodanie produktu nie oznacza jego rezerwacji.
          </li>
          <li class="slm_info__list_item d-flex mb-3">
              Dla niezalogowanych lista działa ~24h.
          </li>
      </ul>
  </div>

</section>
</aside>

<div id="content" class="col-12">
    {if $empty}
        <h3>Lista zakupowa jest pusta.</h3>
        <a class="btn btn-primary" href="/">Rozpocznij zakupy</a>
    {/if}
</div>
