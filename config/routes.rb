Rails.application.routes.draw do
  devise_for :users
  resources :pokemons
  root to: 'pokemons#index'
end
