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
