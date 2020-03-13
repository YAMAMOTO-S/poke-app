class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @pokemons = current_user.pokemons
  end
  
end
