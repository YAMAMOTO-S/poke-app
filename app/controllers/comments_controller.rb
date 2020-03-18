class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_back(fallback_location: '/pokemons/#{pokemon.id}')
  end
  

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, pokemon_id: params[:pokemon_id])
  end
  
end
