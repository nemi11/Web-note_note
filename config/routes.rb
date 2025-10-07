# frozen_string_literal: true

Rails.application.routes.draw do
  get 'notes/new'
  get 'notes/create'
  get 'home/index'
  get 'pages/home'
  root 'pages#home'
  devise_for :users
  
  # ログイン関連
  get  "login",  to: "sessions#new"     # ログイン画面
  post "login",  to: "sessions#create"  # ログイン処理
  delete "logout", to: "sessions#destroy" # ログアウト
  get "logout", to: "sessions#destroy"

  # 会員登録関連（Userコントローラ想定）
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
  #　マイノート
  get 'notes/mine', to: 'notes#mine', as: 'my_notes'

  resources :users, only: %i[new create show]
  resources :notes, only: [:new, :create, :index, :show]
  
end
