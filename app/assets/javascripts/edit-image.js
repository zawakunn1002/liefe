$(function(){
  $('#file').change(function(e){

    var file = e.target.files[0];
    var reader = new FileReader();

    //2Dコンテキストのオブジェクトを生成する
    var cvs = document.getElementById('cvs1');
    var ctx = cvs.getContext('2d');

    //画像でない場合は処理終了
   if(file.type.indexOf("image") < 0){
      return false;
    }

    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){

        var img = new Image();
        img.src = e.target.result;
        img.onload = function() {
          ctx.drawImage(img, 0, 0, 100, 100);
        }
      };
    })(file);
    reader.readAsDataURL(file);
  });
});