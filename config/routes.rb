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
    resources :training_posts do
      resource :training_fav, only: [:create, :destroy]
      resources :training_comments, only: [:create, :destroy]
    end
    get "training_fav" => "training_favs#index"
    resources :meal_posts do
      resource :meal_fav, only: [:create, :destroy]
      resources :meal_comments, only: [:create, :destroy]
    end
    get "meal_fav" => "meal_favs#index"
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
    resources :customers
    resources :training_posts do
      resources :training_comments, only: [:destroy]
    end
    resources :meal_posts do
      resources :meal_comments, only: [:destroy]
    end
  end
end
