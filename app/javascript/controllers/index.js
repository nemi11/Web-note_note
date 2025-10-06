import { application } from "controllers/application"

import CarouselController from "controllers/carousel_controller"
import MenuController from "controllers/menu_controller"

application.register("carousel", CarouselController)
application.register("menu", MenuController)
