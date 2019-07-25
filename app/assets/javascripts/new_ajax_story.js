$(function(){
  $("#ajax_story").click(function() {
    toastr.options = {
      "closeButton": true,
      "debug": false,
      "newestOnTop": false,
      "progressBar": false,
      "positionClass": "toast-top-center",
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
  },60000);

  $("#delete_ajax_story").click(function(){
      toastr.options = {
      "closeButton": true,
      "debug": false,
      "newestOnTop": false,
      "progressBar": false,
      "positionClass": "toast-top-center",
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
    Command: toastr["info"]("下書きを削除しました。ページをもう一度読み込むと本文の内容が消えます")

    $.cookie('text', $('new-textArea').val())
    $.removeCookie('text');
    $('new-textArea').text($.cookie('text'))
  });
  $("#new-botton").click(function(){
    $.cookie('text', $('new-textArea').val())
    $.removeCookie('text');
    $('new-textArea').text($.cookie('text'))
  })
});

