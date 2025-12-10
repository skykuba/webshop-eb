{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 * NOTICE OF LICENSE
 * (… oryginalny nagłówek …)
 *}

{assign var='sliderImages' value=[
  'slide1.png',
  'slide2.png',
  'slide3.png'
]}

{if $homeslider.slides}
  <div id="carousel"
       data-ride="carousel"
       class="carousel slide"
       data-interval="{$homeslider.speed}"
       data-wrap="{(string)$homeslider.wrap}"
       data-pause="{$homeslider.pause}"
       data-touch="true">

    <!-- INDICATORS -->
    <ol class="carousel-indicators">
      {foreach from=$homeslider.slides item=slide key=idx name='indicators'}
        <li data-target="#carousel"
            data-slide-to="{$idx}"
            {if $idx == 0}class="active"{/if}></li>
      {/foreach}
    </ol>

    <!-- SLIDES -->
    <ul class="carousel-inner" role="listbox" aria-label="{l s='Carousel container' d='Shop.Theme.Global'}">
      {foreach from=$homeslider.slides item=slide key=idxSlide name='slidesloop'}
        <li class="carousel-item {if $smarty.foreach.slidesloop.first}active{/if}" role="option">

          <a href="{$slide.url}">
            <figure>
              <img src="themes/classic/modules/ps_imageslider/views/templates/hook/{$sliderImages[$idxSlide]}"
                   alt="Slide {$idxSlide+1}"
                   width="1110"
                   height="100">
            </figure>
          </a>

        </li>
      {/foreach}
    </ul>

    <!-- ARROWS -->
    <div class="direction">
      <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
        <span class="icon-prev hidden-xs"><i class="material-icons">&#xE5CB;</i></span>
      </a>
      <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
        <span class="icon-next"><i class="material-icons">&#xE5CC;</i></span>
      </a>
    </div>

  </div>
{/if}
