(function($) {

  $('#blood_group').parent().append('<ul class="list-item" id="newblood_group" name="blood_group"></ul>');
  $('#blood_group option').each(function(){
      $('#newblood_group').append('<li value="' + $(this).val() + '">'+$(this).text()+'</li>');
  });
  $('#blood_group').remove();
  $('#newblood_group').attr('id', 'blood_group');
  $('#blood_group li').first().addClass('init');
  $("#blood_group").on("click", ".init", function() {
      $(this).closest("#blood_group").children('li:not(.init)').toggle();
  });
  
  var allOptions = $("#blood_group").children('li:not(.init)');
  $("#blood_group").on("click", "li:not(.init)", function() {
      allOptions.removeClass('selected');
      $(this).addClass('selected');
      $("#blood_group").children('.init').html($(this).html());
      allOptions.toggle();
  });

  var marginSlider = document.getElementById('slider-margin');
  if (marginSlider != undefined) {
      noUiSlider.create(marginSlider, {
            start: [500],
            step: 10,
            connect: [true, false],
            tooltips: [true],
            range: {
                'min': 0,
                'max': 1000
            },
            format: wNumb({
                decimals: 0,
                thousand: ',',
                prefix: '$ ',
            })
    });
  }
  $('#reset').on('click', function(){
      $('#register-form').reset();
  });

  $('#register-form').validate({
    rules : {
        first_name : {
            required: true,
        },
        last_name : {
            required: true,
        },
        company : {
            required: true
        },
        email : {
            required: true,
            email : true
        },
        phone_number : {
            required: true,
        }
    },
    onfocusout: function(element) {
        $(element).valid();
    },
});

    jQuery.extend(jQuery.validator.messages, {
        required: "",
        remote: "",
        email: "",
        url: "",
        date: "",
        dateISO: "",
        number: "",
        digits: "",
        creditcard: "",
        equalTo: ""
    });
})(jQuery);