
function populateStatesForCountry(country, parentDiv){
  $.ajax({
    type: 'GET',
    url: '/get_state_for_country/' + country,
    dataType : 'json',
    success: function(data) {
      emptyStates(parentDiv);
      if(data['success'] == true){
        $.each(data['data'], function(index, dt) {
          parentDiv.find('select#state').append('<option value="'+ dt[1] +'">'+dt[0]+'</option>');
        });
      }
    },
    error: function(e){
      console.log('Server Error.');
    }
  });
}

function emptyStates(parentDiv){
  parentDiv.find('select#state option').each(function() {
    $(this).remove();
  });
  parentDiv.find('select#state').append('<option value="">Select State</option>');
}

$(document).on('turbolinks:load', function() {
  $("#new_user input:radio[name='user[roles][]']").change(function(){
    if(this.value == 'Samaritan' && this.checked) {
      $(".organization_fields").hide();
      $(".samaritan_fields").show();
    } else {
      $(".organization_fields").show();
      $(".samaritan_fields").hide();
    }
  });

  $(".search_select2").select2();

  $('form#new_user select#country').on('change', function () {
    parentDiv = $('#select_state');
    var selectedCountry = $(this).val();
    populateStatesForCountry(selectedCountry, parentDiv);
  });
});