{assign var='customSlides' value=[
    ["img" => "themes/classic/modules/ps_imageslider/views/templates/hook/slide1.png", "url" => "https://localhost/"],
    ["img" => "themes/classic/modules/ps_imageslider/views/templates/hook/slide2.png", "url" => "https://localhost/content/8-gory"],
    ["img" => "themes/classic/modules/ps_imageslider/views/templates/hook/slide3.png", "url" => "https://localhost/content/6-gwarancja"]
]}

<div id="carousel"
     data-ride="carousel"
     class="carousel slide"
     data-interval="4000"
     data-wrap="true"
     data-pause="hover"
     data-touch="true">

  <!-- INDICATORS -->
  <ol class="carousel-indicators">
    {foreach from=$customSlides item=slide key=idx}
      <li data-target="#carousel"
          data-slide-to="{$idx}"
          {if $idx == 0}class="active"{/if}>
      </li>
    {/foreach}
  </ol>

  <!-- SLIDES -->
  <ul class="carousel-inner" role="listbox">
    {foreach from=$customSlides item=slide key=idx name=slidesLoop}
      <li class="carousel-item {if $smarty.foreach.slidesLoop.first}active{/if}">
        <a href="{$slide.url}">
          <figure>
            <img src="{$slide.img}"
                 alt="Slide {$idx+1}"
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
