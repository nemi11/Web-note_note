import jquery from "jquery"
window.$ = window.jQuery = jquery

import { Application } from "@hotwired/stimulus"
import MenuController from "controllers/menu_controller"
import CarouselController from "controllers/carousel_controller"
import Rails from "@rails/ujs"
Rails.start()

const application = Application.start()
application.debug = false
window.Stimulus = application

application.register("menu", MenuController)
application.register("carousel", CarouselController)

export { application }
