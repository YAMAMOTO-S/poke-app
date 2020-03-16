Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'pokemons#index'

  resources :pokemons do
    resource :favorites, only: [:create, :destroy]
  end




  resources :users, only: :show
end
