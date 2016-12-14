class FollowsController < ApplicationController

  def create
    @follow = Follow.new
    @follow.user_id = params[:user_id]
    @follow.target_id = params[:target_id]

    if target.nil?
      not_found
    else
      if false == current_user.following?(target)
        Follow.create(user_id: current_user.id, target_id: params[:id])
      end
      redirect back
    end
  end

  def new
    @follow = Follow.new
  end

  def show
    @follow = Follow.find(params[:id])
  end

  def destroy
    Follow.find(params[:id]).destroy
    flash[:notice] = "User unfollowed!"
  end

end
