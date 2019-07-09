
$(function(){
    $(document).on('turbolinks:load', function(){
    	var w = $(window).width();
    	var x = 769;
    		if (w >= x) {
      		$('#footer-character').hover(
      			function() {
          			$('.a').fadeIn(300);
          			$('.b').fadeIn(600);
          			$('.c').fadeIn(900);
          			$('.d').fadeIn(1200);
          			$('.e').fadeIn(1500);
          			$('.f').fadeIn(1800);
          			$('.g').fadeIn(2100);
          			$('.h').fadeIn(2400);
          			$('.i').fadeIn(2700);
          			$('.j').fadeIn(3000);
        		},
        		function() {
          			$('.a').fadeOut(3000);
          			$('.b').fadeOut(2700);
          			$('.c').fadeOut(2400);
          			$('.d').fadeOut(2100);
          			$('.e').fadeOut(1800);
          			$('.f').fadeOut(1500);
          			$('.g').fadeOut(1200);
          			$('.h').fadeOut(900);
          			$('.i').fadeOut(600);
          			$('.j').fadeOut(300);
       			 }
      		);
        }
    });
});