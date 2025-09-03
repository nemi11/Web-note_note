import { Application } from "@hotwired/stimulus" // ← Application を import
import CarouselController from "./carousel_controller" // ← Controller を import

const application = Application.start()
application.register("carousel", CarouselController) // ← Controller を登録
