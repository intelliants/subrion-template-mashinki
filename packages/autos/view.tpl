<div class="ia-item-view">
	<div class="ia-item-view__price">{$item.price}</div>
	<div class="ia-item-view__info">
		{if $item.sponsored}<span class="ia-item-view__info__item"><span class="label label-warning">{lang key='sponsored'}</span></span>{/if}
		{if $item.featured}<span class="ia-item-view__info__item"><span class="label label-info">{lang key='featured'}</span></span>{/if}
		<span class="ia-item-view__info__item">{lang key='field_auto_type'}: <a href="{$packages.autos.url}condition/{$item.auto_type}/"><b>{lang key="field_auto_type_{$item.auto_type}"}</b></a></span>
		{if $item.mileage}<span class="ia-item-view__info__item">{lang key='field_mileage'}: <b>{$item.mileage}</b></span>{/if}
		<span class="ia-item-view__info__item"><span class="fa fa-eye"></span> {$item.views_num}</b></span>
		<span class="ia-item-view__info__item"><span class="fa fa-calendar"></span> {lang key='added_on'} {$item.date_added|date_format:$config.date_format}</b></span>
	</div>

	{if !empty($item.auto_pictures)}
		{ia_add_media files='fotorama'}

		<div class="ia-item-view__gallery">
			<div class="fotorama" 
				 data-nav="thumbs"
				 data-width="100%"
				 data-ratio="800/400"
				 data-allowfullscreen="true"
				 data-fit="cover">
				{foreach $item.auto_pictures as $entry}
					<a class="ia-item-view__gallery__item" href="{printImage imgfile=$entry.path url=true fullimage=true}">{printImage imgfile=$entry.path title=$entry.title}</a>
				{/foreach}
			</div>
		</div>
	{/if}

	<div class="ia-item-view__section">
		<h3>{lang key='details'}</h3>
		<div class="row">
			<div class="col-md-6">
				<table class="ia-item-view__table">
					<tbody>
						<tr>
							<td>{lang key='model'}</td>
							<td>{$item.model}</td>
						</tr>
						<tr>
							<td>{lang key='field_release_year'}</td>
							<td><a href="{$packages.autos.url}year/{$item.release_year}/">{$item.release_year}</a></td>
						</tr>
						<tr>
							<td>{lang key='field_price'}</td>
							<td><span class="text-success">{$item.price}</span></td>
						</tr>
						<tr>
							<td>{lang key='field_auto_type'}</td>
							<td><a href="{$packages.autos.url}condition/{$item.auto_type}/">{lang key="field_auto_type_{$item.auto_type}"}</a></td>
						</tr>
						{if $item.mileage}
							<tr>
								<td>{lang key='field_mileage'}</td>
								<td>{$item.mileage}</td>
							</tr>
						{/if}
						{if $item.engine}
							<tr>
								<td>{lang key='field_engine'}</td>
								<td>{lang key="field_engine_{$item.engine}"}</td>
							</tr>
						{/if}
						{if $item.engine_type}
							<tr>
								<td>{lang key='field_engine_type'}</td>
								<td>{lang key="field_engine_type_{$item.engine_type}"}</td>
							</tr>
						{/if}
						{if $item.engine_size}
							<tr>
								<td>{lang key='field_engine_size'}</td>
								<td>{$item.engine_size}</td>
							</tr>
						{/if}
						{if $item.horse_power}
							<tr>
								<td>{lang key='field_horse_power'}</td>
								<td>{$item.horse_power}</td>
							</tr>
						{/if}
						{if $item.transmission}
							<tr>
								<td>{lang key='field_transmission'}</td>
								<td>{lang key="field_transmission_{$item.transmission}"}</td>
							</tr>
						{/if}
					</tbody>
				</table>
			</div>
			<div class="col-md-6">
				<table class="ia-item-view__table">
					<tbody>
						<tr>
							<td>{lang key='field_body_type'}</td>
							<td><a href="{$packages.autos.url}body-style/{$item.body_type}/">{lang key="field_body_type_{$item.body_type}"}</a></td>
						</tr>
						{if $item.exterior_color}
							<tr>
								<td>{lang key='field_exterior_color'}</td>
								<td>{lang key="field_exterior_color_{$item.exterior_color}"}</td>
							</tr>
						{/if}
						{if $item.door_count}
							<tr>
								<td>{lang key='field_door_count'}</td>
								<td>{lang key="field_door_count_{$item.door_count}"}</td>
							</tr>
						{/if}
						{if $item.metallic}
							<tr>
								<td>{lang key='field_metallic'}</td>
								<td>{lang key="field_metallic_{$item.metallic}"}</td>
							</tr>
						{/if}
						{if $item.interior_color}
							<tr>
								<td>{lang key='field_interior_color'}</td>
								<td>{lang key="field_interior_color_{$item.interior_color}"}</td>
							</tr>
						{/if}
						{if $item.interior_leather}
							<tr>
								<td>{lang key='field_interior_leather'}</td>
								<td>{lang key="field_interior_leather_{$item.interior_leather}"}</td>
							</tr>
						{/if}
						{if $item.drive_type}
							<tr>
								<td>{lang key='field_drive_type'}</td>
								<td>{lang key="field_drive_type_{$item.drive_type}"}</td>
							</tr>
						{/if}
						{if $item.vin_code}
							<tr>
								<td>{lang key='field_vin_code'}</td>
								<td>{$item.vin_code}</td>
							</tr>
						{/if}
						{if $item.fuel_type}
							<tr>
								<td>{lang key='field_fuel_type'}</td>
								<td>
									{assign fuel explode(',', $item.fuel_type)}
									{foreach $fuel as $one}
										{lang key="field_fuel_type_{$one}"}{if !$one@last}, {/if}
									{/foreach}
								</td>
							</tr>
						{/if}
					</tbody>
				</table>
			</div>
		</div>
	</div>

	{if $item.options_features}
		<div class="ia-item-view__section">
			<h3>{lang key='car_features'}</h3>
			<div class="ia-item-view__features">
				{foreach explode(',', $item.options_features) as $opt}
					<div class="ia-item-view__features__item"><span class="fa fa-check-square"></span> {lang key="field_options_features_{$opt}"}</div>
				{/foreach}
			</div>
		</div>
	{/if}

	{if $item.additional_info}
		<div class="ia-item-view__section">
			<h3>{lang key='field_additional_info'}</h3>
			{$item.additional_info}
		</div>
	{/if}

	{ia_hooker name='smartyItemViewBeforeTabs'}

	{include file='item-view-tabs.tpl' isView=true exceptions=array('model', 'price', 'release_year', 'auto_type', 'mileage', 'engine', 'engine_type', 'engine_size', 'horse_power', 'transmission', 'auto_pictures', 'fuel_type', 'body_type', 'exterior_color', 'door_count', 'metallic', 'interior_color', 'interior_leather', 'drive_type', 'vin_code', 'additional_info', 'options_features') class='ia-item-view-tabs'}

	{ia_hooker name='smartyViewListingBeforeFooter'}
</div>

{ia_add_js}
$(function() {
	$('.js-delete-listing').on('click', function(e) {
		e.preventDefault();

		intelli.confirm(_t('do_you_really_want_to_delete_listing'), { url: $(this).attr('href') });
	});
});
{/ia_add_js}