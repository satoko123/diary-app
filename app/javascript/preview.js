document.addEventListener('DOMContentLoaded', function(){
//プレビュー機能
  // 日記作成ページのみで関数が動くように指定
  if ( document.getElementById('diary_new_form')){
    //画像表示用の要素を取得
    const ImageList = document.getElementById('image-list')

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      // 生成したdiv要素にclass名を付与
      imageElement.setAttribute('class', "image-element")
      // 何個目のimage-elementクラスのdiv要素か定義
      let imageElementNum = document.querySelectorAll('.image-element').length

      // 画像を表示するためのimg要素を生成
      const blobImage = document.createElement('img');
      // img要素にsrc属性を追加し、値に作成したURLを指定
      blobImage.setAttribute('src', blob);

      // // 削除ボタン生成 
      // const deleteButton = document.createElement('input');
      // // input要素に各属性を追加
      // deleteButton.setAttribute('type', 'submit');
      // deleteButton.setAttribute('name', 'commit');
      // deleteButton.setAttribute('value', '削除');
      // deleteButton.setAttribute('class', 'deleteButton');
      // let deleteButtons = document.querySelectorAll('.deleteButton')
      // let deleteButtonNum = deleteButtons.length
      // deleteButton.setAttribute('deleteButtonNum', `${deleteButtonNum}`);
      
      // ファイル選択ボタンの数を計算して割り振りする
      let uploadLabels = document.querySelectorAll('.upload_label')
      uploadLabels.forEach(function (uploadLabel, index) {
        uploadLabel.setAttribute('uploadLabelNum', `${index}`);   
      });

      //最初のlabel要素を消す
      const firstLabel = document.getElementById('upload_label')
      firstLabel.setAttribute('style', 'display: none;')

      // ファイル選択ボタンを生成
      // 最初のファイル生成ボタンのダイレクトアップロードURLを取得
      const firstInput = document.getElementById('diary-image')
      const firstUrl = firstInput.getAttribute('data-direct-upload-url')
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `diary_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'diary[images][]')
      inputHTML.setAttribute('type', 'file')
      inputHTML.setAttribute('data-direct-upload-url', firstUrl)
      inputHTML.setAttribute('style', 'display: none;')

      //文字生成
      const createDiv = document.createElement('div')
      createDiv.setAttribute('class', 'click')
      const string = 'クリックしてファイル選択'
      createDiv.insertAdjacentHTML('afterbegin', string) //生成した文字列をdiv要素に入れる

      //label要素を作成
      const labelElement = document.createElement('label')
      labelElement.setAttribute('for', `diary_image_${imageElementNum}`)
      labelElement.setAttribute('id', `diary_${imageElementNum}`)
      labelElement.setAttribute('class', "upload_label")
      const createIcon = document.createElement('i')
      createIcon.setAttribute('class', 'fas fa-file-upload upload_button')


      // 生成したdiv要素にimg要素を子要素として入れる
      imageElement.appendChild(blobImage);
      // さらに削除ボタンを加える
      // imageElement.appendChild(deleteButton);
      // 上記のdiv要素をビューのdiv要素に入れる
      ImageList.appendChild(imageElement);
      //生成したiconをlabel要素に入れる
      labelElement.appendChild(createIcon) 
      //生成したinput要素をlabel要素に入れる
      labelElement.appendChild(inputHTML) 
      labelElement.appendChild(createDiv) //生成した文字列をlabel要素に入れる
      let clickUpload = document.getElementsByClassName('click-upload')
      clickUpload[0].appendChild(labelElement)//label要素をclick-uploadに入れる
      

      //2枚目からは一つ前のlabel要素を削除
      if (imageElementNum > 0){
        const labelBefore = document.getElementById(`diary_${imageElementNum-1}`)
        labelBefore.setAttribute('style', 'display: none;')
      }

      // 画像5枚目でファイル選択ボタンを非表示にする
      if (imageElementNum === 4) {
        clickUpload = document.getElementsByClassName('click-upload')
        clickUpload[0].setAttribute('style', 'display: none;')
      }

      // 生成したファイル選択ボタンに変化あれば発火
      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);
        createImageHTML(blob)
      });
    };

    // 表示されているファイル選択ボタンに変化があればイベント発火
    document.getElementById('diary-image').addEventListener('change', function(e){
      // イベントの中の画像ファイルの配列データを取得
      const file = e.target.files[0];
      // 取得した画像ファイルのURLを生成
      const blob = window.URL.createObjectURL(file);
      // URLを渡して、選択した画像を表示する関数呼び出し
      createImageHTML(blob);
    
    });
  } 
})
