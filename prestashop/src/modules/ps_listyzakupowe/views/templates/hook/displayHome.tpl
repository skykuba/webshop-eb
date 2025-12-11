<div class="list_contener">
<div class="top_spacer"></div>
<div class="title_list">
Sprawdź nasze listy sprzetowe
</div>

<ul class="zakupowe_list">
  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <a href="{$cmsLink1}">
        <img height="130" width="130" src="modules/ps_listyzakupowe/views/templates/hook/2_5_i_4104.webp" alt="ikona" class="benefit-icon">
      </a>
    </div>
    <div class="benefit_text">
      <span class="benefit_headline1 orange"><a href="{$cmsLink1}">Trekking</a></span>
    </div>
  </li>
  
  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <a href="{$cmsLink2}">
        <img height="130" width="130" src="modules/ps_listyzakupowe/views/templates/hook/2_5_i_4105.webp" alt="ikona" class="benefit-icon">
      </a>
    </div>
    <div class="benefit_text">
      <span class="benefit_headline1 orange"><a href="{$cmsLink2}">Góry</a></span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <a href="{$cmsLink3}">
        <img height="130" width="130" src="modules/ps_listyzakupowe/views/templates/hook/2_5_i_4106.webp" alt="ikona" class="benefit-icon">
      </a>
    </div>
    <div class="benefit_text">
      <span class="benefit_headline1 orange"><a href="{$cmsLink3}">Apteczka</a></span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <a href="{$cmsLink4}">
        <img height="130" width="130" src="modules/ps_listyzakupowe/views/templates/hook/2_5_i_4107.webp" alt="ikona" class="benefit-icon">
      </a>
    </div>
    <div class="benefit_text">
      <span class="benefit_headline1 orange"><a href="{$cmsLink4}">Kajak</a></span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <a href="{$cmsLink5}">
        <img height="130" width="130" src="modules/ps_listyzakupowe/views/templates/hook/2_5_i_4108.webp" alt="ikona" class="benefit-icon">
      </a>
    </div>
    <div class="benefit_text">
      <span class="benefit_headline1 orange"><a href="{$cmsLink5}">Skitury</a></span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <a href="{$cmsLink6}">
        <img height="130" width="130" src="modules/ps_listyzakupowe/views/templates/hook/2_5_i_4109.webp" alt="ikona" class="benefit-icon">
      </a>
    </div>
    <div class="benefit_text">
      <span class="benefit_headline1 orange"><a href="{$cmsLink6}">Narty Zjazdowe</a></span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <a href="{$cmsLink6}">
        <img height="130" width="130" src="modules/ps_listyzakupowe/views/templates/hook/2_5_i_4110.webp" alt="ikona" class="benefit-icon">
      </a>
    </div>
    <div class="benefit_text">
      <span class="benefit_headline1 orange"><a href="{$cmsLink6}">Tropiki</a></span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <a href="{$cmsLink7}">
        <img height="130" width="130" src="modules/ps_listyzakupowe/views/templates/hook/2_5_i_4111.webp" alt="ikona" class="benefit-icon">
      </a>
    </div>
    <div class="benefit_text">
      <span class="benefit_headline1 orange"><a href="{$cmsLink7}">Skały</a></span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <a href="{$cmsLink8}">
        <img height="130" width="130" src="modules/ps_listyzakupowe/views/templates/hook/2_5_i_4112.webp" alt="ikona" class="benefit-icon">
      </a>
    </div>
    <div class="benefit_text">
      <span class="benefit_headline1 orange"><a href="{$cmsLink8}">Camping</a></span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <a href="{$cmsLink9}">
        <img height="130" width="130" src="modules/ps_listyzakupowe/views/templates/hook/2_5_i_4113.webp" alt="ikona" class="benefit-icon">
      </a>
    </div>
    <div class="benefit_text">
      <span class="benefit_headline1 orange"><a href="{$cmsLink9}">Camino de Santiago</a></span>
    </div>
  </li>
</ul>
</div>

<style>
/* Lista benefitów - kontener */
.list_contener{
  width: 100%;
  margin: 0 auto; 
  background-color: #313131ff;
  height: 500px;
}
ul.zakupowe_list {
  display: flex;
  flex-wrap: nowrap;       /* wszystkie w jednej linii */
  justify-content: center;
  gap: 0;                  /* ZERO odstępu między elementami */
  padding: 0;
 
  list-style: none;
}

/* Element li */
ul.zakupowe_list > li.benefit_item {
  flex: 1 1 auto;        /* każdy LI rozszerza się automatycznie */
  min-width: 150px;      /* minimalna szerokość */
  max-width: 1fr;        /* opcjonalne */
  padding: 0;              /* usuwa odstęp W LI */
  margin: 0;               /* zero marginesów */
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

/* Ikony */
ul.zakupowe_list img {
  display: block;          /* usuwa odstęp pod obrazkiem */
  margin-bottom: 30px;               /* zero marginesów */
  padding: 0;
}

/* Teksty */
.benefit_text {
  margin: 0;
  padding: 0;
}

.benefit_headline1 {
  margin: 0;
  padding: 0;
  font-size: 1.4rem;
  font-weight: 500;
}

.benefit_headline1 a{
  color: #fff !important;
}

/* Wyrównanie wszystkich li do góry, aby ikony były w jednym rzędzie */
ul.zakupowe_list {
    align-items: flex-start !important;
}

/* Wysokość stała na blok tekstowy, żeby 1-linia i 2-linie nie zmieniały położenia obrazka */
.benefit_text {
    min-height: 40px;     /* dostosuj — zwykle 35–45px */
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
}

.title_list {
  text-align: center; /* wyśrodkowanie tekstu */
  font-size: 1.6rem;
  font-weight: 600;
  color: #fff;
  width: 50%;
  margin: 0 auto 50px auto; /* centrowanie div i odstęp na dole */
  background-image: url('modules/ps_listyzakupowe/views/templates/hook/headline_background.png');
  background-size: cover;        /* rozciąga tło na cały div */
  background-position: center;   /* wyśrodkowanie tła */
  background-repeat: no-repeat;  /* brak powtarzania */
  padding: 40px;                 /* opcjonalnie, żeby tekst nie przyklejał się do krawędzi */
  padding-top: 80px;
}
.top_spacer {
  height: 40px; /* wysokość pustego miejsca nad tytułem */
  width: 100%;
  background-size: cover;
}


</style>