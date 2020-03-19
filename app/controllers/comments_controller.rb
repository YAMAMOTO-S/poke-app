class CommentsController < ApplicationController
  def create
    pokemon = Pokemon.find(params[:pokemon_id])
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    
    redirect_back(fallback_location: '/pokemons/#{pokemon.id}')
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_back(fallback_location: '/pokemons/#{pokemon.id}')
  end
  
  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, pokemon_id: params[:pokemon_id])
  end
  
end
