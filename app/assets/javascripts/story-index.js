$(function(){
    var w = $(window).width();
    var x = 769;
    if (w >= x) {
      $('#fade').hover(
        function() {
          $('.story-index').fadeIn(1500);
        },
        function() {
          $('.story-index').fadeOut(1500);
        }
      );
      $('#fade2').hover(
        function() {
          $('.story-index2').fadeIn(1500);
        },
        function() {
          $('.story-index2').fadeOut(1500);
        }
      );
    }
});