{extends file='page.tpl'}

{block name='page_title'}
  {l s='Log in to your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
<section class="page-authentication-tuttu">
  <div class="tuttu-auth-box">

    {* LEWA KOLUMNA – LOGOWANIE *}
    <div class="tuttu-auth-login">
      <h1 class="tuttu-auth-title">
        {l s='Logowanie' d='Shop.Theme.Customeraccount'}
      </h1>

      {* Ikony social (dekoracja) *}
      <div class="tuttu-auth-socials">
        <button type="button" class="tuttu-auth-social-btn">G</button>
        <button type="button" class="tuttu-auth-social-btn">f</button>
        <button type="button" class="tuttu-auth-social-btn">in</button>
        <button type="button" class="tuttu-auth-social-btn"></button>
      </div>

      <div class="tuttu-auth-separator">
        <span>LUB</span>
      </div>

      {* TU WSTAWIAMY PRAWDZIWY FORMULARZ PRESTASHOP *}
      <div class="tuttu-login-form-wrapper">
        {render file='customer/_partials/login-form.tpl' ui=$login_form}
      </div>

      {block name='display_after_login_form'}
        {hook h='displayCustomerLoginFormAfter'}
      {/block}
    </div>

    {* PRAWA KOLUMNA – REJESTRACJA *}
    <div class="tuttu-auth-register">
      <h2 class="tuttu-auth-title">
        {l s='Rejestracja' d='Shop.Theme.Customeraccount'}
      </h2>
      <p>
        Jeżeli wcześniej nie zakładałeś konta w naszym sklepie,
        zostaniesz poproszony o podanie swoich danych i adresu dostawy.
      </p>

      <a href="{$urls.pages.register}"
         class="btn tuttu-btn-orange tuttu-btn-register">
        ZAŁÓŻ NOWE KONTO
      </a>
    </div>

  </div>
</section>
{/block}
