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

    {else if $cms.meta_title == 'Lista-Zakupowa'}
    {hook h="displayMyWishlist"}


    {else if $cms.meta_title == "Gdansk"}
    <div class="stock_cms_label big_label">
  <span class="stock_cms_label">Informacje o punkcie odbioru</span>
</div>

<div class="stock_info_box">

  <!-- SEKCJA KONTAKTOWA -->
  <div class="stock_section">
    <h2 class="stock_title">TUTTU Gdańsk</h2>

    <div class="stock_row"><strong>Adres:</strong> ul. Jaśkowa Dolina 14, 80-252 Gdańsk</div>
    <div class="stock_row"><strong>Telefon:</strong> <a href="tel:583414205">58 341 42 05</a></div>
    <div class="stock_row"><strong>Email:</strong> <a href="mailto:gdansk@tuttu.pl">gdansk@tuttu.pl</a></div>

    <a class="btn --solid show_on_map" href="https://maps.google.com/maps?q=80-252+Gdańsk+Wrzeszcz+ul.Jaśkowa+Dolina+14">
      <i class="icon-globe"></i><span>Pokaż na mapie</span>
    </a>
  </div>

  <hr>

  <!-- GODZINY OTWARCIA -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Godziny otwarcia</h3>
    <div class="stock_hours">
      <div><span>Poniedziałek</span> <strong>10:00–18:00</strong></div>
      <div><span>Wtorek</span> <strong>10:00–18:00</strong></div>
      <div><span>Środa</span> <strong>10:00–18:00</strong></div>
      <div><span>Czwartek</span> <strong>10:00–19:00</strong></div>
      <div><span>Piątek</span> <strong>10:00–18:00</strong></div>
      <div><span>Sobota</span> <strong>10:00–16:00</strong></div>
      <div><span>Niedziela</span> <strong>Nieczynne</strong></div>
    </div>
  </div>

  <hr>

  <!-- DOJAZD -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Jak dojechać?</h3>

    <p><strong>🚗 Samochodem</strong><br>
      Sklep znajduje się w <strong>Strefie Płatnego Parkowania</strong> (pon–pt 9:00–17:00).  
      Najwygodniejsze parkowanie: <strong>CH Manhattan</strong>, pierwsze 30 min BEZPŁATNE.
    </p>

    <p><strong>🚋 Tramwajem</strong><br>
      Przystanek: <em>Gdańsk Wrzeszcz Jaśkowa Dolina 02</em> → linie 2, 3, 4, 5, 6, 8, 9, 12  
      Rozkład: <a href="https://ztm.gda.pl/rozklady/" target="_blank">ztm.gda.pl</a>
    </p>

    <p><strong>🚌 Autobusem</strong><br>
      • Gdańsk Sobótki → 162, 262<br>
      • Jaśkowa Dolina 05 → 127, 162, 262<br>
      • Jaśkowa Dolina 04 → 115, 168, 199  
    </p>

    <p><strong>🚆 SKM / PKP</strong><br>
      Od stacji Gdańsk-Wrzeszcz ok. <strong>800 m pieszo</strong>.  
      Rozkłady:  
      <a href="https://www.skm.pkp.pl/" target="_blank">SKM</a> •  
      <a href="https://mt.rozklad-pkp.pl/" target="_blank">PKP</a>
    </p>
  </div>

  <hr>

  <!-- MAPA -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Mapa</h3>
    <iframe 
      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2323.855025083679!2d18.60497501587761!3d54.377211180208086!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x4db470adaf488205!2sTUTTU!5e0!3m2!1spl!2sus!4v1467622312895"
      width="100%" height="350" frameborder="0" style="border:0" allowfullscreen>
    </iframe>
  </div>

  <hr>

  <!-- WYPOŻYCZALNIA -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Wypożyczalnia sprzętu</h3>
    <p><a>
      Rakiety śnieżne, nosidełka, sprzęt turystyczny
    </a></p>
  </div>

</div>

<style>
.stock_info_box { padding: 20px; }
.stock_section { margin-bottom: 25px; }
.stock_title { font-size: 26px; margin-bottom: 10px; }
.stock_row { margin: 4px 0; }
.stock_subtitle { margin-bottom: 10px; font-size: 20px; }
.stock_hours div { display:flex; justify-content:space-between; padding:4px 0; }
</style>


{else if $cms.meta_title == "Warszawa"}
    <div class="stock_cms_label big_label">
  <span class="stock_cms_label">Informacje o punkcie odbioru</span>
</div>

<div class="stock_info_box">

  <!-- SEKCJA KONTAKTOWA -->
  <div class="stock_section">
    <h2 class="stock_title">TUTTU Warszawa</h2>

    <div class="stock_row"><strong>Adres:</strong> ul. Jaśkowa Dolina 14, 80-252 Gdańsk</div>
    <div class="stock_row"><strong>Telefon:</strong> <a href="tel:583414205">58 341 42 05</a></div>
    <div class="stock_row"><strong>Email:</strong> <a href="mailto:gdansk@tuttu.pl">gdansk@tuttu.pl</a></div>

    <a class="btn --solid show_on_map" href="https://maps.google.com/maps?q=80-252+Gdańsk+Wrzeszcz+ul.Jaśkowa+Dolina+14">
      <i class="icon-globe"></i><span>Pokaż na mapie</span>
    </a>
  </div>

  <hr>

  <!-- GODZINY OTWARCIA -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Godziny otwarcia</h3>
    <div class="stock_hours">
      <div><span>Poniedziałek</span> <strong>10:00–18:00</strong></div>
      <div><span>Wtorek</span> <strong>10:00–18:00</strong></div>
      <div><span>Środa</span> <strong>10:00–18:00</strong></div>
      <div><span>Czwartek</span> <strong>10:00–19:00</strong></div>
      <div><span>Piątek</span> <strong>10:00–18:00</strong></div>
      <div><span>Sobota</span> <strong>10:00–16:00</strong></div>
      <div><span>Niedziela</span> <strong>Nieczynne</strong></div>
    </div>
  </div>

  <hr>

  <!-- DOJAZD -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Jak dojechać?</h3>

    <p><strong>🚗 Samochodem</strong><br>
      Sklep znajduje się w <strong>Strefie Płatnego Parkowania</strong> (pon–pt 9:00–17:00).  
      Najwygodniejsze parkowanie: <strong>CH Manhattan</strong>, pierwsze 30 min BEZPŁATNE.
    </p>

    <p><strong>🚋 Tramwajem</strong><br>
      Przystanek: <em>Gdańsk Wrzeszcz Jaśkowa Dolina 02</em> → linie 2, 3, 4, 5, 6, 8, 9, 12  
      Rozkład: <a href="https://ztm.gda.pl/rozklady/" target="_blank">ztm.gda.pl</a>
    </p>

    <p><strong>🚌 Autobusem</strong><br>
      • Gdańsk Sobótki → 162, 262<br>
      • Jaśkowa Dolina 05 → 127, 162, 262<br>
      • Jaśkowa Dolina 04 → 115, 168, 199  
    </p>

    <p><strong>🚆 SKM / PKP</strong><br>
      Od stacji Gdańsk-Wrzeszcz ok. <strong>800 m pieszo</strong>.  
      Rozkłady:  
      <a href="https://www.skm.pkp.pl/" target="_blank">SKM</a> •  
      <a href="https://mt.rozklad-pkp.pl/" target="_blank">PKP</a>
    </p>
  </div>

  <hr>

  <!-- MAPA -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Mapa</h3>
    <iframe 
      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2323.855025083679!2d18.60497501587761!3d54.377211180208086!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x4db470adaf488205!2sTUTTU!5e0!3m2!1spl!2sus!4v1467622312895"
      width="100%" height="350" frameborder="0" style="border:0" allowfullscreen>
    </iframe>
  </div>

  <hr>

  <!-- WYPOŻYCZALNIA -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Wypożyczalnia sprzętu</h3>
    <p><a>
      Rakiety śnieżne, nosidełka, sprzęt turystyczny
    </a></p>
  </div>

