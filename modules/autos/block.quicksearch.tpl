{if isset($car_blocks_data.search)}
    <form action="{$smarty.const.IA_URL}search/cars/" method="get" id="as_form" class="b-search">
        <div class="container">
            <div class="b-search__controls">
                <div class="b-search__controls__item b-search__controls__item--selects">
                    <div class="b-selects">
                        <div class="b-selects__item">
                            <select name="condition" id="as_condition">
                                <option value="">{lang key='field_autos_condition'}</option>
                                <option value="new"{if isset($smarty.get.condition) && 'new' == $smarty.get.condition} selected{/if}>{lang key='mashinki_new'}</option>
                                <option value="used"{if isset($smarty.get.condition) && 'used' == $smarty.get.condition} selected{/if}>{lang key='mashinki_used'}</option>
                            </select>
                        </div>
                        <div class="b-selects__item">
                            <select class="js-car-make" name="mk">
                                <option value="">{lang key='make'}</option>
                                {foreach $car_blocks_data.search.categories as $item}
                                    <option value="{$item.id}"{if isset($smarty.get.mk) && $smarty.get.mk == $item.id} selected{/if}>{$item.name|escape}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="b-selects__item">
                            <div class="b-selects__item__loader"><div class="loader"></div></div>
                            <select class="js-car-model" name="md" data-spinner=".b-selects__item__loader">
                                <option value="">{lang key='model'}</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="b-search__controls__item b-search__controls__item--price">
                    <label for="">{lang key='price'}</label>
                    <input type="text" id="used-qs-car-price"
                        data-type="double"
                        data-min="0"
                        data-max="{if $max_auto_price}{$max_auto_price}{else}150000{/if}"
                        data-from="{if isset($smarty.get.price[f])}{$smarty.get.price[f]}{else}5000{/if}"
                        data-to="{if isset($smarty.get.price[t])}{$smarty.get.price[t]}{elseif $max_auto_price}{$max_auto_price}{else}40000{/if}"
                        data-step="1000">

                    <input type="hidden" id="used-price_from" name="price[f]" value="{if isset($smarty.get.price[f])}{$smarty.get.price[f]}{else}0{/if}">
                    <input type="hidden" id="used-price_to" name="price[t]" value="{if isset($smarty.get.price[t])}{$smarty.get.price[t]}{elseif $max_auto_price}{$max_auto_price}{else}150000{/if}">
                </div>
                <div class="b-search__controls__item b-search__controls__item--actions">
                    <button type="submit" class="btn btn-primary btn-block">{lang key='search'}</button>
                </div>
            </div>
        </div>
    </form>
    {ia_add_media files='js:_IA_TPL_ion.rangeSlider.min'}
    {ia_print_js files='_IA_URL_packages/autos/js/front/search'}
{/if}