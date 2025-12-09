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
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{extends file='page.tpl'}

{block name='page_title'}
  {$cms.meta_title}
{/block}

{block name='page_content_container'}
  <section id="content" class="page-content page-cms page-cms-{$cms.id}">

    {block name='cms_content'}
      {if $cms.meta_title == 'Gwarancja'}
    <h2>Nasza gwarancja</h2>
    <p>Kupując w naszym sklepie masz 30 dni na zwrot towaru oraz pełną satysfakcję z zakupu.</p>

    <ul>
      <li>Zwrot bez podania przyczyny</li>
      <li>Wymiana lub naprawa w razie problemów</li>
      <li>Profesjonalna obsługa klienta</li>
    </ul>

  {elseif $cms.meta_title == 'Newsletter'}
        <div class="newsletter-promo">
        <div class="newsletter-promo-text">
          <h3>Każda osoba, która zapisze się do naszego NEWSLETTERA na powitanie otrzyma od nas kod rabatowy o wartości 25zł na pierwsze zakupy!</h3>
          
          <p>Od tej chwili będziesz otrzymywać informacje na temat akcji specjalnych dla subskrybentów, promocjach, wyprzedażach, nowościach, a także wydarzeniach w świecie turystycznym.</p>
          
          <p>Wpisz swój adres w pola na stronie.</p>
          
          <h4>Jak wykorzystać kod?</h4>
          
          <p>Twój kod działa na wszystkie produkty (przecenione i nieprzecenione) i można go zrealizować w zamówieniach o wartości min. 100zł w sklepie internetowym, lub wydrukuj swój kod rabatowy i zrób zakupy w sklepie stacjonarnym na takich samych zasadach.</p>
          
          <p>Kod rabatowy nie łączy się z innymi akcjami promocyjnymi organizowanymi przez sklep.</p>
        </div>
        <div class="newsletter-promo-image">
          <a href="{$cms.link}">
            <img src="{$urls.base_url}img/bon.png" alt="Kod rabatowy newsletter" class="newsletter-promo-img">
          </a>
        </div>
      </div>
        <h2>Newsletter</h2>

      <div class="newsletter-container">
        <div class="newsletter-header">
          <p class="newsletter-intro">
Wpisz swój adres e-mail i kliknij odpowiedni przycisk, aby zapisać się lub wypisać z naszego newslettera.</p>
        </div>

        <div class="newsletter-content">
          <form action="{$urls.base_url}module/ps_emailsubscription/subscription" method="post" class="newsletter-form">
            <div class="form-group">
              <input
                id="email-newsletter-1"
                class="form-control email-input"
                name="email"
                type="email"
                placeholder="Wprowadź swój adres e-mail"
                required
              >
              <span class="form-control-feedback">*</span>
            </div>

            <div class="form-group">
              <input
                id="email-newsletter-2"
                class="form-control email-input"
                name="email_confirm"
                type="email"
                placeholder="Potwierdź swój adres e-mail"
                required
              >
              <span class="form-control-feedback">*</span>
            </div>

            <div class="form-group checkbox-group">
              <input type="checkbox" class="form-check-input" id="agree-newsletter" name="agree_newsletter" value="1" required>
              <label class="form-check-label" for="agree-newsletter">
               Chcę otrzymywać E-mail Newsletter. Wyrażam zgodę na przetwarzanie moich danych osobowych do celów marketingowych zgodnie z <a href="https://www.tuttu.pl/pol-privacy-and-cookie-notice.html">polityką prywatności</a>.
              </label>
            </div>

            <div class="form-actions">
              <button type="submit" class="btn btn-primary subscribe-btn" name="action" value="subscribe">
                Zapisz się
              </button>
              <button type="submit" class="btn btn-secondary unsubscribe-btn" name="action" value="unsubscribe">
                Wypisz się
              </button>
            </div>

            <input type="hidden" name="action" value="subscribe">
          </form>
        </div>
      </div>


  {else}
    {$cms.content nofilter}
  {/if}

    {/block}

    {block name='hook_cms_dispute_information'}
      {hook h='displayCMSDisputeInformation'}
    {/block}

    {block name='hook_cms_print_button'}
      {hook h='displayCMSPrintButton'}
    {/block}

  </section>
{/block}
