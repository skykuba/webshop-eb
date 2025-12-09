<div class="wishlistbutton-wrapper">

  <div class="wishlistbutton-trigger">
      <a href="{$cmsLink}">
      <i class="material-icons" aria-hidden="true">favorite</i>
      <span>listy zakupowe</span>
      </a>
  </div>

</div>

<style>
/* wrapper jak koszyk */
.wishlistbutton-wrapper {
    margin-top: 25px;
    display: flex !important;
    align-items: center !important;
    border-radius: 4px;
    cursor: pointer;
    position: relative;
}

/* trigger jak nagłówek koszyka */
.wishlistbutton-trigger {
    display: flex;
    align-items: center;
    gap: 5px;
    color: #333;
}

.wishlistbutton-trigger:hover {
    color: rgb(255, 136, 0) !important;
}

/* dropdown */
.wishlistbutton-dropdown {
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
.wishlistbutton-dropdown ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.wishlistbutton-dropdown li {
    padding: 8px 15px;
    font-weight: 600;
}

.wishlistbutton-dropdown li:hover {
    background: #f5f5f5;
    cursor: pointer;
}   
</style>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const trigger = document.querySelector('.wishlistbutton-trigger');
    const dropdown = document.querySelector('.wishlistbutton-dropdown');

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

