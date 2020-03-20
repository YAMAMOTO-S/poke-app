Rails.application.routes.draw do

  get 'goods/create'
  get 'goods/destroy'
  devise_for :users
  root to: 'pokemons#index'
  resources :users, only: :show

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

end
