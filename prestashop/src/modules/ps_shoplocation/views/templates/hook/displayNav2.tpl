<div class="shop-locations-wrapper">

  <div class="shop-locations-trigger">
      <i class="material-icons" aria-hidden="true">location_on</i>
      <span>sklepy</span>
      <i class="material-icons dropdown-arrow" aria-hidden="true">arrow_drop_down</i>
  </div>

  <div class="shop-locations-dropdown">
      <ul>
        {foreach from=$cities item=city}
          <li>
            <a href="{$city.link}" style="text-decoration: underline;">{$city.name}</a>
            <div class="city-contact">Tel: {$city.phone}</div>
          </li>
        {/foreach}
      </ul>
  </div>

</div>

<style>
.shop-locations-wrapper {
    margin-top: 25px;
    display: flex !important;
    align-items: center !important;
    border-radius: 3px;
    cursor: pointer;
    position: relative;
}

.shop-locations-trigger {
    display: flex;
    align-items: center;
    gap: 5px;
    color: #333;
}

.shop-locations-trigger:hover {
    color: rgb(255, 136, 0) !important;
}

.dropdown-arrow {
    font-size: 20px;
    margin-left: 5px;
}

.shop-locations-dropdown {
    display: none;
    position: absolute;
    right: 0;
    top: 100%;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 0px 0;
    width: 160px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    z-index: 9999;
}

.shop-locations-dropdown ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.shop-locations-dropdown li {
    padding: 8px 15px;
    font-weight: 600;
}

.shop-locations-dropdown li a {
    color: #333;
    text-decoration: none;
}

.shop-locations-dropdown li a:hover {
    color: rgb(255,136,0);
}

.city-contact {
    font-weight: normal;
    font-size: 12px;
    color: #666;
}
 
</style>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const trigger = document.querySelector('.shop-locations-trigger');
    const dropdown = document.querySelector('.shop-locations-dropdown');

    trigger.addEventListener('click', function() {
        dropdown.style.display =
            dropdown.style.display === 'block' ? 'none' : 'block';
    });

    document.addEventListener('click', function(e) {
        if (!trigger.contains(e.target) && !dropdown.contains(e.target)) {
            dropdown.style.display = 'none';
        }
    });
});
</script>
