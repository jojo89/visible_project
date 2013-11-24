function fill_fields(response,markets){
  $('#startup_name').val(response.name)
  $('#startup_state').val(response.state)
  $('#startup_pitch').val(response.pitch)
  $('#startup_logo_url').val(response.logo_url)
  $('#startup_angel_url').val(response.angellist_url)
  $('#startup_description').val(response.description)
  $('#startup_city').val(response.city)
  $('#startup_markets').val(markets)
  $('#logo').remove();
  $('.photo').append('<img src='+response.logo_url+' id="logo"/>')
}

function getData(response){
  marketString = ""
  $.each(response.markets,function(index,value){
    marketString = marketString + value + ", "
  });
  var length = marketString.length
  console.log(length)
  marketString = marketString.substring(0, length - 2);
  console.log(marketString)
  fill_fields(response,marketString)
}

function run_post(){
  $('.error').remove();
  var url = '/fetch_website';
  var site = $('#startup_website').val();
  $.post(url,{data: site},function(response){
    if(response.message == "Url not found")
    {
      $('h1').after("<p class="+"error"+">" + response.message + "</p>")
    }
    else
    {
      getData(response);
    }
  });
}


$(document).ready(function(){
  $('#pull_website').on('click',function(e){
    e.preventDefault();
    run_post()
  });  
});