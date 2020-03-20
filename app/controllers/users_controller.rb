class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @userimage = @user.image.url
    @userinfo = @user.created_at
    @pokemons = @user.pokemons
    @fav_pokemons = @user.favorite_pokemons

    @follow_user= User.find(params[:id])
    @f_user = @follow_user.followings
    @ed_user = @follow_user.followers
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end
  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
  
end