</div>

<style>
.stock_info_box { padding: 20px; }
.stock_section { margin-bottom: 25px; }
.stock_title { font-size: 26px; margin-bottom: 10px; }
.stock_row { margin: 4px 0; }
.stock_subtitle { margin-bottom: 10px; font-size: 20px; }
.stock_hours div { display:flex; justify-content:space-between; padding:4px 0; }
</style>

{else if $cms.meta_title == "Wroclaw"}
    <div class="stock_cms_label big_label">
  <span class="stock_cms_label">Informacje o punkcie odbioru</span>
</div>

<div class="stock_info_box">

  <!-- SEKCJA KONTAKTOWA -->
  <div class="stock_section">
    <h2 class="stock_title">TUTTU Wrocław</h2>

    <div class="stock_row"><strong>Adres:</strong> ul. Jaśkowa Dolina 14, 80-252 Gdańsk</div>
    <div class="stock_row"><strong>Telefon:</strong> <a href="tel:583414205">58 341 42 05</a></div>
    <div class="stock_row"><strong>Email:</strong> <a href="mailto:gdansk@tuttu.pl">gdansk@tuttu.pl</a></div>

    <a class="btn --solid show_on_map" href="https://maps.google.com/maps?q=80-252+Gdańsk+Wrzeszcz+ul.Jaśkowa+Dolina+14">
      <i class="icon-globe"></i><span>Pokaż na mapie</span>
    </a>
  </div>

  <hr>

  <!-- GODZINY OTWARCIA -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Godziny otwarcia</h3>
    <div class="stock_hours">
      <div><span>Poniedziałek</span> <strong>10:00–18:00</strong></div>
      <div><span>Wtorek</span> <strong>10:00–18:00</strong></div>
      <div><span>Środa</span> <strong>10:00–18:00</strong></div>
      <div><span>Czwartek</span> <strong>10:00–19:00</strong></div>
      <div><span>Piątek</span> <strong>10:00–18:00</strong></div>
      <div><span>Sobota</span> <strong>10:00–16:00</strong></div>
      <div><span>Niedziela</span> <strong>Nieczynne</strong></div>
    </div>
  </div>

  <hr>

  <!-- DOJAZD -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Jak dojechać?</h3>

    <p><strong>🚗 Samochodem</strong><br>
      Sklep znajduje się w <strong>Strefie Płatnego Parkowania</strong> (pon–pt 9:00–17:00).  
      Najwygodniejsze parkowanie: <strong>CH Manhattan</strong>, pierwsze 30 min BEZPŁATNE.
    </p>

    <p><strong>🚋 Tramwajem</strong><br>
      Przystanek: <em>Gdańsk Wrzeszcz Jaśkowa Dolina 02</em> → linie 2, 3, 4, 5, 6, 8, 9, 12  
      Rozkład: <a href="https://ztm.gda.pl/rozklady/" target="_blank">ztm.gda.pl</a>
    </p>

    <p><strong>🚌 Autobusem</strong><br>
      • Gdańsk Sobótki → 162, 262<br>
      • Jaśkowa Dolina 05 → 127, 162, 262<br>
      • Jaśkowa Dolina 04 → 115, 168, 199  
    </p>

    <p><strong>🚆 SKM / PKP</strong><br>
      Od stacji Gdańsk-Wrzeszcz ok. <strong>800 m pieszo</strong>.  
      Rozkłady:  
      <a href="https://www.skm.pkp.pl/" target="_blank">SKM</a> •  
      <a href="https://mt.rozklad-pkp.pl/" target="_blank">PKP</a>
    </p>
  </div>

  <hr>

  <!-- MAPA -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Mapa</h3>
    <iframe 
      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2323.855025083679!2d18.60497501587761!3d54.377211180208086!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x4db470adaf488205!2sTUTTU!5e0!3m2!1spl!2sus!4v1467622312895"
      width="100%" height="350" frameborder="0" style="border:0" allowfullscreen>
    </iframe>
  </div>

  <hr>

  <!-- WYPOŻYCZALNIA -->
  <div class="stock_section">
    <h3 class="stock_subtitle">Wypożyczalnia sprzętu</h3>
    <p><a>
      Rakiety śnieżne, nosidełka, sprzęt turystyczny
    </a></p>
  </div>

</div>

