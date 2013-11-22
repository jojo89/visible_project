$(document).ready(function(){
  $('#pull_angel').on('click',function(e){
    e.preventDefault();
    var url = '/fetch';
    var site = $('#startup_website').val();
    $.post(url,{data: site},function(){
    });
  });
});