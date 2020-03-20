class BadsController < ApplicationController
  def create
    bad = current_user.bads.build(comment_id: params[:comment_id])
    bad.save
    redirect_back(fallback_location: '/pokemons/#{pokemon.id}')
  end

  def destroy
    bad = Bad.find_by(comment_id: params[:comment_id], user_id: current_user.id)
    bad.destroy
    redirect_back(fallback_location: '/pokemons/#{pokemon.id}')
  end
end
