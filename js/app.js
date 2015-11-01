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
	}
});