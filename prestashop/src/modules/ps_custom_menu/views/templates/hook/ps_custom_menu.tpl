<div class="row_custom_module">
    {foreach from=$tiles item=tile}
        <div class="menu_button_wrapper">
            <a href="{$tile.link}" target="_self" title="{$tile.alt}">
                <img src="{$tile.img_desktop}" width="400" height="400" alt="{$tile.alt}">
            </a>
        </div>
    {/foreach}
</div>

<style>
.row_custom_module {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 4 kolumny */
    gap: 10px; /* mniejszy odstęp między obrazkami */
    justify-items: center; /* wycentrowanie obrazków w kolumnach */
    padding-bottom: 50px !important; /* odstęp od sekcji poniżej */
}

.menu_button_wrapper img {
    width: 100%; /* zmniejszenie rozmiaru, żeby lepiej pasowały */
    height: auto;
    display: block;
    border-radius: 15px; /* zaokrąglenie rogów */
}
</style>


