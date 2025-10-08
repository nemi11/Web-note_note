import { Application } from "@hotwired/stimulus"
import MenuController from "./menu_controller"
import CarouselController from "./carousel_controller"

const application = Application.start()
application.register("menu", MenuController)
application.register("carousel", CarouselController)

export { application }
