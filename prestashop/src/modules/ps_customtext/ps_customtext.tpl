{assign var="brands" value=[
    ["title"=>"Black Diamond", "img"=>"/modules/ps_customtext/1685107103.webp"],
    ["title"=>"Jack Wolfskin", "img"=>"modules/ps_customtext/1685107242.webp"],
    ["title"=>"Fjord Nansen", "img"=>"modules/ps_customtext/1685107294.webp"],
    ["title"=>"Dynafit", "img"=>"modules/ps_customtext/1685107383.webp"],
    ["title"=>"Meindl", "img"=>"modules/ps_customtext/1685107425.webp"],
    ["title"=>"Patagonia", "img"=>"modules/ps_customtext/1685107464.webp"],
    ["title"=>"Petzl", "img"=>"modules/ps_customtext/1685107511.webp"],
    ["title"=>"Salewa", "img"=>"modules/ps_customtext/1685107548.webp"],
    ["title"=>"Rab", "img"=>"modules/ps_customtext/1685107590.webp"],
    ["title"=>"Gregory", "img"=>"/modules/ps_customtext/1685107626.webp"]
]}

<section id="brands_slider">
    <div class="brands_wrapper">

        {foreach from=$brands item=brand}
            <div class="brand_item">
                <img src="{$brand.img}" width="150" height="150" alt="{$brand.title}">
            </div>
        {/foreach}

    </div>
</section>

<style>
#brands_slider {
    width: 100%;
    margin: 20px auto;
    background: #fff;
}

.brands_wrapper {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    justify-content: center;
}

.brand_item {
    width: 150px;
    height: 150px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.brand_item img {
    width: 100%;
    height: 100%;
    object-fit: contain;
    transition: transform .3s ease;
}

.brand_item:hover img {
    transform: scale(1.05);
}
</style>
