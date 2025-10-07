// app/javascript/controllers/note_form_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sections"]

  addSection() {
    const template = document.querySelector("#section-template").content.cloneNode(true)
    this.sectionsTarget.appendChild(template)
  }
}