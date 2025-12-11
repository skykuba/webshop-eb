{**
 * Template: CMS Main Section 2
 * Description: Sekcja "O nas" i social media, zmniejszone czcionki
 * Author: Tuttu
 *}

<style>
  #main_cms2 ul.firm_describe__group {
    display: grid;
    margin-bottom: 60px;
    margin-top: 40px;
    padding: 0;
  }

  .odstep {
  height: 50px;
  }

  #main_cms2 ul.firm_describe__group .firm_describe__item {
    display: flex;
    flex-direction: column;
  }

  #main_cms2 ul.firm_describe__group .firm_describe__item .firm_headline {
    font-size: 1.4rem;
    font-weight: 700;
    margin-bottom: 1rem;
  }

  #main_cms2 ul.firm_describe__group .firm_describe__item .firm_text {
    font-size: 13px;
    font-weight: 400;
    line-height: 18px;
  }

  @media (min-width: 1200px) {
    #main_cms2 ul.firm_describe__group {
      grid-template-columns: 1fr 1fr 1fr;
      grid-column-gap: 3rem;
      margin-bottom: 2rem;
    }
  }

  /* social media */
  #main_cms2 .social_media__group {
    display: flex;
    flex-direction: column;
    margin-top: 2rem;
  }

  #main_cms2 .social_media__group .social_media__headline {
    font-size: 1.4rem;
    font-weight: 700;
    margin-bottom: 1rem;
  }

  #main_cms2 .social_media__group .social_media__list {
    display: flex;
    gap: 1rem;
    align-items: center;
  }

  #main_cms2 .social_media__group .social_media__list .social_media__item a {
    height: 3.4rem;
    display: flex;
    width: 3.4rem;
    justify-content: center;
    align-items: center;
    border-radius: 8px;
    background: #f39c12;
  }

  @media (min-width: 757px) {
    #main_cms2 .social_media__group {
      align-items: center;
      flex-direction: row;
    }

    #main_cms2 .social_media__group .social_media__headline {
      margin-right: 2rem;
      margin-bottom: 0;
    }
  }

  #main_cms2 ul {
    padding: 0;
    margin: 0;
  }

  #main_cms2 ul li {
    list-style: none !important;
  }
</style>

<section id="main_cms2">
  <ul class="firm_describe__group">
    <li class="firm_describe__item">
      <span class="firm_headline">Podróże mamy w naturze</span>
      <span class="firm_text">
        Witaj w świecie grenlandzkiego renifera – sklepie turystycznym TUTTU.pl. Poznaj naszą ekipę w akcji! Na blogu relacjonujemy wyprawy, podczas których na własnej skórze testujemy polecany sprzęt
        sportowy i odzież. Inspiruje nas filozofia łączenia pasji z pracą i dbałością o środowisko czołowych producentów outdoorowych, takich jak Patagonia. Na naszej stronie oprócz sklepu online
        znajdziesz także cenne porady, m.in. jaki wybrać śpiwór: syntetyczny czy puchowy, jak naprawić stelaż, zaimpregnować namiot oraz jak dbać o buty trekkingowe, by służyły długie lata.
      </span>
    </li>
    <li class="firm_describe__item">
      <span class="firm_headline">Od stóp do głów</span>
      <span class="firm_text">
        W Tuttu.pl zaopatrzysz zarówno damską jak i męską część szafy na wszelkie outdoorowe okazje, zaczynając od bielizny termoaktywnej na butach kończąc. W chłodne dni z przyjemnością sięgniesz po
        miękki polar Marmot, docenisz szczelność softshella i wodoodporność kurtki Jack Wolfskin z membraną TEXAPORE i obuwia z membraną GORE-TEX®. Latem docenisz spodnie The North Face z możliwością
        odpinania nogawek. Całość uzupełnią niezbędne dodatki: czapka, szalik, chusta wielofunkcyjna, rękawiczki czy pasek do spodni.
      </span>
    </li>
    <li class="firm_describe__item">
      <span class="firm_headline">Gotowi na przygodę</span>
      <span class="firm_text">
        Aby wyruszyć na większość przygód, tych małych, codziennych i większych, wyjątkowych, niezbędny jest odpowiedni ekwipunek. Termos Fjord Nansen sprawi, że będą one miały smak Twojej
        ulubionej kawy lub herbaty. Doświadczeni pracownicy pomogą wybrać sprzęt trekkingowy, wspinaczkowy czy narciarski zarówno początkującym, jak i wytrawnym turystom. W naszym sklepie górskim z
        przyjemnością doradzimy, jak skompletować zestaw do ski tour: narty, wiązania, kijki, dostosowany do Twoich potrzeb i umiejętności. Zapraszamy! Do zobaczenia na szlaku: górskim, kajakowym,
        rowerowym, narciarskim... a może zupełnie jeszcze nieznanym?
      </span>
    </li>
  </ul>

  <div class="social_media__group">
    <span class="social_media__headline">Dołącz do nas na social mediach:</span>
    <ul class="social_media__list">
      <li class="social_media__item">
        <a class="btn --solid" href="https://www.facebook.com/tuttupl">
          <img src="themes/classic/modules/ps_banner/facebook.svg" alt="facebook" height="21" width="10">
        </a>
      </li>
      <li class="social_media__item">
        <a class="btn --solid" href="https://www.instagram.com/tuttu.pl">
          <img src="themes/classic/modules/ps_banner/instagram.svg" alt="instagram" height="21" width="21">
        </a>
      </li>
      <li class="social_media__item --google">
        <div style="text-indent: 0; margin: 0; padding: 0; background: transparent; border-style: none; float: none; line-height: normal; font-size: 1px; vertical-align: baseline; display: inline-block;" id="___ratingbadge_0">
          <iframe ng-non-bindable frameborder="0" hspace="0" marginheight="0" marginwidth="0" scrolling="no" style="position: static; top: 0; width: 146px; margin: 0; border-style: none; display: block; left: 0; visibility: visible; height: 64px;" tabindex="0" vspace="0" width="100%" id="I0_1765387575758" name="I0_1765387575758" src="https://www.google.com/shopping/merchantverse/?usegapi=1&amp;merchant_id=10377840&amp;hl=pl&amp;origin=https%3A%2F%2Fwww.tuttu.pl&amp;gsrc=3p&amp;ic=1&amp;jsh=m%3B%2F_%2Fscs%2Fabc-static%2F_%2Fjs%2Fk%3Dgapi.lb.en.H0R5hnEJFgQ.O%2Fd%3D1%2Frs%3DAHpOoo9sMW3biwZqLR-weMeFfAeYoZsLKA%2Fm%3D__features__#_methods=onPlusOne%2C_ready%2C_close%2C_open%2C_resizeMe%2C_renderstart%2Concircled%2Cdrefresh%2Cerefresh&amp;id=I0_1765387575758&amp;_gfid=I0_1765387575758&amp;parent=https%3A%2F%2Fwww.tuttu.pl&amp;pfname=&amp;rpctoken=33162769" data-gapiattached="true"></iframe>
        </div>
      </li>
    </ul>
  </div>

  <div class="odstep">
  </div>

</section>
