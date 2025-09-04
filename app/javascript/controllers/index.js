// app/javascript/controllers/index.js
import { application } from "./application"

// この1行が大事
import CarouselController from "./carousel_controller"
application.register("carousel", CarouselController)
