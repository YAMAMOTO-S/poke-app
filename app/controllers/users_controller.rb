class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @userimage = user.image.url
    @userinfo = user.created_at
    @pokemons = user.pokemons
    @fav_pokemons = user.favorite_pokemons
  end
  
end
