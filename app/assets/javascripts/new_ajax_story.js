$(function(){
  $("#ajax_story").click(function() {
    toastr.options = {
      "closeButton": true,
      "debug": false,
      "newestOnTop": false,
      "progressBar": false,
      "positionClass": "toast-top-full-width",
      "preventDuplicates": false,
      "showDuration": "300",
      "hideDuration": "1000",
      "timeOut": "5000",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
    }
    Command: toastr["info"]("保存に成功しました")

    $.cookie('text', $('#new-textArea').val());
    });
    var a = $.cookie('text')
    if (a === "") {
        $('#new-textArea').text($.cookie(''));
    } else {
        $('#new-textArea').text($.cookie('text'));
    }

  setInterval(function(){
    $.cookie('text', $('#new-textArea').val());
  },180000);
});