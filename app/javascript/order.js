function order() {
  // 買い物リストページのみで関数が動くように指定
  if ( document.getElementById('order_form')){
    const submit = document.getElementById("order_submit");
    submit.addEventListener("click", (e) => {
      // フォームオブジェクトを生成し、フォームの値を取得
      const formData = new FormData(document.getElementById("order_form"));
      // サーバにリクエストを送るためのオブジェクト生成
      const XHR = new XMLHttpRequest();
      // リクエスト内容
      XHR.open("DELETE", "/shopping_lists", true);
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
            return null
        }
        // 受け取ったレスポンス
        let orderLists = XHR.response.post;
        // idを一個づつ取り出す
        orderLists.forEach(function (orderList) {
          // リスト要素取得
          listIds = document.querySelectorAll("li");
          // リスト要素をの一つ取得
          listIds.forEach(function (listId) {
            let getList = listId.getAttribute("list-id")
            if (getList == orderList){
              listId.remove();
            }
          });
        });
        // 購入ボタンを取得
        const orderButton = document.getElementById("order_button");
        // checkboxがオンになっている数を取得
        const checkedNum = document.querySelectorAll("label[data-check]").length;
        // orderButtonにすでにdisplay:blockが付与されている場合
        if (orderButton.getAttribute("style") == "display:block;"){
          // チェックされているものがない場合
          if (checkedNum == 0){
            orderButton.removeAttribute("style", "display:block;")
          }
        };
      }
      // submitボタン押した時の標準動作をなくす
      e.preventDefault();
    });
  }
}

window.addEventListener("load", order);