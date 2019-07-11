 $(function(){
     $(document).on('turbolinks:load', function(){
         var count = null,
             lest = null,
             max = 1200,
             input_area = document.getElementById("textArea"),
             output_count = document.getElementById("textCount"),
             output_lest = document.getElementById("textLest"),
             attention = document.getElementById("textAttention");

          input_area.onkeyup = function(){
                  length = input_area.value.length;
                  count = length;
                  lest =  max - length;
                  output_lest.innerText = lest;
                  output_count.innerText = count;
                  attention.style.display = ( length > max ) ? "block" : "none";
         }
     });
 }, false);