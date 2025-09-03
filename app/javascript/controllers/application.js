import { Application } from "@hotwired/stimulus"  // ← これがないと動かない
import "./controllers"

const application = Application.start()
export { application }
