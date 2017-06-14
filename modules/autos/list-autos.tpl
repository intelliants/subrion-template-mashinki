<div class="b-car b-car--{$listing.status} {if $listing.featured}b-car--featured{/if} {if $listing.sponsored}b-car--sponsored{/if}">
    {if !empty($listing.pictures)}
        <a class="b-car__img" href="{$listing.link}">
            {ia_image class='img-responsive' file=$listing.pictures[0] title=$listing.model type='thumbnail'}

            <span class="b-car__img__badge">
                <span class="fa fa-image"></span> {$listing.pictures_num}
            </span>
        </a>
    {else}
        <a class="b-car__img b-car__img--no-preview" href="{$listing.link}">
            <img src="{$img}car-no-preview.png" class="img-responsive" alt="{$listing.model}">
        </a>
    {/if}

    <div class="b-car__labels">
        {if $listing.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
        {if $listing.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}
    </div>

    <div class="b-car__body">
        <div class="b-car__body__price">{$listing.price-formatted}</div>
        <div class="b-car__body__sinfo">
            <span><span class="fa fa-clock"></span> {$listing.date_added|date_format:$core.config.date_format}</span>
            <span><span class="fa fa-eye"></span> {$listing.views_num}</span>
        </div>
        <h3><a href="{$listing.link}">{$listing.model}, {$listing.release_year}</a></h3>

        <div class="b-car__actions">
            {printFavorites item=$listing itemtype='autos' guests=true}
            {accountActions item=$listing itemtype='autos'}
            <a href="{$listing.link}">{lang key='details'} <span class="fa fa-angle-double-right"></span></a>
        </div>
        <table class="b-car__body__spec">
            <tbody>
                <tr>
                    <td>{lang key='field_autos_condition'}:</td>
                    <td><b>{lang key="field_autos_condition+{$listing.condition}"}</b></td>
                    <td class="second-column">{lang key='field_autos_transmission'}:</td>
                    <td><b>{lang key="field_autos_transmission+{$listing.transmission}"}</b></td>
                </tr>
                <tr>
                    <td>{lang key='field_autos_body_type'}:</td>
                    <td><b>{lang key="field_autos_body_type+{$listing.body_type}"}</b></td>
                    <td class="second-column">{lang key='field_autos_engine'}:</td>
                    <td><b>
                        {if $listing.engine}
                            <a class="ia-car-info__icon ia-car-info__icon--engine" href="{$listing.link}">{lang key="field_autos_engine+{$listing.engine}"}{if $listing.engine_type} {lang key="field_autos_engine_type+{$listing.engine_type}"}{/if}{if $listing.engine_size} {$listing.engine_size}{/if}</a>
                        {/if}
                    </b></td>
                </tr>
                <tr>
                    <td>{lang key='field_autos_exterior_color'}:</td>
                    <td><b>{lang key="field_autos_exterior_color+{$listing.exterior_color}"}</b></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
