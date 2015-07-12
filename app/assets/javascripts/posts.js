/*global $*/
/*jslint browser: true, devel: true*/
$(function() {
  $('.read_more_btn').click(function(event)
  {
    event.preventDefault();
    var link = location.protocol + '//' + 
               location.hostname + ':' + 
               location.port + 
               $(this).attr('href');

   $('.modal_dialog').hide();
    $('#post_content').load(link, function(){
      $('.modal_dialog').fadeIn('slow');
    });                        

  });                        
});
