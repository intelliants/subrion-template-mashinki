{if isset($car_blocks_data.recent)}
    <div class="section-header">
        <h2>{lang key='latest_for_sale'}</h2>
    </div>
    <div class="cars-list">
        {foreach $car_blocks_data.recent as $item}
            <div class="b-car">
                {if !empty($item.pictures)}
                    <a class="b-car__img" href="{$item.link}">
                        {ia_image class='img-responsive' file=$item.pictures[0] title=$item.model type='thumbnail'}

                        <span class="b-car__img__badge">
                            <span class="fa fa-image"></span> {$item.pictures_num}
                        </span>
                    </a>
                {else}
                    <a class="b-car__img b-car__img--no-preview" href="{ia_url item='autos' type='url' data=$item}">
                        <img src="{$img}car-no-preview.png" class="img-responsive" alt="{$item.model}">
                    </a>
                {/if}
                <div class="b-car__body">
                    <div class="b-car__body__price">{$item.price_formatted}</div>
                    <div class="b-car__body__sinfo">
                        <span><span class="fa fa-clock"></span> {$item.date_added|date_format:$core.config.date_format}</span>
                        <span><span class="fa fa-eye"></span> {$item.views_num}</span>
                    </div>
                    <h3><a href="{$item.link}">{$item.model}, {$item.release_year}</a></h3>

                    <table class="b-car__body__spec">
                        <tbody>
                            <tr>
                                <td>{lang key='field_autos_condition'}:</td>
                                <td><b><a href="{$smarty.const.IA_URL}search/cars/condition:{$item.condition}/">{lang key="field_autos_condition+{$item.condition}"}</a></b></td>
                                <td class="second-column">{lang key='field_autos_transmission'}:</td>
                                <td><b>{lang key="field_autos_transmission+{$item.transmission}"}</b></td>
                            </tr>
                            <tr>
                                <td>{lang key='field_autos_body_type'}:</td>
                                <td><b><a href="{$smarty.const.IA_URL}search/cars/body:{$item.body_type}/">{lang key="field_autos_body_type+{$item.body_type}"}</a></b></td>
                                <td class="second-column">{lang key='field_autos_drive_type'}:</td>
                                <td><b>{lang key="field_autos_drive_type+{$item.drive_type}"}</b></td>
                            </tr>
                            <tr>
                                <td>{lang key='field_autos_exterior_color'}:</td>
                                <td><b>{lang key="field_autos_exterior_color+{$item.exterior_color}"}</b></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        {/foreach}
    </div>
{/if}