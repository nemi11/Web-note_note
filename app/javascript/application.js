import "@hotwired/turbo-rails"
import "controllers"
import "jquery"

document.addEventListener("turbo:load", () => {
  // jQueryでメニュー開閉
  $(".menu-btn").on("click", function() {
    $(".menu").toggle();
  });

  // 他のjQueryコードもここに書ける
});
