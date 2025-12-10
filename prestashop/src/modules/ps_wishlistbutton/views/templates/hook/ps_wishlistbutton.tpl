<div class="wishlistbutton-wrapper">

  <div class="wishlistbutton-trigger">
      <a href="{$cmsLink}">
        <i class="material-icons" aria-hidden="true">favorite</i>
        <span>listy zakupowe</span>
         <i class="material-icons dropdown-arrow" aria-hidden="true">arrow_drop_down</i>
      </a>
  </div>

  <div class="wishlistbutton-dropdown">
      <div class="wishlist-info">
          Dodaj do nich swoje produkty, które chcesz kupić później
      </div>
  </div>

</div>


<style>

/* wrapper jak koszyk */
.wishlistbutton-wrapper {
    position: relative;
    display: inline-block;
    margin-top: 30px;

}

/* trigger */
.wishlistbutton-trigger a {
    display: flex;
    align-items: center;
    gap: 6px;
    color: #333;
    text-decoration: none;
}

.wishlistbutton-trigger a:hover {
    color: rgb(255, 136, 0) !important;
}

/* dropdown */
.wishlistbutton-dropdown {
    display: none;
    position: absolute;
    left: 0;
    top: calc(100% + 5px);
    width: 260px;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    padding: 12px 14px;
    z-index: 9999;
}

/* pokazanie dropdownu po hover */
.wishlistbutton-wrapper:hover .wishlistbutton-dropdown {
    display: block;
}

/* tekst w dropdownie */
.wishlist-info {
    font-size: 13px;
    font-weight: 500;
    color: #333;
    line-height: 1.4;
}

</style>
