<div class="b-tools">
	<div class="b-tools__header">
		<ul class="nav nav-tabs">
			<li class="nav-tabs-title"><span>{lang key='tools'}</span></li>
			<li><a href="#tab-saved-cars" data-toggle="tab"><span class="fa fa-star text-warning"></span></a></li>
			<li class="active"><a href="#tab-recently-viewed-cars" data-toggle="tab"><span class="fa fa-clock-o"></span></a></li>
		</ul>
	</div>
	<div class="b-tools__content">
		<div class="tab-content">
			<div class="tab-pane active" id="tab-recently-viewed-cars">
				{if $car_blocks_data.recently_viewed}
					<div class="ia-items recently-viewed-cars">
						{foreach $car_blocks_data.recently_viewed as $entry}
							<div class="ia-item">
								{if !empty($entry.pictures)}
									<a href="{$entry.link}" class="ia-item__image">{ia_image file=$entry.pictures[0] title=$entry.model|strip_tags|truncate:'30' width=60 type='thumbnail'}</a>
								{/if}

								<div class="ia-item__content">
									<h5 class="ia-item__title">
										<a href="{$entry.link}">{$entry.model|strip_tags|truncate:'30'}</a>
									</h5>
									{if !empty($entry.price)}<p><span class="fa fa-tag"></span> {$core.config.currency} {$entry.price}</p>{/if}
								</div>
							</div>
						{/foreach}
					</div>
				{else}
					<div class="alert alert-info">{lang key='no_recently_viewed_cars'}</div>
				{/if}
			</div>
			<div class="tab-pane" id="tab-saved-cars">
				{if $car_blocks_data.saved_listings}
					<div class="ia-items saved-cars">
						{foreach $car_blocks_data.saved_listings as $entry}
							<div class="ia-item">
								{if !empty($entry.pictures)}
									<a href="{$entry.link}" class="ia-item__image">{ia_image file=$entry.pictures[0] title=$entry.model|strip_tags|truncate:'30' width=60 type='thumbnail'}</a>
								{/if}

								<div class="ia-item__content">
									<h5 class="ia-item__title">
										<a href="{$entry.link}">{$entry.model|strip_tags|truncate:'30'}</a>
									</h5>
									{if !empty($entry.price)}<p><span class="fa fa-tag"></span> {$core.config.currency} {$entry.price}</p>{/if}
								</div>
							</div>
						{/foreach}
					</div>
				{else}
					<div class="alert alert-info">{lang key='no_saved_cars'}</div>
				{/if}
				<p class="text-center m-b-0 m-t"><a class="btn btn-link" href="{$smarty.const.IA_URL}favorites/"><span class="fa fa-star"></span> {lang key='see_all_favorites'}</a></p>
			</div>
		</div>
	</div>
</div>
