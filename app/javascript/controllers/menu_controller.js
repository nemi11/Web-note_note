// app/javascript/controllers/menu_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "tooltip"]

  initialize() {
  console.log("menu initialized", this.menuTarget)
  }
  
  connect() {
    // outside click 用ハンドラを bind して保管
    this._outsideClickHandler = this._outsideClick.bind(this)
  }

  // トグル（ボタン押下）
  toggle(event) {
    event?.stopPropagation()
    if (this.menuTarget.classList.contains("open")) {
      this._close()
    } else {
      this._open()
    }
  }

  // マウスオーバーでツールチップ表示（non-login 用）
  showTooltip(event) {
    const tip = event.currentTarget.querySelector(".tooltip")
    if (tip) tip.classList.remove("hidden")
  }

  // マウスアウトで非表示
  hideTooltip(event) {
    const tip = event.currentTarget.querySelector(".tooltip")
    if (tip) tip.classList.add("hidden")
  }

  // connect で document のクリックリスナを入れる（open 時だけ）
  _open() {
    this.menuTarget.classList.add("open")
    // 少し遅らせてからドキュメントクリックを監視（クリックで閉じるため）
    setTimeout(() => document.addEventListener("click", this._outsideClickHandler), 0)
  }

  _close() {
    this.menuTarget.classList.remove("open")
    document.removeEventListener("click", this._outsideClickHandler)
  }

  _outsideClick(e) {
    // メニュー内クリックなら無視
    if (!this.element.contains(e.target)) {
      this._close()
    }
  }

  disconnect() {
    document.removeEventListener("click", this._outsideClickHandler)
  }
}
