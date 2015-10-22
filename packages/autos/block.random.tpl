{if isset($car_blocks_data.random)}
	<div class="ia-items random-cars">
		{foreach $car_blocks_data.random as $item}
			<div class="ia-item ia-item--small ia-item--sep">
				{if $item.auto_pictures}
					<a class="ia-item__image" href="{$item.link}">{printImage imgfile=$item.auto_pictures[0]['path'] title=$item.model width=60}</a>
				{/if}

				<div class="ia-item__content">
					<div class="ia-item__title">
						<a href="{$item.link}">{$item.model}, {$item.release_year}</a>
					</div>
					<p class="ia-item__info"><span class="fa fa-tag"></span> {$item.price}</p>
				</div>
			</div>
		{/foreach}
	</div>
{/if}