<style>
.stock_info_box { padding: 20px; }
.stock_section { margin-bottom: 25px; }
.stock_title { font-size: 26px; margin-bottom: 10px; }
.stock_row { margin: 4px 0; }
.stock_subtitle { margin-bottom: 10px; font-size: 20px; }
.stock_hours div { display:flex; justify-content:space-between; padding:4px 0; }
</style>

  {else if $cms.meta_title== 'Trekking' }

  <section id="Text" class="text_menu">
  <h1 class="text_menu__label headline">
    <span class="headline__name">Trekking w górach</span>
  </h1>
  <div class="text_menu__txt">
    <div class="text_menu__txt_sub pb-4 cm">
      <div class="_ae_desc">
        <style>
          :root {
            --long-description-width: 50%;
            --long-description-padding-section: 10px;
          }
          @media (max-width: 756px) {
            :root {
              --long-description-width: 100%;
              --long-description-padding-section: 0;
            }
          }
          ._ae_desc p { margin:16px 0; }
          ._ae_desc table { border-collapse: collapse; border-spacing: 0; }
          ._ae_desc td,._ae_desc table { padding: 4px; }
        </style>

        <div style="margin-bottom: 20px;font-size:14px;">
          <div>
            <div id="content" class="wrap clearfix">
              <div id="article" class="grid3">
                <div class="txt">
                  <h1>TREKKING W GÓRACH 14-20 DNI / SPANIE CZĘŚCIOWO POD NAMIOTEM</h1>

                  <table>
                    <thead>
                      <tr>
                        <th>1. TREKKING W GÓRACH 14-20 DNI / SPANIE CZĘŚCIOWO POD NAMIOTEM</th>
                        <th>&nbsp;</th>
                      </tr>
                    </thead>
                  </table>

                  <p>&nbsp;</p>
                  <p><strong>NA NOGI</strong></p>
                  <ul>
                    <li>Buty górskie męskie i damskie</li>
                    <li>Sandały syntetyczne męskie i damskie</li>
                    <li>Skarpety trekkingowe ciepłe oraz cieńsze, najlepiej z systemem antibacterial</li>
                    <li>Spodnie z materiału dobrze odprowadzającego wilgoć z odpinanymi nogawkami</li>
                    <li>Spodnie nieprzemakalne</li>
                    <li>Stuptuty (opcjonalnie)</li>
                    <li>Legginsy termoaktywne grube z polaru</li>
                    <li>Spodnie trekkingowe z materiału typu SOFTSHELL, FLEXSHIELD, EXTENDO</li>
                  </ul>

                  <p><strong>UBRANIE</strong></p>
                  <ul>
                    <li>Lekka kurtka membranowa lub peleryna</li>
                    <li>Kurtka ze sztucznego puchu (polecamy z odpinanymi rękawami), inna opcja to polar lub softshell</li>
                    <li>Koszulka termoaktywna z długim rękawem</li>
                    <li>Koszulka szybkoschnąca z krótkim rękawem</li>
                    <li>Bielizna osobista (najlepiej termoaktywna)</li>
                    <li>Czapka z daszkiem, kapelusz lub buff i/lub apaszka</li>
                    <li>Ciepła czapka</li>
                    <li>Rękawiczki 1 x ciepłe + 1 x cienkie</li>
                    <li>Koszula z długim rękawem</li>
                    <li>Dodatkowy lekki sweter puchowy lub koszula puchowa</li>
                  </ul>

                  <p><strong>HIGIENA</strong></p>
                  <ul>
                    <li>Kosmetyczka turystyczna</li>
                    <li>Lekki ręcznik szybkoschnący</li>
                    <li>Szczoteczka do zębów</li>
                    <li>Mała pasta do zębów</li>
                    <li>Uniwersalny biodegradowalny środek do mycia ciała i włosów</li>
                    <li>Grzebień</li>
                    <li>Stopery do uszu (opcjonalnie)</li>
                    <li>Papier toaletowy</li>
                    <li>Krem z wysokim filtrem UV, balsam do ust</li>
                    <li>Baby-chusteczki, płyn antybakteryjny do rąk</li>
                    <li>Pozostałe kosmetyki</li>
                  </ul>

                  <p><strong>SPRZĘT</strong></p>
                  <ul>
                    <li>Plecak ok. 60 L + pokrowiec przeciwdeszczowy</li>
                    <li>Namiot</li>
                    <li>Śpiwór</li>
                    <li>Kuchenka turystyczna, zapałki, zapalniczka lub krzesiwo</li>
                    <li>Karimata, mata samopompująca lub mata FN</li>
                    <li>Kije trekkingowe + nakładki</li>
                    <li>Latarka czołowa</li>
                    <li>System hydration (Camelback) lub bidon</li>
                    <li>Niezbędnik (np. spork)</li>
                    <li>Menażka, kubek, pojemnik na wodę</li>
                    <li>Scyzoryk lub nóż</li>
                    <li>Kompas, GPS, mapa (opcjonalnie)</li>
                    <li>Termos</li>
                    <li>Plecak podręczny ok. 20-30 L</li>
                    <li>Worek transportowy do plecaka + kłódka</li>
                    <li>Czekan, raki zależnie od charakteru trekkingu</li>
                  </ul>

                  <p><strong>APTECZKA</strong></p>
                  <ul>
                    <li>Futerał apteczkowy</li>
                    <li>Sól fizjologiczna</li>
                    <li>Środek przeciwbólowy</li>
                    <li>Środek na oparzenia słoneczne</li>
                    <li>Środek antybiegunkowy</li>
                    <li>Środki na przeziębienie</li>
                    <li>Diuretyk</li>
                    <li>Bandaż elastyczny</li>
                    <li>Jałowe gaziki, plaster, bandaż</li>
                    <li>Preparat odkażający</li>
                    <li>Środki na komary</li>
                    <li>Środki odkażające wodę (opcjonalnie)</li>
                    <li>Inne zwyczajowe leki</li>
                  </ul>

                  <p><strong>RÓŻNE</strong></p>
                  <ul>
                    <li>Paszportówka lub torebka biodrowa</li>
                    <li>Portfel + paszport (+ksero) + pieniądze</li>
                    <li>Srebrna taśma - można trochę nawinąć na kij trekkingowy</li>
                    <li>Okulary przeciwsłoneczne</li>
                    <li>Pasek ze schowkiem na pieniądze</li>
                    <li>Przewodnik</li>
                  </ul>

                  <p><strong>Część z przyjaciół zabiera również:</strong> zapasowe baterie do latarki, podstawkę pod kartusz, wiatrochron Alu do kuchenki, prześcieradło do śpiwora, zapasowe sznurówki, polarowe ciepłe spodnie do siedzenia w schronisku (a czasem i do spania), legginsy termoaktywne cienkie, polar 100, skarpety puchowe, ogrzewacz chemiczny, benzynowy lub węglowy, "magiczne ciepło" (także do butów)</p>

                  <p><strong>JEDZENIE, PICIE</strong> - różne opcje w zależności od zapotrzebowania. Polecamy m.in. liofilizaty.</p>

                  <p><strong>„RADY SPOD LADY"</strong></p>
                  <ul>
                    <li>W miejscach takich jak Peru, Indie, Nepal, Syberia warto mieć przy sobie jednodolarówki na napiwki</li>
                    <li>Jeśli trasa trekkingu wiedzie przez wioski, fajnie mieć np. balony, kolorowe długopisy/pisaki dla dzieci</li>
                    <li>Gdy kupujesz wodę czy inne napoje, lepiej wybrać gazowane, gdyż często pozostałe napoje są niewiadomego pochodzenia</li>
                  </ul>

                  <p>Jeśli masz uwagi lub pomysły na udoskonalenie, pisz na adres: admin@tuttu.pl lub wojtek@tuttu.pl</p>


                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

