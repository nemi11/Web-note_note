import { Application } from "@hotwired/stimulus"
import CarouselController from "./controllers/carousel_controller"

const application = Application.start()

application.debug = false
window.Stimulus = application

application.register("carousel", CarouselController)

export { application }