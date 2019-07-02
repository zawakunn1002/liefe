$(function(){
 	$(document).on('turbolinks:load', function(){
  		$('#flipbook').turn({
  			elevation: 50,
  		    gradients: true,
 			autoCenter: false,
 			direction: 'rtl'
  		});
  	});
 });