{else if $cms.meta_title=="Gory"}
<section id="Text" class="text_menu">
    <h1 class="text_menu__label headline">
        <span class="headline__name">W góry na 3-4 dni</span>
    </h1>
    <div class="text_menu__txt">
        <div class="text_menu__txt_sub pb-4 cm">
            <div class="_ae_desc">
                <style>
                    :root {
                        --long-description-width: 50%;
                        --long-description-padding-section: 10px;
                    }

                    @media (max-width: 756px) {
                        :root {
                            --long-description-width: 100%;
                            --long-description-padding-section: 0;
                        }
                    }

                    ._ae_desc p {
                        margin: 16px 0;
                    }

                    ._ae_desc table {
                        border-collapse: collapse;
                        border-spacing: 0;
                    }

                    ._ae_desc td,
                    ._ae_desc table {
                        padding: 4px;
                    }
                </style>
                <div style="margin-bottom: 20px;line-height:1.5;font-size:14px;">
                    <div class="txt">
                        <h3>NP. W BIESZCZADY POD NAMIOTEM</h3>

                        <p><strong>NA NOGI</strong></p>
                        <ul>
                            <li>Buty górskie męskie i damskie</li>
                            <li>Sandały męskie i damskie</li>
                            <li>Skarpety trekkingowe, w tym jedne cieplejsze, najlepiej z systemem antibacterial</li>
                            <li>Spodnie z materiału dobrze odprowadzającego wilgoć z odpinanymi nogawkami</li>
                            <li>Spodnie nieprzemakalne</li>
                            <li>Stuptuty</li>
                        </ul>

                        <p><strong>UBRANIE</strong></p>
                        <ul>
                            <li>Lekka kurtka membranowa lub peleryna</li>
                            <li>Kurtka ze sztucznego puchu, polar lub softshell</li>
                            <li>Koszulka termoaktywna z długim rękawem</li>
                            <li>Koszulka szybkoschnąca z krótkim rękawem</li>
                            <li>Bielizna osobista (najlepiej termoaktywna)</li>
                            <li>Czapka z daszkiem, kapelusz lub buff</li>
                        </ul>

                        <p><strong>HIGIENA</strong></p>
                        <ul>
                            <li>Kosmetyczka turystyczna</li>
                            <li>Lekki ręcznik szybkoschnący</li>
                            <li>Szczoteczka do zębów</li>
                            <li>Mała pasta do zębów</li>
                            <li>Mydło biodegradowalne</li>
                            <li>Chusteczki nawilżane</li>
                            <li>Pozostałe kosmetyki</li>
                            <li>Grzebień</li>
                            <li>Stopery do uszu</li>
                            <li>Papier toaletowy</li>
                        </ul>

                        <p><strong>SPRZĘT</strong></p>
                        <ul>
                            <li>Plecak ok. 45-60 L + pokrowiec nieprzemakalny</li>
                            <li>Namiot</li>
                            <li>Śpiwór</li>
                            <li>Kuchenka turystyczna + kartusz gazu, zapałki, zapalniczka lub krzesiwo</li>
                            <li>Karimata, mata samopompująca lub fjordmata</li>
                            <li>Kije trekkingowe + nakładki</li>
                            <li>Latarka czołowa</li>
                            <li>System hydration (Camelback) lub bidon</li>
                            <li>Niezbędnik (np. spork)</li>
                            <li>Menażka, kubek, pojemnik na wodę</li>
                            <li>Scyzoryk lub nóż</li>
                            <li>Kompas, GPS, mapa (opcjonalnie mapnik lub folia strunowa do ochrony przed deszczem)</li>
                            <li>Termos (pamiętaj trzyma temperaturę zarówno gorących napoi jak i zimnych)</li>
                        </ul>

                        <p><strong>APTECZKA</strong></p>
                        <ul>
                            <li>Środek przeciw komarom, kleszczom</li>
                            <li>Środki opatrunkowe w wodoodpornym woreczku</li>
                        </ul>

                        <p><strong>RÓŻNE</strong></p>
                        <ul>
                            <li>Paszportówka lub torebka biodrowa</li>
                            <li>Portfel</li>
                            <li>Srebrna taśma</li>
                            <li>2-3 worki na śmieci</li>
                            <li>Okulary przeciwsłoneczne</li>
                            <li>Pasek ze schowkiem na pieniądze</li>
                        </ul>

                        <p><strong>Jeśli spodziewasz się temperatury w okolicach 5-12 stopni C wieczorem, nawet jeśli się nie spodziewasz - zabierz koniecznie:</strong></p>
                        <ul>
                            <li>Czapka z polaru, szalik</li>
                            <li>Cienkie rękawiczki</li>
                            <li>Polarowa bluza cienka typu 100</li>
                        </ul>

                        <p><strong>Część z naszych przyjaciół zabiera również:</strong> zapasowe baterie do latarki, sznurek ok. 5 m, podstawkę pod kartusz, wiatrochron Alu do kuchenki, składany plecak 20 L, prześcieradło do śpiwora, składaną saperkę, zapasowe sznurówki, parasol turystyczny, krem z filtrem, chusteczki nawilżane…</p>

                        <p><strong>JEDZENIE, PICIE</strong> - tu różne opcje w zależności od zapotrzebowania. Polecamy m.in. liofilizaty, jednorazowe ekspresy z kawą.</p>

                        <p>Jak masz uwagi lub pomysły na udoskonalenie, pisz na adres: marketing@tuttu.pl</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

{else if $cms.meta_title=="Apteczka"}

<div id="content" class="col-12">
    <section id="Text" class="text_menu">
        <h1 class="text_menu__label headline"><span class="headline__name">Wyposażenie apteczki</span></h1>
        <div class="text_menu__txt">
            <div class="text_menu__txt_sub pb-4 cm">
                <div class="_ae_desc">
                    <style>
                        :root {
                            --long-description-width: 50%;
                            --long-description-padding-section: 10px;
                        }

                        @media (max-width: 756px) {
                            :root {
                                --long-description-width: 100%;
                                --long-description-padding-section: 0;
                            }
                        }

                        ._ae_desc p {
                            margin:16px 0;
                        }

                        ._ae_desc table {
                            border-collapse: collapse;
                            border-spacing: 0;
                        }

                        ._ae_desc td,
                        ._ae_desc table {
                            padding: 4px;
                        }
                    </style>
                    <div style="margin-bottom: 20px; line-height:1.5; font-size:14px;">
                        <div class="txt">
                            <h1>Wyposażenie apteczki podróżnej</h1>
                            <ul>
                                <li>rękawiczki jednorazowe (najlepiej nitrylowe) - 3 pary</li>
                                <li>folia NRC (koc termiczny)</li>
                                <li>maseczka do sztucznego oddychania</li>
                                <li>waciki nasączone spirytusem do dezynfekcji</li>
                                <li>plastry z opatrunkiem - paczka</li>
                                <li>plaster w rolce</li>
                                <li>kompresy gazy jałowej np. 9 x 9 cm - 5 szt</li>
                                <li>opaska dziana (2 x 10 cm i 1 x 5 cm)</li>
                                <li>opaska elastyczna</li>
                                <li>chusta trójkątna</li>
                                <li>igły do strzykawek (3 szt)</li>
                                <li>sól fizjologiczna (3 fiolki)</li>
                                <li>środek dezynfekujący</li>
                                <li>leki przyjmowane stale przez uczestników (tylko do własnego użytku)</li>
                                <li>Victorinox Classic (posiada pęsetę, nożyczki, nożyk)</li>
                            </ul>
                            <p>Jeśli masz uwagi lub pomysły na udoskonalenie pisz na adres: admin@tuttu.pl</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</div>

