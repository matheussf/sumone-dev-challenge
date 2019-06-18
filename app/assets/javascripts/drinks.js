function ready(event) {
	$('input[type=radio][name=searchRadio]').change(function() {
	if (this.value === 'simple') {
	  $('.simple-form').show();
	  $('.advanced-form').hide();
	}
	else if (this.value === 'advanced') {
	  $('.simple-form').hide();
	  $('.advanced-form').show();
	  $.ajax({
        url: '/recommend'
    });
	}
	});
	
	$(".simple-form__input").keyup(function() {
     $.ajax({
        url: '/search',
        data: {search: $(this).serialize().split("=")[1]}
     });
 });
}

