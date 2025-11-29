<div class="shop-locations-wrapper">

  <div class="shop-locations-trigger">
      <i class="material-icons" aria-hidden="true">location_on</i>
      <span>Nasze lokalizacje</span>
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
.shop-locations-wrapper {
    position: relative;
    display: inline-block;
    cursor: pointer;
}

/* trigger */
.shop-locations-trigger {
    display: flex;
    align-items: center;
    gap: 5px;
    padding: 8px 10px;
}

.shop-locations-trigger:hover {
    color: #ff8c00;
}

/* dropdown */
.shop-locations-dropdown {
    display: none;
    position: absolute;
    right: 0;
    top: 100%;
    background: #fff;
    border: 1px solid #ddd;
    width: 200px;
    padding: 10px 0;
    border-radius: 8px;
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
