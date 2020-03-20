class FavoritesController < ApplicationController
  before_action :set_variables

  def create
    favorite = current_user.favorites.build(pokemon_id: params[:pokemon_id])
    favorite.save
  end

  def destroy
    favorite = Favorite.find_by(pokemon_id: params[:pokemon_id], user_id: current_user.id)
    favorite.destroy
  end



  private

  def set_variables
    @pokemon = Pokemon.find(params[:pokemon_id])
    @id_name = "#like-link-#{@pokemon.id}"
  end
  
end
