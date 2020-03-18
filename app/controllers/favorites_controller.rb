class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(pokemon_id: params[:pokemon_id])
    favorite.save
    redirect_back(fallback_location: '/pokemons/#{pokemon.id}')
  end

  def destroy
    favorite = Favorite.find_by(pokemon_id: params[:pokemon_id], user_id: current_user.id)
    favorite.destroy
    redirect_back(fallback_location: '/pokemons/#{pokemon.id}')
  end
end
