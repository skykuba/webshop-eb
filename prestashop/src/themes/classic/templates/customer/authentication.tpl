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



        <button class="btn tuttu-btn-orange tuttu-btn-login" type="submit">
          ZALOGUJ SIĘ
        </button>

        <div class="tuttu-auth-forgot text-center">
                  <a href="{$urls.pages.password}">
                    Nie pamiętam loginu lub hasła
                  </a>
        </div>
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
