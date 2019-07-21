$(function(){
    window.addEventListener("DOMContentLoaded", function(){
           var count = null,
               lest = null,
               max = 1200,
               input_area = document.getElementById("edit-textArea"),
               output_count = document.getElementById("textCount"),
               output_lest = document.getElementById("textLest"),
               attention = document.getElementById("textAttention");
               console.log(input_area)

            input_area.onkeyup = function(){
               var length = input_area.value.length;
                   count = length;
                   lest =  max - length;
                   output_lest.innerText = lest;
                   output_count.innerText = count;
                   attention.style.display = ( length > max ) ? "block" : "none";
            }
    }, false);
 });