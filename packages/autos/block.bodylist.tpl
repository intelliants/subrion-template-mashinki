{if isset($car_blocks_data.body)}
	<div class="bodystyle-list">
		<div class="row">
			{foreach $car_blocks_data.body as $item}
				<div class="col-md-4">
					<a href="{$item.link}" class="bodystyle-list__style bodystyle-list__style--{$item.name}">
						<span></span> {$item.title}
					</a>
				</div>

				{if $item@iteration % 3 == 0}
					</div>
					<div class="row">
				{/if}
			{/foreach}
		</div>
	</div>
{/if}