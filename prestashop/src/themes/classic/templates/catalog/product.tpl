{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *}

{extends file=$layout}

{block name='head' append}
  <meta property="og:type" content="product">
  {if $product.cover}
    <meta property="og:image" content="{$product.cover.large.url}">
  {/if}

  {if $product.show_price}
    <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
    <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
    <meta property="product:price:amount" content="{$product.price_amount}">
    <meta property="product:price:currency" content="{$currency.iso_code}">
  {/if}
  {if isset($product.weight) && ($product.weight != 0)}
    <meta property="product:weight:value" content="{$product.weight}">
    <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='head_microdata_special'}
  {include file='_partials/microdata/product-jsonld.tpl'}
{/block}

{block name='content'}
  <section id="main" class="tuttu-product-page">
    <meta content="{$product.url}">

    <div class="tuttu-product-main">
      <div class="row product-container js-product-container tuttu-product-main-row">
        <div class="col-md-6 tuttu-product-gallery">
          <div class="tuttu-product-gallery-inner">
            {block name='page_content_container'}
              <section class="page-content" id="content">
                {block name='page_content'}
                  {include file='catalog/_partials/product-flags.tpl'}

                  {block name='product_cover_thumbnails'}
                    {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                  {/block}

                  <div class="scroll-box-arrows">
                    <i class="material-icons left">&#xE314;</i>
                    <i class="material-icons right">&#xE315;</i>
                  </div>
                {/block}
              </section>
            {/block}
          </div>
        </div>

        <div class="col-md-6 tuttu-product-info">
          <div class="tuttu-product-info-inner">
            {if isset($product_manufacturer->id)}
              <div class="tuttu-product-brand">
                {if isset($product_brand_url)}
                  <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
                {else}
                  {$product_manufacturer->name}
                {/if}
              </div>
            {/if}

            {block name='page_header_container'}
              {block name='page_header'}
                <h1 class="h1 tuttu-product-title">
                  {block name='page_title'}{$product.name}{/block}
                </h1>
              {/block}
            {/block}

            {if isset($product.reference_to_display) && $product.reference_to_display neq ''}
              <div class="tuttu-product-ref">
                {l s='Kod produktu:' d='Shop.Theme.Catalog'} <span>{$product.reference_to_display}</span>
              </div>
            {/if}

            <div class="product-information">
              {block name='product_description_short'}
                <div id="product-description-short-{$product.id}" class="product-description tuttu-product-short">
                  {$product.description_short nofilter}
                </div>
              {/block}

              {if $product.is_customizable && count($product.customizations.fields)}
                {block name='product_customization'}
                  {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
                {/block}
              {/if}

              <div class="product-actions js-product-actions tuttu-product-actions">
                {block name='product_buy'}
                  <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                    <input type="hidden" name="token" value="{$static_token}">
                    <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                    <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id" class="js-product-customization-id">

                    {block name='product_variants'}
                      {include file='catalog/_partials/product-variants.tpl'}
                    {/block}

                    <div class="tuttu-product-prices">
                      {block name='product_prices'}
                        {include file='catalog/_partials/product-prices.tpl'}
                      {/block}
                    </div>

                    {block name='product_pack'}
                      {if $packItems}
                        <section class="product-pack">
                          <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</p>
                          {foreach from=$packItems item="product_pack"}
                            {block name='product_miniature'}
                              {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                            {/block}
                          {/foreach}
                        </section>
                      {/if}
                    {/block}

                    {block name='product_discounts'}
                      {include file='catalog/_partials/product-discounts.tpl'}
                    {/block}

                    <div class="tuttu-product-atc">
                      {block name='product_add_to_cart'}
                        {include file='catalog/_partials/product-add-to-cart.tpl'}
                      {/block}

                      {block name='product_buy_now'}
                        <button
                          type="submit"
                          name="add"
                          value="1"
                          class="btn tuttu-btn-buy-now"
                        >
                          {l s='Kup teraz' d='Shop.Theme.Actions'}
                        </button>
                      {/block}

                      <div class="tuttu-product-shipping">
                        <div class="tuttu-availability">
                          <span class="tuttu-availability-dot" aria-hidden="true"></span>
                          <span>{l s='Produkt dostępny. Wysyłka w piątek' d='Shop.Theme.Catalog'}</span>
                        </div>
                        <ul class="tuttu-delivery-list">
                          <li>
                            <a href="{$urls.pages.stores}">
                              {l s='Sprawdź dostępność w naszych sklepach stacjonarnych' d='Shop.Theme.Catalog'}
                            </a>
                          </li>
                          <li>{l s='Darmowa i szybka dostawa' d='Shop.Theme.Catalog'}</li>
                          <li>{l s='Zwrot do 30 dni' d='Shop.Theme.Catalog'}</li>
                        </ul>
                      </div>
                    </div>

                    <div class="tuttu-product-additional">
                      {block name='product_additional_info'}
                        {include file='catalog/_partials/product-additional-info.tpl'}
                      {/block}
                    </div>

                    {block name='product_refresh'}{/block}
                  </form>
                {/block}
              </div>
            </div>
          </div>
        </div>
      </div>

      {block name='product_tabs'}
        <div class="tuttu-product-tabs">
          <div class="row tuttu-product-details-row">
            <div class="col-lg-7 tuttu-product-details-main">
              {if $product.description}
                <h3 class="tuttu-details-title">{l s='Szczegóły' d='Shop.Theme.Catalog'}</h3>
                {block name='product_description'}
                  <div class="product-description">
                    {$product.description nofilter}
                  </div>
                {/block}
              {/if}

              {block name='product_attachments'}
                {if $product.attachments}
                  <section class="product-attachments">
                    <p class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</p>
                    {foreach from=$product.attachments item=attachment}
                      <div class="attachment">
                        <h4>
                          <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                            {$attachment.name}
                          </a>
                        </h4>
                        <p>{$attachment.description}</p>
                        <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                          {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                        </a>
                      </div>
                    {/foreach}
                  </section>
                {/if}
              {/block}

              {foreach from=$product.extraContent item=extra key=extraKey}
                <section class="tuttu-product-extra {$extra.attr.class}">
                  <h4>{$extra.title}</h4>
                  {$extra.content nofilter}
                </section>
              {/foreach}
            </div>

            <div class="col-lg-5 tuttu-product-details-side">
              {if $product.grouped_features || isset($product_manufacturer->id) || $product.weight || $product.ean13 || $product.reference_to_display}
                <div class="tuttu-params-card">
                  <h3>{l s='Parametry' d='Shop.Theme.Catalog'}</h3>
                  <dl class="tuttu-params">
                    {if isset($product_manufacturer->id)}
                      <dt>{l s='Marka' d='Shop.Theme.Catalog'}</dt>
                      <dd>{$product_manufacturer->name}</dd>
                    {/if}
                    {if $product.weight}
                      <dt>{l s='Waga' d='Shop.Theme.Catalog'}</dt>
                      <dd>{$product.weight} {$product.weight_unit}</dd>
                    {/if}
                    {if $product.ean13}
                      <dt>{l s='Kod EAN' d='Shop.Theme.Catalog'}</dt>
                      <dd>{$product.ean13}</dd>
                    {/if}
                    {if isset($product.reference_to_display) && $product.reference_to_display neq ''}
                      <dt>{l s='Kod produktu' d='Shop.Theme.Catalog'}</dt>
                      <dd>{$product.reference_to_display}</dd>
                    {/if}
                    {if $product.grouped_features}
                      {foreach from=$product.grouped_features item=feature}
                        <dt>{$feature.name}</dt>
                        <dd>{$feature.value|escape:'htmlall'|nl2br nofilter}</dd>
                      {/foreach}
                    {/if}
                  </dl>
                </div>
              {/if}

              <div class="tuttu-checklist-box">
                <div class="tuttu-checklist-text">
                  <strong>{l s='Sprawdź czy masz wszystko' d='Shop.Theme.Catalog'}</strong>
                  <span>{l s='na wyjazd w góry, kajak, trekking, narty' d='Shop.Theme.Catalog'}</span>
                </div>
                <span class="tuttu-checklist-graphic" aria-hidden="true"></span>
              </div>

              {if $accessories}
                <div class="tuttu-accessories">
                  <h3>{l s='Zerknij też na to:' d='Shop.Theme.Catalog'}</h3>
                  <ul class="tuttu-accessories-list">
                    {foreach from=$accessories item="product_accessory"}
                      <li class="tuttu-accessories-item">
                        <a href="{$product_accessory.url}" class="tuttu-accessories-thumb">
                          {if $product_accessory.cover}
                            <img
                              src="{$product_accessory.cover.bySize.home_default.url}"
                              alt="{if !empty($product_accessory.cover.legend)}{$product_accessory.cover.legend}{else}{$product_accessory.name|truncate:30:'...'}{/if}"
                              loading="lazy"
                            />
                          {else}
                            <img
                              src="{$urls.no_picture_image.bySize.home_default.url}"
                              alt="{$product_accessory.name|truncate:30:'...'}"
                              loading="lazy"
                            />
                          {/if}
                        </a>
                        <div class="tuttu-accessories-info">
                          <a href="{$product_accessory.url}" class="tuttu-accessories-name">{$product_accessory.name|truncate:45:'...'}</a>
                        </div>
                        {if $product_accessory.show_price}
                          <span class="tuttu-accessories-price">{$product_accessory.price}</span>
                        {/if}
                      </li>
                    {/foreach}
                  </ul>
                </div>
              {/if}
            </div>
          </div>
        </div>
      {/block}
    </div>

    {block name='product_accessories'}{/block}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>
{/block}
