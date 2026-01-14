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
{block name='login_form'}

  {block name='login_form_errors'}
    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  <form id="login-form" action="{block name='login_form_actionurl'}{$action}{/block}" method="post">

    <div>
      {block name='login_form_fields'}
        {foreach from=$formFields item="field"}
          {if $field.name == 'email'}
            <div class="form-group {if !empty($field.errors)}has-error{/if}">
              <label class="sr-only{if $field.required} required{/if}" for="field-{$field.name}">
                {$field.label}
              </label>
              <input
                id="field-{$field.name}"
                class="form-control w-100"
                name="{$field.name}"
                type="{$field.type}"
                value="{$field.value}"
                {if $field.autocomplete}autocomplete="{$field.autocomplete}"{/if}
                placeholder="{l s='Login / Nr karty stałego klienta / E-mail' d='Shop.Theme.Customeraccount'}"
                {if $field.required}required{/if}
              >
              {include file='_partials/form-errors.tpl' errors=$field.errors}
            </div>
          {elseif $field.name == 'password'}
            <div class="form-group {if !empty($field.errors)}has-error{/if}">
              <label class="sr-only{if $field.required} required{/if}" for="field-{$field.name}">
                {$field.label}
              </label>
              <input
                id="field-{$field.name}"
                class="form-control w-100"
                name="{$field.name}"
                type="password"
                value=""
                {if $field.autocomplete}autocomplete="{$field.autocomplete}"{/if}
                placeholder="{l s='Hasło / Pin karty stałego klienta' d='Shop.Theme.Customeraccount'}"
                {if $field.required}required{/if}
              >
              {include file='_partials/form-errors.tpl' errors=$field.errors}
            </div>
          {else}
            {block name='form_field'}
              {form_field field=$field}
            {/block}
          {/if}
        {/foreach}
      {/block}
      <div class="forgot-password">
        <a href="#forgot-password" rel="nofollow">
          {l s='Nie pamiętam loginu lub hasła' d='Shop.Theme.Customeraccount'}
        </a>
      </div>
    </div>

    {block name='login_form_footer'}
      <footer class="form-footer text-sm-center clearfix">
        <input type="hidden" name="submitLogin" value="1">
        {block name='form_buttons'}
          <button id="submit-login" class="btn tuttu-btn-orange" data-link-action="sign-in" type="submit" class="form-control-submit">
            {l s='ZALOGUJ SIĘ' d='Shop.Theme.Actions'}
          </button>
        {/block}
      </footer>
    {/block}

  </form>
{/block}
