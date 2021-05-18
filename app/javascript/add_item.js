function add_item() {
  // 買い物ページのみで関数が動くように指定
  if ( document.getElementById('order_form')){
    const submit = document.getElementById("submit");
    submit.addEventListener("click", (e) => {
      // フォームオブジェクトを生成し、フォームの値を取得
      const formData = new FormData(document.getElementById("form"));
      // 空の場合
      if (document.getElementById("content").value == ""){
        alert("品物を入力してください");
        return null;
      }
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
          if (XHR.status == 500) {
            alert("その品物はすでにリストにあります");
            // エラーの場合は処理を抜ける
            return null
          }else{
            alert(`Error ${XHR.status}: ${XHR.statusText}`);
            // エラーの場合は処理を抜ける
            return null
          };
        }
        const shopping_list = XHR.response.post;
        const post = document.getElementsByClassName("post");
        // 入力フォームを取得
        const formText = document.getElementById("content");
        const value = shopping_list.id;
        // フォーム送信の内容表示
        const HTML = `
          <li list-id="${value}">
            <input type="checkbox" name="check[]" id="check" value="${value}">
            <label id="${value}" for="check">${shopping_list.item_name}</label>
          </li>`;
        // list要素の直後にHTMLを追加
        post[0].insertAdjacentHTML("afterbegin",HTML);
        // フォームの値を空欄にする
        formText.value = "";
      };
      // submitボタン押した時の標準動作をなくす
      e.preventDefault();
    });
  }
}

window.addEventListener("load", add_item);