{if isset($car_blocks_data.random)}
	<div class="random-cars">
		<div class="section-header section-header--accent">
			<h2><span>{$block.title|escape:'html'}</span></h2>
		</div>
		<div class="owl-carousel ia-carousel js-carousel-random">
			{foreach $car_blocks_data.random as $item}
				<div class="ia-carousel__item">
					<div class="b-car-card b-car-card--simple">
						<div class="b-car-card__img">
							{if $item.auto_pictures}
								<a href="{$item.link}">{printImage imgfile=$item.auto_pictures[0]['path'] title=$item.model}</a>
							{/if}
							<h4><a href="{$item.link}">{$item.model}, {$item.release_year}</a></h4>
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

	{ia_print_js files='_IA_TPL_owl.carousel.min'}

	{ia_add_js}
$(function() {
	$('.js-carousel-random').owlCarousel({
		items: 6,
		margin: 10,
		dots: false,
		nav: true,
		navText: ['<i class="fa fa-arrow-left"></i>','<i class="fa fa-arrow-right"></i>'],
		responsive: {
			0: {
				items: 1
			},
			320: {
				items: 2
			},
			500: {
				items: 3
			},
			768: {
				items: 6
			}
		}
	});
});
	{/ia_add_js}
{/if}