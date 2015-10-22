$(function() {

	// toggle tooltips
	$('[data-toggle="tooltip"]').tooltip();
	
	// quick search

	if ($('#used-qs-car-price').length) {
		$('#used-qs-car-price').ionRangeSlider(
		{
			onChange: function(obj)
			{
				$('#used-price_from').val(obj.from);
				$('#used-price_to').val(obj.to);
			}
		});

		$modelSelect = $('.js-car-model'),
		$loader = $('.b-selects__item__loader'),
		$fmid  = $('input[name="fmid"]'),
		$mid  = $('input[name="mid"]');
		$defaultmid = $mid.val();

		$('.js-car-make').on('change', function(e, state)
		{
			var make   = $(this).val(),
				url    = intelli.config.packages.autos.url + 'models.json?fn=?',
				params = {pid: make};

			$modelSelect.val(0).prop('disabled', true).find('option:not(:first)').remove();
			
			$fmid.val(make);
			if (!state) $mid.val(make);
			$loader.css('display', 'block');
			
			if ('0' != make)
			{
				$.getJSON(url, params, function(response)
				{
					if (response && response.length > 0)
					{
						$.each(response, function(index, item)
						{
							var $option = $('<option>').val(item.id).text(item.title);
							if (item.id == $defaultmid) $option.attr('selected', 'selected');
							$modelSelect.append($option);
						});
						
						$modelSelect.prop('disabled', false);
						$loader.css('display', 'none');
					}
					else
					{
						$loader.css('display', 'none');
					}
				});	
			}
			else {
				$modelSelect.val(0);
				$mid.val(0);
				$loader.css('display', 'none');
			}
		}).trigger('change', [true]);

		$modelSelect.on('change', function()
		{
			if ($modelSelect.val() == 0)
			{
				$mid.val($fmid.val());
			}
			else
			{
				$mid.val($modelSelect.val());
			}
		});
	}
});