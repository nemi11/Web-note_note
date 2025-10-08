Rails.application.routes.draw do
  # ----------------------
  # Deviseのルート
  # ----------------------
  devise_for :users

  devise_scope :user do
    get    "signup", to: "devise/registrations#new",  as: :custom_signup
    get    "login",  to: "devise/sessions#new",       as: :login
    post   "login",  to: "devise/sessions#create"
    delete "logout", to: "devise/sessions#destroy",   as: :logout
  end

  # ----------------------
  # 共通トップページ
  # ----------------------
  root to: 'home#index'   # ここにアクセスすると home#index に飛ぶ

  # ----------------------
  # その他のページ
  # ----------------------
  get 'dashboard/index'
  get 'home/index'
  get 'pages/home'

  # ----------------------
  # ノート関連
  # ----------------------
  get 'notes/mine', to: 'notes#mine', as: :my_notes
  resources :notes, only: [:new, :create, :index, :show]

  # ----------------------
  # ユーザー関連
  # ----------------------
  resources :users, only: [:show]
end
