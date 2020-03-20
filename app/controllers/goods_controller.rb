class GoodsController < ApplicationController
  def create
    good = current_user.goods.build(comment_id: params[:comment_id])
    good.save
    redirect_back(fallback_location: '/pokemons/#{pokemon.id}')
  end

  def destroy
    good = Good.find_by(comment_id: params[:comment_id], user_id: current_user.id)
    good.destroy
    redirect_back(fallback_location: '/pokemons/#{pokemon.id}')
  end
end
