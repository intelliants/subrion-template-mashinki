<div class="b-car b-car--{$listing.status} {if $listing.featured}b-car--featured{/if} {if $listing.sponsored}b-car--sponsored{/if}">
	{if $listing.auto_pictures}
		<a class="b-car__img" href="{ia_url item='autos' type='url' data=$listing}">
			{printImage class='img-responsive' imgfile=$listing.auto_pictures[0]['path'] title=$listing.model}

			<span class="b-car__img__badge">
				<span class="fa fa-image"></span> {$listing.auto_pictures_num}
			</span>
		</a>
	{else}
		<a class="b-car__img b-car__img--no-preview" href="{ia_url item='autos' type='url' data=$listing}">
			<img src="{$img}car-no-preview.png" class="img-responsive" alt="{$listing.model}">
		</a>
	{/if}

	<div class="b-car__labels">
		{if $listing.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
		{if $listing.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}
	</div>

	<div class="b-car__body">
		<div class="b-car__body__price">{$config.currency} {$listing.price}</div>
		<div class="b-car__body__sinfo">
			<span><span class="fa fa-clock"></span> {$listing.date_added|date_format:$config.date_format}</span>
			<span><span class="fa fa-eye"></span> {$listing.views_num}</span>
		</div>
		<h3><a href="{ia_url item='autos' type='url' data=$listing}">{$listing.model}, {$listing.release_year}</a></h3>

		<div class="b-car__actions">
			{printFavorites item=$listing itemtype='autos' guests=true}
			{accountActions item=$listing itemtype='autos'}
			<a href="{ia_url item='autos' data=$listing type='url'}">{lang key='details'} <span class="fa fa-angle-double-right"></span></a>
		</div>
		<table class="b-car__body__spec">
			<tbody>
				<tr>
					<td>{lang key='field_auto_type'}:</td>
					<td><b><a href="{$packages.autos.url}condition/{$listing.auto_type}/">{lang key="field_auto_type_{$listing.auto_type}"}</a></b></td>
					<td class="second-column">{lang key='field_transmission'}:</td>
					<td><b>{lang key="field_transmission_{$listing.transmission}"}</b></td>
				</tr>
				<tr>
					<td>{lang key='field_body_type'}:</td>
					<td><b><a href="{$packages.autos.url}body-style/{$listing.body_type}/">{lang key="field_body_type_{$listing.body_type}"}</b></a></td>
					<td class="second-column">{lang key='field_drive_type'}:</td>
					<td><b>{lang key="field_drive_type_{$listing.drive_type}"}</b></td>
				</tr>
				<tr>
					<td>{lang key='field_exterior_color'}:</td>
					<td><b>{lang key="field_exterior_color_{$listing.exterior_color}"}</b></td>
				</tr>
			</tbody>
		</table>

	</div>
</div>
