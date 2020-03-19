class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
  end

  def destroy
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.destroy
  end
end
