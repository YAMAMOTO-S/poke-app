Rails.application.routes.draw do
  devise_for :users
  root to: 'pokemons#index'
  resources :users, only: [:show, :edit, :update]

# お気に入り
  resources :pokemons do
    resource :favorites, only: [:create, :destroy]
  end

# ポケモンにコメント
  resources :pokemons do 
    resources :comments, only: [:create, :destroy]
  end

# フレンド
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  #Good 
  resources :comments do
    resources :goods, only: [:create, :destroy]
  end

  # Bad
  resources :comments do
    resources :bads, only: [:create, :destroy]
  end

end
