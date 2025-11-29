<div class="shop-locations-wrapper">

  <div class="shop-locations-trigger">
      <i class="material-icons" aria-hidden="true">location_on</i>
      <span>sklepy</span>
  </div>

  <div class="shop-locations-dropdown">
      <ul>
        {foreach from=$cities item=city}
          <li>{$city}</li>
        {/foreach}
      </ul>
  </div>

</div>

<style>
/* wrapper jak koszyk */
.shop-locations-wrapper {
    margin-top: 10px;
    display: flex !important;
    align-items: center !important;
    border-radius: 4px;
    cursor: pointer;
    position: relative;
}

/* trigger jak nagłówek koszyka */
.shop-locations-trigger {
    display: flex;
    align-items: center;
    gap: 5px;
    color: #000;
}

.shop-locations-trigger:hover {
    color: rgb(255, 136, 0) !important;
}

/* dropdown */
.shop-locations-dropdown {
    display: none;
    position: absolute;
    right: 0;
    top: 100%;
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    padding: 8px 0;
    width: 200px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    z-index: 9999;
}

/* lista elementów */
.shop-locations-dropdown ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.shop-locations-dropdown li {
    padding: 8px 15px;
    font-weight: 600;
}

.shop-locations-dropdown li:hover {
    background: #f5f5f5;
    cursor: pointer;
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

    // klik poza dropdown zamyka
    document.addEventListener('click', function(e) {
        if (!trigger.contains(e.target) && !dropdown.contains(e.target)) {
            dropdown.style.display = 'none';
        }
    });
});
</script>
