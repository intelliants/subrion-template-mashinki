{if isset($car_blocks_data.recent)}
	<div class="section-header">
		<h2><span>Latest</span> cars for sale</h2>
	</div>
	<div class="cars-list">
		{foreach $car_blocks_data.recent as $item}
			<div class="b-car">
				{if $item.auto_pictures}
					<a class="b-car__img" href="{ia_url item='autos' type='url' data=$item}">
						{printImage class='img-responsive' imgfile=$item.auto_pictures[0]['path'] title=$item.model}

						<span class="b-car__img__badge">
							<span class="fa fa-image"></span> {$item.auto_pictures_num}
						</span>
					</a>
				{else}
					<a class="b-car__img b-car__img--no-preview" href="{ia_url item='autos' type='url' data=$item}">
						<img src="{$img}car-no-preview.png" class="img-responsive" alt="{$item.model}">
					</a>
				{/if}
				<div class="b-car__body">
					<div class="b-car__body__price">{$item.price}</div>
					<div class="b-car__body__sinfo">
						<span><span class="fa fa-clock"></span> {$item.date_added|date_format:$config.date_format}</span>
						<span><span class="fa fa-eye"></span> {$item.views_num}</span>
					</div>
					<h3><a href="{$item.link}">{$item.model}, {$item.release_year}</a></h3>

					<table class="b-car__body__spec">
						<tbody>
							<tr>
								<td>{lang key='field_auto_type'}:</td>
								<td><b><a href="{$packages.autos.url}condition/{$item.auto_type}/">{lang key="field_auto_type_{$item.auto_type}"}</a></b></td>
								<td class="second-column">{lang key='field_transmission'}:</td>
								<td><b>{lang key="field_transmission_{$item.transmission}"}</b></td>
							</tr>
							<tr>
								<td>{lang key='field_body_type'}:</td>
								<td><b><a href="{$packages.autos.url}body-style/{$item.body_type}/">{lang key="field_body_type_{$item.body_type}"}</a></b></td>
								<td class="second-column">{lang key='field_drive_type'}:</td>
								<td><b>{lang key="field_drive_type_{$item.drive_type}"}</b></td>
							</tr>
							<tr>
								<td>{lang key='field_exterior_color'}:</td>
								<td><b>{lang key="field_exterior_color_{$item.exterior_color}"}</b></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		{/foreach}
	</div>
{/if}