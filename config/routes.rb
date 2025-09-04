Rails.application.routes.draw do
  get 'pages/home'

  root "pages#home"

  get "signup", to: "users#new"
  post "signup", to: "users#create"

  resources :users, only: [:new, :create]
end
