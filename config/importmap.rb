pin "application"
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @8.0.18
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery" # @3.7.1
pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @8.0.18
pin "@rails/actioncable/src", to: "@rails--actioncable--src.js" # @8.0.300
