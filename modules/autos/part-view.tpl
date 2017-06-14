<div class="row">
    <div class="col-md-5">
        <table class="ia-item-view__table">
            <tbody>
                <tr>
                    <td>{lang key='field_autos_parts_price'}</td>
                    <td><b class="text-success">{$core.config.currency}{$item.price}</b></td>
                </tr>
                <tr>
                    <td>{lang key='field_autos_parts_categories'}</td>
                    <td>
                        {$cats = explode(',', $item.categories)}

                        {foreach $cats as $cat}
                            {lang key="field_autos_parts_categories_{$cat}"}{if !$cat@last}, {/if}
                        {/foreach}
                    </td>
                </tr>
                {if !empty($item.part_number)}
                    <tr>
                        <td>
                            {lang key='field_autos_parts_part_number'}
                        </td>
                        <td>
                            #{$item.part_number}
                        </td>
                    </tr>
                {/if}
            </tbody>
        </table>
    </div>

    <div class="col-md-7">
        {if !empty($item.pictures)}
            {ia_add_media files='fotorama'}

            <div class="ia-item-view__gallery">
                <div class="fotorama"
                     data-nav="thumbs"
                     data-width="100%"
                     data-ratio="1600/900"
                     data-allowfullscreen="true"
                     data-fit="{$core.config.template_fotorama_part}">
                    {foreach $item.pictures as $entry}
                        <a class="ia-item-view__gallery__item" href="{ia_image file=$entry url=true type='original'}">{ia_image file=$entry type='original'}</a>
                    {/foreach}
                </div>
            </div>
        {/if}

        <div class="ia-item-view__info">
            <div class="ia-item-view__section">
                <h3>{lang key='details'}</h3>
                {$item.description|escape}
            </div>
        </div>

        <div class="m-t-lg">
            {ia_hooker name='smartyItemViewBeforeTabs'}

            {include file='item-view-tabs.tpl' isView=true exceptions=['pictures', 'title', 'price', 'categories', 'description', 'part_number'] class='ia-item-view-tabs'}

            {ia_hooker name='smartyViewListingBeforeFooter'}
        </div>
    </div>
</div>