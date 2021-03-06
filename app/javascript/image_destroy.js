document.addEventListener('DOMContentLoaded', function(){
// 画像データの削除機能
  // 新規作成・編集ページのみで関数が動くように指定
  if ( document.getElementById('diary_edit_form')){
    // 投稿画像が5枚以下ならファイル選択ボタン表示
    let selectedNum = document.querySelectorAll('.image-element').length
    if (selectedNum < 5) {
      clickUpload = document.getElementsByClassName('click-upload')
      clickUpload[0].setAttribute('style', 'display: block;')
    }

    // 削除ボタンを全て取得
    const deleteButtons = document.querySelectorAll("input[image_id]");
    // 各削除ボタンを取得してイベント適用
    deleteButtons.forEach(function (deleteButton){ 
      deleteButton.addEventListener("click", (e) => {
        // クリックされた削除ボタンの要素取得
        const clickedButton = e.target;
        // クリックされた削除ボタンのimage_idを取得
        const imageId = clickedButton.getAttribute("image_id");
        // クリックされた削除ボタンのdiary_idを取得
        const diaryId = clickedButton.getAttribute("diary_id");
        // サーバにリクエストを送るためのオブジェクト生成
        const XHR = new XMLHttpRequest();
        // リクエスト内容
        XHR.open("GET", `/diaries/${imageId}/image_destroy/`, true);
        // レスポンスのタイプを指定
        XHR.responseType = "json";
        // リクエストを送信
        XHR.send();
        // // サーバサイドで処理後データが返却される
        // // レスポンスの受信が成功した場合にが呼び出される
        
        XHR.onload = () => {
        // エラーの場合（200=正常）
          if (XHR.status != 200) {
              alert(`Error ${XHR.status}: ${XHR.statusText}`);
              エラーの場合は処理を抜ける
              return null
          };
          // 受け取ったレスポンス
          const response = XHR.response.post;
          // 同じimage-idを持ったdiv要素を取得
          const destroyImages =  document.querySelectorAll("div[image_id]");
          destroyImages.forEach(function (destroyImage) {
            if (destroyImage.getAttribute("image_id") == response){
              destroyImage.remove()
            }; 
          });
          // image-idと同じvalueを持ったinput要素を取得(削除対象のblob_idを送らないようにする)
          const destroy_blob_ids = document.getElementsByName("diary[images_blob_ids][]");
          destroy_blob_ids.forEach(function (destroy_blob_id) {
            if (destroy_blob_id.getAttribute("value") == response){
              destroy_blob_id.remove()
            }; 
          });
          // 投稿画像が5枚以下ならファイル選択ボタン表示
          let selectedNum = document.querySelectorAll('.image-element').length
            if (selectedNum < 5) {
              clickUpload = document.getElementsByClassName('click-upload')
              clickUpload[0].setAttribute('style', 'display: block;')
          }
        };
        e.preventDefault();
      }); 
    });
  };
})