{else if $cms.meta_title == "Kajak"}
<h1>Na kajak - wypad na 3-4 dni</h1>
<div>
    <h3>CZERWIEC-WRZESIEŃ, POGODA MIESZANA</h3>
    <p>Warto zwrócić uwagę, aby zabierane rzeczy były szybkoschnące (jak najmniej bawełny). W kajaku jest sporo miejsca i skoro tego nie dźwigasz, można pozwolić sobie na pewne dodatki :)</p>

    <h4>NA NOGI</h4>
    <ul>
        <li>Sandały syntetyczne wysokiej klasy (męskie i damskie), tak aby paski nie wyrwały się w muł (klapki się nie sprawdzą)</li>
        <li>Buty nieprzemakalne</li>
        <li>Skarpety – jedne cieplejsze, lepiej syntetyczne z systemem antibacterial lub wełniane</li>
    </ul>

    <h4>UBRANIE</h4>
    <ul>
        <li>Kurtka membranowa lekka lub peleryna</li>
        <li>Kurtka ze sztucznego puchu (z odpinanymi rękawami), alternatywnie polar lub softshell</li>
        <li>Spodnie z odpinanymi nogawkami szybkoschnące</li>
        <li>Spodenki do pływania</li>
        <li>Spodnie nieprzemakalne</li>
        <li>Czapka z daszkiem i osłoną na kark lub kapelusz</li>
        <li>Koszulka szybkoschnąca z długim rękawem</li>
        <li>Koszulka do spania z długim rękawem</li>
        <li>Koszulka szybkoschnąca z krótkim rękawem x2</li>
        <li>Bielizna osobista (najlepiej termoaktywna)</li>
    </ul>

    <h4>HIGIENA</h4>
    <ul>
        <li>Ręcznik szybkoschnący, lekki</li>
        <li>Kosmetyczka turystyczna</li>
        <li>Szczoteczka do zębów</li>
        <li>Pasta do zębów mała</li>
        <li>Mydło biodegradowalne (listki lub w płynie)</li>
        <li>Stopery do uszu</li>
        <li>Krem z filtrem</li>
        <li>Pozostałe kosmetyki</li>
    </ul>

    <h4>SPRZĘT</h4>
    <ul>
        <li>Namiot (polecamy z zewnętrznym stelażem)</li>
        <li>Worki wodoszczelne – 3-4 na osobę</li>
        <li>Śpiwór o 3-5°C cieplejszy niż zazwyczaj</li>
        <li>Karimata, mata samopompująca, mata FN</li>
        <li>Latarka czołowa</li>
        <li>Kuchenka turystyczna, zapałki wodoodporne lub krzesiwo, podpałka</li>
        <li>Spork (łyżko-widelec), scyzoryk, nóż</li>
        <li>Menażka, pojemnik na wodę, kubek</li>
        <li>Saperka mała (1 na 2 kajaki)</li>
        <li>Siekierka (1 na całą ekipę)</li>
        <li>Termos</li>
        <li>Kompas, GPS, mapa (opcjonalnie mapnik)</li>
    </ul>

    <h4>APTECZKA</h4>
    <ul>
        <li>Środek przeciw komarom, kleszczom</li>
        <li>Środki opatrunkowe w wodoodpornym woreczku</li>
    </ul>

    <h4>RÓŻNE</h4>
    <ul>
        <li>Paszportówka wodoszczelna</li>
        <li>Okulary przeciwsłoneczne</li>
        <li>Pasek ze schowkiem na pieniądze</li>
        <li>Worki na śmieci</li>
        <li>Linka 5-6 m (do holowania kajaka i suszenia rzeczy)</li>
        <li>Srebrna taśma</li>
    </ul>

    <p>Część z naszych przyjaciół zabiera również: zapasowe baterie do latarki, podstawkę pod kartusz, wiatrochron Alu do kuchenki, moskitierę na czapkę, prześcieradło do śpiwora, prysznic turystyczny, składany plecak 20 L, środki odkażające wodę, toster turystyczny, parasol turystyczny, dmuchaną lub samopompującą poduszkę do oparcia, torebkę biodrową wodoszczelną, ekspres do kawy turystyczny :)</p>

    <h4>JEDZENIE I PICIE</h4>
    <p>Różne opcje w zależności od zapotrzebowania. Polecamy m.in. liofilizaty, kawa turystyczna (jednorazowy ekspres z pyszną kawą).</p>

    <h4>NA CHŁODNĄ POGODĘ (5-12°C wieczorem)</h4>
    <ul>
        <li>Czapka z polaru, szalik</li>
        <li>Cienkie rękawiczki</li>
        <li>Polarowa bluza cienka</li>
    </ul>

    <p>W przypadku osób mniej doświadczonych lub kiepskiej pogody warto wziąć rzeczy zapasowe.</p>
    <p>Uwagi: <a href="mailto:marketing@tuttu.pl">marketing@tuttu.pl</a> lub <a href="mailto:Wojtek@TUTTU.PL">wojtek@tuttu.pl</a></p>

</div>

{else if $cms.meta_title == 'Skitury'}
<h1>Na skitury 3-5 dni</h1>
<div>
    <h3>SPANIE W SCHRONISKU</h3>
    <ul>
        <li>ABC (pips, sonda, łopata)</li>
        <li>Narty</li>
        <li>Harszle</li>
        <li>Buty</li>
        <li>Kije + srebrna taśma</li>
        <li>Foki</li>
        <li>Kask</li>
        <li>Gogle</li>
        <li>Raki</li>
        <li>Czekan</li>
        <li>Plecak zwykły lub ABS</li>
    </ul>

    <h4>Ciuchy</h4>
    <ul>
        <li>Kurtka typu pack-lite</li>
        <li>Puchówka lekka lub sztuczny puch</li>
        <li>Spodnie narciarsko-turowe z wentylacją</li>
        <li>Skarpety</li>
        <li>Kalesony dopasowane do pory roku</li>
        <li>Bokserki termoaktywne</li>
        <li>Koszulka (cienka, gruba – powerstretch lub polar 100)</li>
        <li>Rękawice x2 (jedne grubsze)</li>
        <li>Czapka FN FALL</li>
        <li>Chusta zamieniająca się w maskę FN ICE WIND PRO</li>
    </ul>

    <h4>Różne</h4>
    <ul>
        <li>Na wymagające wycieczki dodatkowa para fok na zespół 2-3 osobowy</li>
        <li>Ubezpieczenie</li>
        <li>Kosmetyczka lub woreczek FN połączony z apteczką</li>
        <li>Ręcznik np. FN TRAMP LIGHT</li>
        <li>Apteczka (na obtarcia)</li>
        <li>Folia NRC</li>
        <li>Okulary</li>
        <li>Krem UV, sztyft</li>
        <li>Nóż lub multitool dopasowany do śrub wiązań</li>
        <li>Czołówka</li>
        <li>Mapa</li>
        <li>GPS</li>
        <li>Termos</li>
        <li>Camelback</li>
        <li>Szturm żarcie (żele, batony energetyczne)</li>
        <li>Aparat fotograficzny</li>
        <li>Zapasowe baterie</li>
        <li>Telefon z numerem GOPR itd.</li>
        <li>Ogrzewacz do stóp i rąk</li>
    </ul>

    <p>Uwagi: <a href="mailto:admin@tuttu.pl">admin@tuttu.pl</a> lub <a href="mailto:Wojtek@TUTTU.PL">wojtek@TUTTU.PL</a></p>

