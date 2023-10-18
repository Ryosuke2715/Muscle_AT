Rails.application.routes.draw do


  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customer,skip: [:passwords] ,controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # ゲストユーザー
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: "homes#top"
  get "about" => "homes#about"
  # Public routes
  scope module: :public do

    get "customers/mypage" => "customers#show"
    resources :customers
    resources :training_posts
    resources :meal_posts
  end

  namespace :public do
    resources :training_posts do
      collection do
        get 'user_posts' # ユーザーの投稿一覧表示用のルート
      end
    end
  end

  # admin routes
  scope module: :admin do
    resources :customers
    resources :training_posts
    resources :meal_posts
  end
  
  namespace :admin do
    root 'customers#index'
    resources :customers # 例: 管理者向けの顧客リソース
    resources :training_posts # 例: 管理者向けのトレーニング投稿リソース
    resources :meal_posts # 例: 管理者向けの食事投稿リソース
  end
end
