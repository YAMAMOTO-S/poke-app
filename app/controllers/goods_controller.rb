class GoodsController < ApplicationController
before_action :set_variables

  def create
    good = current_user.goods.build(comment_id: params[:comment_id])
    good.save
  end

  def destroy
    good = Good.find_by(comment_id: params[:comment_id], user_id: current_user.id)
    good.destroy
  end

  private
  def set_variables
    @comment = Comment.find(params[:comment_id])
    @id_name = "#like-link-#{@comment.id}"
  end
  
end
