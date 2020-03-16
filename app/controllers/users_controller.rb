class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @pokemons = user.pokemons
    @fav_pokemons = user.favorite_pokemons
  end
  
end
