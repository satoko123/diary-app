function preview_destroy(){
  //プレビュー削除機能
    // 日記作成・編集ページのみで関数が動くように指定
  if ( document.getElementById('diary_form')){
      // 削除ボタンがクリックされればイベント発火
      let deleteButtons = document.querySelectorAll('.deleteButton');
      deleteButtons.forEach(function (deleteButton) {
        deleteButton.addEventListener('click', function(e){

          // ファイル選択ボタンの数を再計算して再度割り振りする
          let uploadLabels = document.querySelectorAll('.upload_label')
          uploadLabels.forEach(function (uploadLabel, index) {
            uploadLabel.setAttribute('uploadLabelNum', `${index}`);   
          });

          // クリックされた削除ボタンの親要素取得して消す
          const imageElement = deleteButton.parentNode
          imageElement.remove()
          
          // クリックされた削除ボタンのdeleteButtonNumを取得
          const clickedDeleteButtonNum = deleteButton.getAttribute('deleteButtonNum')
          
          // let deleteLabel = uploadLabels.find((uploadLabel) => uploadLabel.getAttribute('uploadLabelNum') === clickedDeleteButtonNum);
          // console.log(deleteLabel);

          // 対応するファイル選択ボタンの要素取得して消す
          uploadLabels.forEach(function (uploadLabel){     
            // ファイル選択ボタンのuploadLabelNumを取得する
            const clickedUploadLabelNum = uploadLabel.getAttribute('uploadLabelNum')
            if ( clickedDeleteButtonNum == clickedUploadLabelNum ){
              uploadLabel.remove()
              return null;
            };
          });

          // 削除ボタンの要素取得してdeleteButtonNum再度割り振り
          let deleteButtons = document.querySelectorAll('.deleteButton')
          deleteButtons.forEach(function (deleteButton, index) {
            deleteButton.setAttribute('deleteButtonNum', `${index}`);
          });

          e.preventDefault(); 
        });
      });
    };
  }
setInterval(preview_destroy, 1000);
