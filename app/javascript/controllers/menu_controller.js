// controllers/menu_controller.js
export default class extends Controller {
  toggle() {
    this.element.classList.toggle("open")
  }
}