# config/routes.rb
Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # ログイン用ルート
  get    'login',  to: 'sessions#new'     # ログインフォーム
  post   'login',  to: 'sessions#create'  # ログイン処理
  delete 'logout', to: 'sessions#destroy' # ログアウト

  resources :users, only: %i[new create]
end