</div>

{else if $cms.meta_title =="Tropiki"}

<h2>W TROPIKI POWINIENEŚ ZAOPATRZYĆ SIĘ W:</h2>

<ul>
    <li>okulary kategorii 3 lub 4</li>
    <li>cienka bielizna osobista dobrze odprowadzająca wilgoć</li>
    <li>spodnie z lekkiego materiału filtrującego UV, najlepiej zabezpieczone przed insektami</li>
    <li>koszula z krótkim rękawem z materiałów odprowadzających wilgoć</li>
    <li>koszula z długim rękawem i wysokim kołnierzykiem</li>
    <li>kapelusz z dużym rondem lub czapka z daszkiem i osłoną na kark</li>
    <li>dobre, mocne sandały</li>
    <li>cienka kurtka przeciwdeszczowa</li>
    <li>warstwa termiczna (polar 100 lub kurtka typu PrimaLoft)</li>
    <li>moskitiera na łóżko</li>
    <li>środek przeciw komarom/moskitom (np. DEET 50%)</li>
    <li>lekki śpiwór lub prześcieradło turystyczne</li>
    <li>czołówka</li>
</ul>

<h3>CZASEM PRZYDA SIĘ TAKŻE:</h3>

<ul>
    <li>moskitiera na głowę</li>
    <li>środki do uzdatniania wody (tabletki, płyn)</li>
    <li>wysokie buty do warunków tropikalnych</li>
    <li>mały ultralekki plecak</li>
</ul>

<h3>POZA TYM WARTO MIEĆ ZE SOBĄ:</h3>

<ul>
    <li>środek łagodzący po ukąszeniach</li>
    <li>środek przeciw biegunce</li>
    <li>krem z wysokim filtrem UV</li>
    <li>żel antybakteryjny do mycia rąk</li>
    <li>środki do ochrony intymnej dla kobiet</li>
</ul>

<h3>UWAGA</h3>
<p>
Ze względu na szybki rozwój bakterii i pleśni w wysokich temperaturach<br>
nie są polecane bukłaki i bidony. Najlepiej sprawdza się woda w butelkach PET<br>
(sprawdzaj, czy są fabrycznie zamknięte).
</p>

<p>
Uwagi lub pomysły: wojtek@tuttu.pl, marketing@tuttu.pl
</p>

{else if $cms.meta_title=="Skaly"}
<h3>Wyjazd na Jurę Krakowsko-Częstochowską lub w Sokoliki z biwakiem.</h3>

<p><strong>NA STOPY:</strong></p>
<ul>
<li>buty inne niż wspinaczkowe (np. sandały lub podejściówki)</li>
<li>skarpety szybkoschnące</li>
<li>klapki (np. pod prysznic na campingu)</li>
</ul>

<p><strong>ODZIEŻ:</strong></p>
<ul>
<li>lekka kurtka przeciwdeszczowa lub peleryna</li>
<li>warstwa termiczna (puchówka, polar, bluza termoaktywna)</li>
<li>softshell</li>
<li>koszulki szybkoschnące</li>
<li>spodnie wspinaczkowe lub getry</li>
<li>krótkie spodenki (najlepiej termoaktywne)</li>
<li>ubranie do spania</li>
<li>bielizna osobista (najlepiej termoaktywna)</li>
<li>cienka czapka pod kask</li>
<li>chusta wielofunkcyjna (komin)</li>
<li>lekkie woreczki na odzież (organizery + na brudne rzeczy)</li>
</ul>

<p><strong>HIGIENA:</strong></p>
<ul>
<li>ręcznik szybkoschnący</li>
<li>kosmetyczka turystyczna</li>
<li>szczoteczka i mini pasta do zębów</li>
<li>mydło biodegradowalne (ciało, włosy, naczynia)</li>
<li>dezodorant</li>
<li>kosmetyki w małych pojemnikach</li>
<li>krem z filtrem UV</li>
<li>papier toaletowy</li>
<li>stopery do uszu</li>
<li>płyn antybakteryjny bez wody</li>
<li>chusteczki nawilżane</li>
<li>nożyczki i pilnik</li>
</ul>

<p><strong>SPRZĘT:</strong></p>
<ul>
<li>plecak wspinaczkowy</li>
<li>torebka biodrowa lub paszportówka</li>
<li>latarka czołowa + zapasowe baterie</li>
<li>namiot lub hamak</li>
<li>tarp (zadaszenie)</li>
<li>karimata lub mata samopompująca</li>
<li>śpiwór</li>
<li>poduszka</li>
<li>aparat lub kamera</li>
<li>telefon i ładowarka</li>
<li>powerbank</li>
<li>ładowarka samochodowa</li>
<li>mała saperka</li>
</ul>

<p><strong>JEDZENIE I NAPOJE:</strong></p>
<ul>
<li>pojemnik na wodę</li>
<li>termos</li>
<li>woda i napoje</li>
<li>herbata, cukier itp.</li>
<li>kawa turystyczna lub ekspres turystyczny</li>
<li>kuchenka turystyczna i kartusz gazowy</li>
<li>zapałki wodoodporne lub krzesiwo, podpałka</li>
<li>podstawka pod kartusz</li>
<li>wiatrochron do kuchenki</li>
<li>menażka/garnek, kubek</li>
<li>spork (łyżko-widelec)</li>
<li>scyzoryk lub nóż</li>
<li>żywność (np. liofilizaty)</li>
<li>kaloryczne przekąski (sezamki, bakalie)</li>
</ul>

<p><strong>RÓŻNE:</strong></p>
<ul>
<li>apteczka</li>
<li>okulary przeciwsłoneczne</li>
<li>portfel i pieniądze</li>
<li>ubezpieczenie</li>
<li>linka 5–6 m (np. do suszenia)</li>
<li>srebrna taśma</li>
<li>karta przeżycia / travel card (np. igła i nitka)</li>
<li>zapasowe kluczyki do auta</li>
<li>gry dla dzieci (karty, frisbee)</li>
</ul>

