/*global $*/
/*jslint browser: true, devel: true*/
$(function() {
  var dialog = document.querySelector('dialog');

  $(".read_more_button").click(function(event)
  {
    event.preventDefault();
    var link = $(this).attr('href');

    $("#post_content").load(link, function(){
      $("#post_content").fadeIn();
      dialog.showModal();
    });                        
  });                        

  $('#close').on('click', function() {
    dialog.close();
  });
});
