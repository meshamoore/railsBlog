class FollowsController < ApplicationController

  def create
    target = User.find(params[:target_id])

    if target.nil?
      not_found
    else
      if false == current_user.following?(target)
        flash[:notice] = "You are now following #{target.name}!"
        Follow.create(user_id: current_user.id, target_id: params[:target_id])
      end
      redirect_to :back
    end
  end

  def new
    @follow = Follow.new
  end

  def show
    @follow = Follow.find(params[:id])
  end

  def destroy
    follow = Follow.find(params[:id])
    flash[:notice] = "You unfollowed #{follow.target.name}!"
    follow.destroy
    redirect_to :back
  end
end
