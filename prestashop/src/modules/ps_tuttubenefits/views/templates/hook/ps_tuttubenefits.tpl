
<ul class="benefit_list">
  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <a href="{$cmsLink}">
        <img height="53" width="53" src="modules/ps_tuttubenefits/views/templates/hook/1.svg" alt="ikona" class="benefit-icon">
      </a>
    </div>
    <div class="benefit_text">
      <span class="benefit_headline orange"><a href="{$cmsLink}">Gwarancja 100% satysfakcji</a></span>
      <span class="benefit_headline_sub orange"><a href="{$cmsLink}">"KUP-SPRAWDŹ-WYMIEŃ</a></span>
    </div>
  </li>
  
  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <img height="53" width="53" src="modules/ps_tuttubenefits/views/templates/hook/2.svg" alt="ikona" class="benefit-icon">
    </div>
    <div class="benefit_text">
      <span class="benefit_headline">99% pozytywnych opinii</span>
      <span class="benefit_headline_sub">zadowolenie klientów jest priorytetem</span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <img height="53" width="53" src="modules/ps_tuttubenefits/views/templates/hook/3.svg" alt="ikona" class="benefit-icon">
    </div>
    <div class="benefit_text">
      <span class="benefit_headline">20 lat doświadczenia</span>
      <span class="benefit_headline_sub">i profesjonalnej obsługi</span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <img height="53" width="53" src="modules/ps_tuttubenefits/views/templates/hook/4.svg" alt="ikona" class="benefit-icon">
    </div>
    <div class="benefit_text">
      <span class="benefit_headline">Pomoc w doborze produktu</span>
      <span class="benefit_headline_sub">udzielana przez pasjonatów</span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <img height="53" width="53" src="modules/ps_tuttubenefits/views/templates/hook/5.svg" alt="ikona" class="benefit-icon">
    </div>
    <div class="benefit_text">
      <span class="benefit_headline">Znamy sprzęt</span>
      <span class="benefit_headline_sub">bo sami go używamy</span>
    </div>
  </li>

  <li class="benefit_item">
    <div class="benefit_icon_wrapper">
      <img height="53" width="53" src="modules/ps_tuttubenefits/views/templates/hook/6.svg" alt="ikona" class="benefit-icon">
    </div>
    <div class="benefit_text">
      <span class="benefit_headline">Darmowa dostawa</span>
      <span class="benefit_headline_sub">zrób zakupy za min. 299 zł</span>
    </div>
  </li>

</ul>


<style>
ul.benefit_list {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-row-gap: 1rem;
  padding: 0;
  margin: 0;
  grid-column-gap: 4rem;
}

ul.benefit_list > li.benefit_item {
  list-style: none;
  display: flex;
  flex-direction: column;
  align-items: center;
}

ul.benefit_list > li.benefit_item:first-child .benefit_headline,
ul.benefit_list > li.benefit_item:first-child .benefit_headline_sub {
  color: #e35420;
}

ul.benefit_list > li.benefit_item .benefit_icon_wrapper {
  width: 43px;
}

ul.benefit_list > li.benefit_item .benefit_icon_wrapper img.benefit-icon {
  max-width: 43px;
}

ul.benefit_list > li.benefit_item .benefit_text {
  display: flex;
  flex-direction: column;
}

.benefit_headline {
  font-size: 1.5rem;
  font-weight: 700;
  margin-bottom: 0.6rem;
  text-align: center;
}

.benefit_headline_sub {
  text-align: center;
  font-size: 1.2rem;
  font-weight: 400;
}

@media (min-width: 757px) {
  ul.benefit_list {
    grid-template-columns: 1fr 1fr 1fr;
    grid-column-gap: 1rem;
    grid-row-gap: 1rem;
  }

  ul.benefit_list > li.benefit_item {
    flex-direction: column;
    align-items: center;
  }

  ul.benefit_list > li.benefit_item .benefit_icon_wrapper {
    width: unset;
    height: 64px;
    margin-bottom: 0;
  }

  ul.benefit_list > li.benefit_item .benefit_icon_wrapper img.benefit-icon {
    max-width: unset;
    max-height: 64px;
  }

  .benefit_headline {
    font-size: 1.4rem;
  }

  ul.benefit_list > li.benefit_item .benefit_text {
    align-items: center;
  }
}

@media (min-width: 979px) {
  ul.benefit_list {
    grid-template-columns: 1fr 1fr 1fr;
    margin: 2rem 0;
  }

  ul.benefit_list img {
    width: 64px;
    height: 64px;
  }

  ul.benefit_list > li.benefit_item .benefit_icon_wrapper {
    margin-bottom: 2.5rem;
  }

  .benefit_headline {
    font-size: 1.3rem;
  }

  .benefit_headline_sub {
    display: flex;
  }
}

@media (min-width: 1680px) {
  ul.benefit_list {
    grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr;
    grid-row-gap: 0;
  }
}
</style>