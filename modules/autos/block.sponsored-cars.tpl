{if isset($car_blocks_data.sponsored)}
	<div class="sponsored-cars">
		<div class="container">
			<div class="section-header">
				<h2>{lang key='sponsored_for_sale'}</h2>
			</div>

			<div class="sponsored-cars__list">
				{foreach $car_blocks_data.sponsored as $item}
					<div class="sponsored-cars__list__item">
						<div class="b-car-card">
							<div class="b-car-card__img">
								{if !empty($item.pictures)}
									<a href="{$item.link}">{ia_image file=$item.pictures[0] title=$item.model type='thumbnail'}</a>
								{/if}
								<h4><a href="{$item.link}">{$item.model}, {$item.release_year}</a></h4>
							</div>
							<div class="b-car-card__body">
								<a href="{$smarty.const.IA_URL}search/cars/body:{$item.body_type}/">{lang key="field_autos_body_type+{$item.body_type}"}</a><br>
								{lang key="field_autos_exterior_color+{$item.exterior_color}"}<br>
								{lang key="field_autos_transmission+{$item.transmission}"} {lang key='field_autos_transmission'}<br>
								{lang key="field_autos_drive_type+{$item.drive_type}"}
							</div>
							<div class="b-car-card__info">
								<div class="b-car-card__info__price">{$item.price_formatted}</div>
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