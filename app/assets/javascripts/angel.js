$(document).ready(function(){
  $('#pull_angel').on('click',function(e){
    e.preventDefault();
    var url = '/fetch';
    var site = $('#startup_website').val();
    $.post(url,{data: site},function(response){
      console.log(response.markets)
      marketString = ""

      $.each(response.markets,function(index,value){
        marketString = marketString + value + ", "
      });

      $('#startup_name').val(response.name)
      $('#startup_state').val(response.state)
      $('#startup_pitch').val(response.pitch)
      $('#startup_logo_url').val(response.logo_url)
      $('#startup_angel_url').val(response.angellist_url)
      $('#startup_description').val(response.description)
      $('#startup_city').val(response.city)
      $('#startup_markets').val(marketString)
      $('form').append('<img src='+response.logo_url+')/>')
      

    });
  });
});