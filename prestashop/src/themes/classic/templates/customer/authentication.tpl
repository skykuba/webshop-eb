{extends file='page.tpl'}

{block name='page_title'}{/block}

{block name='page_content'}
<section class="page-authentication-tuttu">
  <div class="tuttu-auth-top">
    <div class="tuttu-auth-logo">
      {if $shop.logo_details}
        <a href="{$urls.pages.index}">
          <img
            class="logo img-fluid"
            src="{$shop.logo_details.src}"
            alt="{$shop.name}"
            width="{$shop.logo_details.width}"
            height="{$shop.logo_details.height}">
        </a>
      {else}
        {$shop.name}
      {/if}
    </div>
  </div>

  <div class="tuttu-auth-box">

    {* LEWA KOLUMNA – LOGOWANIE *}
    <div class="tuttu-auth-login">
      <h1 class="tuttu-auth-title">
        {l s='Logowanie' d='Shop.Theme.Customeraccount'}
      </h1>

      {* Ikony social (dekoracja) *}
      <div class="tuttu-auth-socials">
        <button type="button" class="tuttu-auth-social-btn" aria-label="Google">
          <svg class="tuttu-auth-social-icon tuttu-auth-social-icon--google" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
            <path fill="#4285F4" d="M23.49 12.27c0-.82-.07-1.6-.2-2.36H12v4.47h6.45a5.52 5.52 0 0 1-2.39 3.62v3h3.86c2.26-2.08 3.57-5.15 3.57-8.73z"/>
            <path fill="#34A853" d="M12 24c3.24 0 5.96-1.08 7.95-2.93l-3.86-3c-1.07.72-2.44 1.15-4.09 1.15-3.14 0-5.79-2.12-6.74-4.97H1.29v3.12A12 12 0 0 0 12 24z"/>
            <path fill="#FBBC05" d="M5.26 14.25A7.2 7.2 0 0 1 4.88 12c0-.78.14-1.53.38-2.25V6.63H1.29A12 12 0 0 0 0 12c0 1.94.47 3.77 1.29 5.37l3.97-3.12z"/>
            <path fill="#EA4335" d="M12 4.75c1.76 0 3.34.6 4.58 1.78l3.44-3.44C17.95 1.08 15.24 0 12 0 7.31 0 3.3 2.69 1.29 6.63l3.97 3.12C6.21 6.87 8.86 4.75 12 4.75z"/>
          </svg>
        </button>
        <button type="button" class="tuttu-auth-social-btn tuttu-auth-social-btn--facebook" aria-label="Facebook">
          <svg class="tuttu-auth-social-icon" viewBox="0 0 320 512" aria-hidden="true" focusable="false">
            <path fill="#1877F2" d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"/>
          </svg>
        </button>
        <button type="button" class="tuttu-auth-social-btn tuttu-auth-social-btn--linkedin" aria-label="LinkedIn">in</button>
        <button type="button" class="tuttu-auth-social-btn" aria-label="Apple">
          <svg class="tuttu-auth-social-icon" viewBox="0 0 24 24" aria-hidden="true" focusable="false">
            <path d="M16.365 1.43c0 1.14-.414 2.19-1.19 2.99-.78.82-2.04 1.45-3.15 1.36-.12-1.11.45-2.28 1.2-3.02.83-.82 2.21-1.42 3.14-1.33zM20.62 17.58c-.46 1.04-.67 1.5-1.26 2.42-.82 1.27-1.98 2.86-3.41 2.88-1.27.02-1.6-.82-3.33-.82-1.72 0-2.1.8-3.35.84-1.43.03-2.52-1.45-3.34-2.72-2.3-3.56-2.54-7.74-1.12-9.92 1-1.54 2.58-2.44 4.04-2.44 1.44 0 2.35.86 3.35.86 1 0 1.62-.87 3.33-.87 1.3 0 2.67.72 3.66 1.96-3.23 1.77-2.7 6.27.43 7.81z"/>
          </svg>
        </button>
      </div>

      <div class="tuttu-auth-separator">
        <span>LUB</span>
      </div>

      {* TU WSTAWIAMY PRAWDZIWY FORMULARZ PRESTASHOP *}
      <div class="tuttu-login-panels">
        <div id="forgot-password" class="tuttu-forgot-password">
          <form action="{$urls.pages.password}" class="forgotten-password" method="post">
            <header>
              <p class="send-renew-password-link">
                {l s='Na Twój adres zostanie wysłany e-mail, który pozwala na automatyczne zalogowanie się. Zmiana hasła będzie możliwa po zalogowaniu na stronie edycji Twoich danych.' d='Shop.Theme.Customeraccount'}
              </p>
            </header>

            <section class="form-fields">
              <div class="form-group center-email-fields">
                <label class="col-md-3 form-control-label required">{l s='Email address' d='Shop.Forms.Labels'}</label>
              <div class="col-md-5 email">
                <input type="email" name="email" id="email" class="form-control" placeholder="{l s='Adres e-mail' d='Shop.Forms.Labels'}" required>
                <p class="forgotten-password-help">
                  {l s='Podaj adres e-mail, login lub numer karty stałego klienta użyty podczas rejestracji' d='Shop.Theme.Customeraccount'}
                </p>
              </div>
              </div>
              <div class="form-group reset-actions">
                <div class="col-md-5 offset-md-3">
                  <button id="send-reset-link" class="form-control-submit btn tuttu-btn-orange hidden-xs-down" name="submit" type="submit">
                    {l s='Przypomnij hasło' d='Shop.Theme.Actions'}
                  </button>
                  <button class="form-control-submit btn tuttu-btn-orange hidden-sm-up" name="submit" type="submit">
                    {l s='Przypomnij hasło' d='Shop.Theme.Actions'}
                  </button>
                  <a href="#login-panel" class="back-to-login-link">
                    {l s='Wróć do standardowego logowania' d='Shop.Theme.Actions'}
                  </a>
                </div>
              </div>
            </section>
          </form>
        </div>

        <div id="login-panel" class="tuttu-login-form-wrapper">
          <div class="tuttu-login-form">
            {render file='customer/_partials/login-form.tpl' ui=$login_form}
          </div>
        </div>
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
      <p class="tuttu-auth-register-text">
        Jeżeli wcześniej nie zakładałeś konta w naszym sklepie,
        zostaniesz poproszony o podanie swoich danych i adresu dostawy.
      </p>

      <a href="{$urls.pages.register}"
         class="btn tuttu-btn-orange tuttu-btn-register">
        ZAŁÓŻ NOWE KONTO
      </a>
    </div>

  </div>
  <div class="tuttu-auth-contact">
    <a href="tel:514514055" class="tuttu-auth-contact__item">514 514 055</a>
    <span class="tuttu-auth-contact__sep">|</span>
    <a href="tel:327782221" class="tuttu-auth-contact__item tuttu-auth-contact__item--no-underline">32 778 22 21</a>
    <span class="tuttu-auth-contact__sep">|</span>
    <a href="mailto:bok@tuttu.pl" class="tuttu-auth-contact__item">bok@tuttu.pl</a>
    <span class="tuttu-auth-contact__sep">|</span>
    <span class="tuttu-auth-contact__item tuttu-auth-contact__item--no-underline">TUTTU.pl, Kościuszki 8, 40-049 Katowice</span>
  </div>
</section>
{/block}
