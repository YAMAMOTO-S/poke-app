Rails.application.routes.draw do
  devise_for :users
  root to: 'pokemons#index'
  resources :pokemons
  resources :users, only: :show
end
