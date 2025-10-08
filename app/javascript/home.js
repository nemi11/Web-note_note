// app/javascript/home.js

document.addEventListener("turbo:load", () => {
  console.log("✅ home.js loaded correctly!");

  const slider = document.querySelector(".slider");
  if (slider) {
    // ここにスライダー初期化の処理を記述（例: Swiperなど）
    console.log("スライダーを初期化します！");
  }
});
