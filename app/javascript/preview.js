document.addEventListener('DOMContentLoaded', function(){
//プレビュー機能
  // 日記作成・編集ページのみで関数が動くように指定
  if ( document.getElementById('diary_form')){
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

      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `message_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'diary[images][]')
      inputHTML.setAttribute('type', 'file')

      // 生成したdiv要素にimg要素を子要素として入れる
      imageElement.appendChild(blobImage);
      // 生成したdiv要素に生成した選択ボタンの要素を子要素として入れる
      imageElement.appendChild(inputHTML);
      // 上記のdiv要素をビューのdiv要素に入れる
      ImageList.appendChild(imageElement);

      // 生成したファイル選択ボタンに変化あれば発火
      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);
        createImageHTML(blob)
      });
    };
    // 表示されているファイル選択ボタンに変化があればイベント発火
    document.getElementById('item-image').addEventListener('change', function(e){
      // イベントの中の画像ファイルの配列データを取得
      const file = e.target.files[0];
      // 取得した画像ファイルのURLを生成
      const blob = window.URL.createObjectURL(file);
      // URLを渡して、選択した画像を表示する関数呼び出し
      createImageHTML(blob);


      // 編集機能を実装
      // 編集ボタンを作成
      // 編集ボタンが押されたら生成されている画像を削除
    
    });
  } 
})
