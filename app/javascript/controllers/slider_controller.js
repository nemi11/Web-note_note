import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  connect() {
    console.log("Slider controller connected!")

  }
}