<p><strong>SPRZĘT WSPINACZKOWY:</strong></p>
<ul>
<li>kask</li>
<li>uprząż</li>
<li>buty wspinaczkowe</li>
<li>rękawiczki do asekuracji</li>
<li>lina</li>
<li>przyrząd asekuracyjny</li>
<li>ekspresy (min. 12, najlepiej 15–16)</li>
<li>kości, heksy, friendy + klucze do kości (dla wspinania trad)</li>
<li>karabinki zakręcane (min. 3)</li>
<li>karabinki dodatkowe (2–3)</li>
<li>pętle (2 × 60 cm, 2 × 80 cm, 2 × 120 cm)</li>
<li>repy różnej długości</li>
<li>woreczek na magnezję</li>
<li>magnezja</li>
<li>torba na linę z płachtą</li>
<li>torba na sprzęt</li>
<li>tejpy (plastry ochronne)</li>
<li>topo (przewodnik wspinaczkowy)</li>
</ul>

<p>Uwagi lub pomysły na udoskonalenie: admin@tuttu.pl</p>

{else if $cms.meta_title=="Camping"}
<h3>Wyjazd na Jurę Krakowsko-Częstochowską lub w Sokoliki z biwakiem.</h3>

<p><strong>NA STOPY</strong></p>
<ul>
<li>buty inne niż wspinaczkowe (np. sandały lub podejściówki)</li>
<li>skarpety szybkoschnące</li>
<li>klapki (np. pod prysznic na campingu)</li>
</ul>

<p><strong>ODZIEŻ:</strong></p>
<ul>
<li>lekka kurtka przeciwdeszczowa (membranowa) lub peleryna</li>
<li>warstwa termiczna (puchówka, polar, bluza termoaktywna)</li>
<li>softshell</li>
<li>koszulki szybkoschnące</li>
<li>koszulki codzienne (bawełniane lub inne)</li>
<li>szybkoschnące spodnie z odpinanymi nogawkami</li>
<li>krótkie spodenki lub sukienka (najlepiej termoaktywne)</li>
<li>ubranie do spania</li>
<li>bielizna osobista (najlepiej termoaktywna)</li>
<li>czapka z daszkiem i osłoną na kark lub kapelusz z dużym rondem</li>
<li>moskitiera na czapkę/głowę</li>
<li>chusta wielofunkcyjna (komin)</li>
<li>strój lub spodenki do pływania</li>
<li>pasek ze schowkiem na pieniądze</li>
<li>lekkie woreczki na odzież (organizery + brudne rzeczy)</li>
</ul>

<p><strong>HIGIENA:</strong></p>
<ul>
<li>ręcznik szybkoschnący</li>
<li>kosmetyczka turystyczna</li>
<li>szczoteczka i mini pasta do zębów</li>
<li>mydło biodegradowalne (ciało, włosy, naczynia)</li>
<li>dezodorant</li>
<li>kosmetyki w podróżnych pojemnikach</li>
<li>krem z filtrem UV</li>
<li>stopery do uszu</li>
<li>chusteczki nawilżane</li>
<li>środki przeciw insektom</li>
<li>papier toaletowy</li>
<li>prysznic turystyczny</li>
</ul>

<p><strong>SPRZĘT:</strong></p>
<ul>
<li>plecak lub torba turystyczna</li>
<li>podręczny plecak 20–30 l</li>
<li>torebka biodrowa lub paszportówka</li>
<li>latarka czołowa i zapasowe baterie</li>
<li>przewodnik</li>
<li>namiot</li>
<li>hamak</li>
<li>tarp – zadaszenie</li>
<li>karimata lub mata samopompująca</li>
<li>śpiwór</li>
<li>prześcieradło do śpiwora</li>
<li>poduszka</li>
<li>aparat lub kamera</li>
<li>lampka campingowa i świeczki antykomarowe</li>
<li>telefon i ładowarka</li>
<li>powerbank</li>
<li>ładowarka samochodowa</li>
<li>mała saperka lub siekierka</li>
<li>multitool</li>
<li>stolik i krzesła lub leżaki</li>
</ul>

<p><strong>JEDZENIE I NAPOJE:</strong></p>
<ul>
<li>pojemnik na wodę</li>
<li>bidon</li>
<li>termos</li>
<li>woda i napoje</li>
<li>herbata, cukier itp.</li>
<li>kawa turystyczna lub turystyczny ekspres</li>
<li>kuchenka turystyczna i kartusz z gazem</li>
<li>zapałki wodoodporne lub krzesiwo, podpałka</li>
<li>podstawka pod kartusz</li>
<li>wiatrochron do kuchenki</li>
<li>menażka lub garnek, kubek</li>
<li>składane naczynia</li>
<li>spork (łyżko-widelec)</li>
<li>scyzoryk lub nóż</li>
<li>dodatkowe przybory kuchenne</li>
<li>jedzenie (np. liofilizaty)</li>
<li>kaloryczne przekąski (sezamki, bakalie)</li>
<li>mały przyprawnik</li>
</ul>

<p><strong>RÓŻNE:</strong></p>
<ul>
<li>apteczka</li>
<li>okulary przeciwsłoneczne</li>
<li>portfel i pieniądze</li>
<li>ubezpieczenie</li>
<li>worki na śmieci i mniejsze worki do samochodu</li>
<li>linka 5–6 m (np. do suszenia)</li>
<li>srebrna taśma</li>
<li>karta przeżycia / travel card (w tym igła i nitka)</li>
<li>zapasowe kluczyki do samochodu</li>
<li>gry dla dzieci (karty, frisbee itd.)</li>
</ul>

<p>Uwagi lub pomysły na udoskonalenie: admin@tuttu.pl</p>


{else if $cms.meta_title=="Camino"}
<h1 class="text_menu__label headline"><span class="headline__name">Nie zapomnij na Camino de Santiago</span></h1>

<div class="text_menu__txt">
<div class="text_menu__txt_sub pb-4 cm">
<div class="_ae_desc">

<h3>Listę sprzętową poleca Paweł z Tuttu Katowice</h3>

<h3>Wypróbuj z Tuttu:</h3>
<ul>
<li>stopery do uszu</li>
<li>kapelusz z dużym rondem</li>
<li>plecak z oddalonym od pleców systemem nośnym</li>
<li>okulary z fotochromem</li>
<li>spodnie szybkoschnące z odpinanymi nogawkami</li>
</ul>

