Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'pokemons#index'

# お気に入り
  resources :pokemons do
    resource :favorites, only: [:create, :destroy]
  end

# ポケモンにコメント
  resources :pokemons do 
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: :show
end
