// NB only needed if signed in as admin, may be worth having a
// conditional include if I end up not using elsewhere.
//= require jquery_ujs
//= require_tree .
        
$(document).ready(function() {

  
  return;
  // I'm not too happy with this as of yet.

  /* activate sidebar */
  $('#sidebar').affix({
    offset: {
      top: 58
    }
  });

  /* activate scrollspy menu */
  var $body   = $(document.body);
  var navHeight = $('.navbar').outerHeight(true) + 10;

  $body.scrollspy({
    target: '#leftCol',
    offset: navHeight
  });

  /* smooth scrolling sections */
  $('a[href*=#]:not([href=#])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
          $('html,body').animate({
            scrollTop: target.offset().top - 50
          }, 1000);
          return false;
        }
      }
  });
});