<h3>SPECYFIKA WYJAZDU:</h3>
<p>Wyjazd na Camino zazwyczaj trwa około miesiąca. Najważniejsza w doborze sprzętu jest jego waga. Pamiętajmy, że codziennie będziemy musieli nosić te rzeczy na plecach, więc zabierzmy tylko to, co niezbędne. Ochrona przed słońcem również jest tu kluczowa – kapelusz lub czapka to rzecz obowiązkowa, do tego krem z wysokim filtrem. Musimy także pamiętać o dobrym nawodnieniu. Zaopatrzmy się także w plastry na stopy oraz stopery do uszu (alberge dla pielgrzymów to nie hotel, a dźwięki chrapania będą nam towarzyszyć już od pierwszej nocy).</p>

<h3>Jak czytać listę?</h3>
<p><strong>Pogrubioną czcionką wskazujemy rzeczy niezbędne, a czcionką zwykłą te, które uprzyjemnią Ci wyjazd.</strong></p>
<p>Pamiętaj, że poniższa lista to przykładowy zestaw zabieranych rzeczy, a jej ostateczny kształt zależy tylko od Ciebie, Twojego doświadczenia i warunków, jakich możesz się spodziewać.</p>

<h2>NA CAMINO DE SANTIAGO (i inne pielgrzymki piesze)</h2>
<p>Miesięczna droga, która wiedzie przez ponad 800 km dróg gorącej Hiszpanii.</p>

<p><strong>NA STOPY:</strong></p>
<ul>
<li><strong>buty trekkingowe wysokie lub niskie (na ładną i umiarkowaną pogodę)</strong></li>
<li><strong>sandały wysokiej jakości</strong></li>
<li>klapki (np. pod prysznic)</li>
<li><strong>skarpety szybkoschnące</strong></li>
<li>skarpety lub opaski uciskowe</li>
</ul>

<p><strong>ODZIEŻ:</strong></p>
<ul>
<li><strong>lekka kurtka przeciwdeszczowa (membranowa) lub peleryna</strong></li>
<li>bluza (np. power stretch)</li>
<li><strong>softshell lub wiatrówka</strong></li>
<li><strong>koszulki szybkoschnące</strong></li>
<li>koszulki codzienne (np. bawełniane)</li>
<li><strong>szybkoschnące spodnie z odpinanymi nogawkami</strong></li>
<li>spodnie cienkie z materiału filtrującego UV</li>
<li>krótkie spodenki lub sukienka (najlepiej termoaktywne)</li>
<li><strong>ubranie do spania (wg potrzeb)</strong></li>
<li><strong>bielizna osobista (najlepiej termoaktywna)</strong></li>
<li><strong>czapka z daszkiem i osłoną na kark lub kapelusz z dużym rondem</strong></li>
<li>moskitiera na czapkę/głowę</li>
<li><strong>chusta wielofunkcyjna (komin)</strong></li>
<li>pasek ze schowkiem na pieniądze</li>
<li>lekkie woreczki na odzież (organizer + brudne rzeczy)</li>
</ul>

<p><strong>HIGIENA:</strong></p>
<ul>
<li><strong>ręcznik szybkoschnący lekki</strong></li>
<li><strong>kosmetyczka turystyczna</strong></li>
<li><strong>szczoteczka i mini pasta do zębów</strong></li>
<li><strong>mydło biodegradowalne do mycia ciała, włosów, a nawet naczyń</strong></li>
<li><strong>dezodorant</strong></li>
<li><strong>pozostałe kosmetyki w pojemniczkach turystycznych</strong></li>
<li><strong>krem z filtrem UV</strong></li>
<li>stopery do uszu</li>
<li>płyn antybakteryjny do mycia rąk</li>
<li>chusteczki nawilżane</li>
<li>środek przeciw insektom</li>
<li>nożyczki i pilnik do paznokci</li>
<li><strong>plastry Compeed</strong></li>
</ul>

<p><strong>SPRZĘT:</strong></p>
<ul>
<li><strong>plecak + pokrowiec nieprzemakalny (ok. 40 l)</strong></li>
<li>worek transportowy na plecak + kłódka (przy podróży samolotem)</li>
<li>składany, malutki plecak ok. 20 l</li>
<li><strong>torebka biodrowa lub paszportówka</strong></li>
<li>wodoszczelna saszetka lub paszportówka</li>
<li><strong>kije trekkingowe + nakładki</strong></li>
<li><strong>latarka czołowa i zapasowe baterie</strong></li>
<li><strong>GPS lub mapa (+ mapnik)</strong></li>
<li>przewodnik</li>
<li>namiot</li>
<li>tarp – zadaszenie (zamiennie z namiotem)</li>
<li><strong>karimata lub mata samopompująca</strong></li>
<li><strong>śpiwór (cienki i mały)</strong></li>
<li>prześcieradło do śpiwora</li>
<li><strong>mała poduszka dmuchana</strong></li>
<li>aparat lub kamera</li>
<li><strong>telefon i ładowarka</strong></li>
<li><strong>powerbank</strong></li>
</ul>

<p><strong>JEDZENIE I NAPOJE:</strong></p>
<ul>
<li><strong>bukłak/butelka z filtrem/bidon</strong></li>
<li>termos</li>
<li><strong>woda, napoje</strong></li>
<li><strong>herbata, cukier itp.</strong></li>
<li>kawa turystyczna</li>
<li>kuchenka turystyczna i kartusz z gazem</li>
<li>zapałki wodoodporne lub krzesiwo, podpałka</li>
<li>menażka lub garnek, kubek</li>
<li>składane naczynia</li>
<li><strong>spork (łyżko-widelec)</strong></li>
<li>scyzoryk lub nóż</li>
<li><strong>kaloryczne przekąski (batony, sezamki, bakalie)</strong></li>
</ul>

<p><strong>RÓŻNE:</strong></p>
<ul>
<li><strong>apteczka</strong></li>
<li><strong>okulary przeciwsłoneczne</strong></li>
<li><strong>portfel i pieniądze</strong></li>
<li><strong>dowód osobisty lub paszport (+ kserokopia)</strong></li>
<li><strong>ubezpieczenie</strong></li>
<li><strong>linka (mała średnica, ok. 5 m)</strong></li>
<li>srebrna taśma</li>
<li>zapasowe sznurów



{elseif $cms.meta_title == 'Newsletter'}
        <div class="newsletter-promo">
        <div class="newsletter-promo-text">
          <h3 style="text-align: center; color: red;">Każda osoba, która zapisze się do naszego NEWSLETTERA na powitanie otrzyma od nas kod rabatowy o wartości 25zł na pierwsze zakupy!</h3>
          
          <p>Od tej chwili będziesz otrzymywać informacje na temat akcji specjalnych dla subskrybentów, promocjach, wyprzedażach, nowościach, a także wydarzeniach w świecie turystycznym.</p>
          
          <h4 style="text-align: center; color: red;">Wpisz swój adres w pola na stronie.</h4>
          <br>
          <h5>Jak wykorzystać kod?</h5>
          
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
