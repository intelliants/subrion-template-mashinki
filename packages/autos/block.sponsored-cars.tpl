{if isset($car_blocks_data.sponsored)}
	<div class="sponsored-cars">
		<div class="container">
			<div class="section-header">
				<h2><span>Sponsored</span> cars for sale</h2>
			</div>

			<div class="sponsored-cars__list">
				{foreach $car_blocks_data.sponsored as $item}
					<div class="sponsored-cars__list__item">
						<div class="b-car-card">
							<div class="b-car-card__img">
								{if $item.auto_pictures}
									<a href="{$item.link}">{printImage imgfile=$item.auto_pictures[0]['path'] title=$item.model}</a>
								{/if}
								<h4><a href="{$item.link}">{$item.model}, {$item.release_year}</a></h4>
							</div>
							<div class="b-car-card__body">
								<a href="{$packages.autos.url}body-style/{$item.body_type}/">{lang key="field_body_type_{$item.body_type}"}</a><br>
								{lang key="field_exterior_color_{$item.exterior_color}"}<br>
								{lang key="field_transmission_{$item.transmission}"} {lang key='field_transmission'}<br>
								{lang key="field_drive_type_{$item.drive_type}"}
							</div>
							<div class="b-car-card__info">
								<div class="b-car-card__info__price">{$item.price}</div>
								<a href="{$item.link}">{lang key='more'}</a>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		</div>
	</div>

	{ia_print_js files='_IA_TPL_owl.carousel.min'}

	{ia_add_js}
$(function()
{
	$('.sponsored-cars__list').owlCarousel({
		loop: true,
		margin: 30,
		nav: true,
		dots: false,
		navText: ['<i class="fa fa-arrow-left"></i>','<i class="fa fa-arrow-right"></i>'],
		responsive:{
			0:{
				items:1
			},
			600:{
				items:3
			},
			1000:{
				items:4
			}
		}
	});
});
	{/ia_add_js}

{/if}