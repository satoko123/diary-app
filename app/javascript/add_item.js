function add_item() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    // フォームオブジェクトを生成し、フォームの値を取得
    const formData = new FormData(document.getElementById("form"));
    // サーバにリクエストを送るためのオブジェクト生成
    const XHR = new XMLHttpRequest();
    // リクエスト内容
    XHR.open("POST", "/shopping_lists", true);
    // レスポンスのタイプを指定
    XHR.responseType = "json";
    // 取得したフォームデータとともにリクエストを送信
    XHR.send(formData);

    // サーバサイドで処理後データが返却される
    // レスポンスの受信が成功した場合にonloadが呼び出される
    XHR.onload = () => {
      // エラーの場合（200=正常）
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        // エラーの場合は処理を抜ける
        return null; 
      }
      const shopping_list = XHR.response.post;
      const list = document.getElementById("list");
      // 入力フォームを取得
      const formText = document.getElementById("content");
      // フォーム送信の内容表示
      const HTML = `
        <div class="post" >
          <div>
            ${shopping_list.item_name}
          </div>
        </div>`;
      // list要素の直後にHTMLを追加
      list.insertAdjacentHTML("afterend", HTML);
      // フォームの値を空欄にする
      formText.value = "";
    };
    // submitボタン押した時の標準動作をなくす
    e.preventDefault();
  });
}

window.addEventListener("load", add_item);