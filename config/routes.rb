# config/routes.rb
Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'
  
  # ログイン関連
  get  "login",  to: "sessions#new"     # ログイン画面
  post "login",  to: "sessions#create"  # ログイン処理
  delete "logout", to: "sessions#destroy" # ログアウト

  # 会員登録関連（Userコントローラ想定）
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # ログイン用ルート
  get    'login',  to: 'sessions#new'     # ログインフォーム
  post   'login',  to: 'sessions#create'  # ログイン処理
  delete 'logout', to: 'sessions#destroy' # ログアウト

  resources :users, only: %i[new create]
end
