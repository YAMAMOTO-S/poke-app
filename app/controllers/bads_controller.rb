class BadsController < ApplicationController

  before_action :set_variables
  
  def create
    bad = current_user.bads.build(comment_id: params[:comment_id])
    bad.save
  end

  def destroy
    bad = Bad.find_by(comment_id: params[:comment_id], user_id: current_user.id)
    bad.destroy
  end


  private
  def set_variables
    @comment = Comment.find(params[:comment_id])
    @id_name = "#bad-link-#{@comment.id}"
  end
  
end
