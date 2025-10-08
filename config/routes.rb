Rails.application.routes.draw do
  # Deviseのルート（1回だけ！）
  devise_for :users

  devise_scope :user do
    get "signup", to: "devise/registrations#new", as: :custom_signup
    get "login", to: "devise/sessions#new", as: :login
    post "login", to: "devise/sessions#create"
    delete "logout", to: "devise/sessions#destroy", as: :logout
  end

  # ログイン済みユーザー向けのトップページ
  authenticated :user do
    root to: 'dashboard#index', as: :authenticated_root
  end

  # 未ログインユーザー向けのトップページ
  unauthenticated do
    root to: 'home#index', as: :unauthenticated_root
  end

  # 最後にこれを追加！
  root to: 'home#index'

  # その他のページ
  get 'dashboard/index'
  get 'home/index'
  get 'pages/home'

  # ノート関連
  get 'notes/mine', to: 'notes#mine', as: :my_notes
  resources :notes, only: [:new, :create, :index, :show]

  # ユーザー関連（Deviseと競合しないように注意）
  resources :users, only: [:show]
end