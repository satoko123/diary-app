function check() {
  // 全checkbox要素取得
  const checkboxes = document.getElementsByName("check");
  // 各checkbox要素取得
  checkboxes.forEach(function (checkbox) {
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
    }); 
  });
}
  
window.addEventListener("load", check);