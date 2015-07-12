/*global $*/
/*jslint browser: true, devel: true*/
$(function() {
  $('.read_more_btn').click(function(event)
  {
    event.preventDefault();
    var link = "http://localhost:3000" + $(this).attr('href');

    $('#post_content').load(link, function(){
      $('#post_content').fadeIn();
    });                        

  });                        
});
