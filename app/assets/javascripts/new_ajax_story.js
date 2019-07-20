$(function(){
  $("#ajax_story").click(function() {
    $.ajax({
      url: 'ajax_story',
      type: 'POST',
      data: {
        "textAreaValue": $('#new-textArea').val()
      },
      dataType: 'json'
    }).done(function(a) {
       toastr.options.timeOut = 3000;
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
    }).fail(function(a) {
      alert('保存に失敗しました');
    });
  });
  $(document).ready(function(){
      setInterval(function(){
        $.cookie('text', $('#new-textArea').val());
      },180000);
      $('#ajax_story').click(function(){
          $.cookie('text', $('#new-textArea').val());
      });
      var a = $.cookie('text')
      if (a === "") {
          $('#new-textArea').text($.cookie(''));
      } else {
          $('#new-textArea').text($.cookie('text'));
      }
  });
});