function check() {
  // 買い物リストページのみで関数が動くように指定
  if ( document.getElementById('order_form')){
    // 全checkbox要素取得
    const checkboxes = document.getElementsByName("check[]");
    // 各checkbox要素取得
    checkboxes.forEach(function (checkbox) {
      if (checkbox.getAttribute("data-load") != null) {
        return null;
      }
      checkbox.setAttribute("data-load", "true");
      checkbox.addEventListener("change", () => {
        // そのcheckboxをオンにしたらそのvalueを取得
        const check_id = checkbox.getAttribute("value");
        // 同じ値をidに持つ要素を取得し、要素を追加
        const check_list = document.getElementById(check_id);
        // check_listに指定した属性があるか否かで条件分け
        if (check_list.getAttribute("data-check")){
          // 色を元に戻す
          check_list.removeAttribute("data-check", "true");
        }else{
          // 色を付ける
          check_list.setAttribute("data-check", "true");
        }
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
        }else {
          // orderButtonにdisplay:blockが付与されていない場合
          // チェックされているものがある場合
          if (checkedNum > 0){
            orderButton.setAttribute("style", "display:block;")
          }
        };
      }); 
    });
  }
}
setInterval(check, 1000);