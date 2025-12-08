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
  {l s='Logowanie' d='Shop.Theme.CustomerAccount'}
{/block}

{block name='page_content'}
<section class="page-authentication-tuttu">
  <div class="tuttu-auth-box">

    {* LEWA KOLUMNA – LOGOWANIE *}
    <div class="tuttu-auth-login">
      <h1 class="tuttu-auth-title">Logowanie</h1>

      {* Ikony social (na razie tylko „atrappa”) *}
      <div class="tuttu-auth-socials">
        <button type="button" class="tuttu-auth-social-btn">G</button>
        <button type="button" class="tuttu-auth-social-btn">f</button>
        <button type="button" class="tuttu-auth-social-btn">in</button>
        <button type="button" class="tuttu-auth-social-btn"></button>
      </div>

      <div class="tuttu-auth-separator">
        <span>LUB</span>
      </div>

      {* WŁAŚCIWY FORMULARZ LOGOWANIA *}
      <form id="login-form"
            class="tuttu-login-form"
            action="{$urls.pages.authentication}"
            method="post">
        <input type="hidden" name="back" value="{$back}">
        <input type="hidden" name="submitLogin" value="1">

        <div class="form-group">
          <input
            class="form-control tuttu-input"
            type="text"
            name="email"
            value="{$email}"
            placeholder="Login / Nr karty stałego klienta / E-mail"
          >
        </div>

        <div class="form-group">
          <input
            class="form-control tuttu-input"
            type="password"
            name="password"
            placeholder="Hasło / Pin karty stałego klienta"
          >
        </div>

        <div class="tuttu-auth-forgot text-center">
          <a href="{$urls.pages.password}">
            Nie pamiętam loginu lub hasła
          </a>
        </div>

        <button class="btn tuttu-btn-orange tuttu-btn-login" type="submit">
          ZALOGUJ SIĘ
        </button>
      </form>
    </div>

    {* PRAWA KOLUMNA – REJESTRACJA *}
    <div class="tuttu-auth-register">
      <h2 class="tuttu-auth-title">Rejestracja</h2>
      <p>
        Jeżeli wcześniej nie zakładałeś konta w naszym sklepie,
        zostaniesz poproszony o podanie swoich danych i adresu dostawy.
      </p>

      <a href="{$urls.pages.registration}"
         class="btn tuttu-btn-orange tuttu-btn-register">
        ZAŁÓŻ NOWE KONTO
      </a>
    </div>

  </div>
</section>
{/block}
