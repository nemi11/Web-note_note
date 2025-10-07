import { application } from "controllers/application"

import CarouselController from "controllers/carousel_controller"
import MenuController from "controllers/menu_controller"
// index.js
import "controllers/application"

application.register("carousel", CarouselController)
application.register("menu", MenuController)
