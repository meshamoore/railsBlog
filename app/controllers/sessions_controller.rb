class SessionsController < ApplicationController

  def create
    user = params[:user]
  	@user = User.where(email: user[:email]).first
  	if @user && @user.password == user[:password]
  		session[:user_id] = @user.id
  		flash[:notice] = "You are logged in!"
			redirect_to posts_path
  	else
  		flash[:notice] = "Bad credentials"
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to users_path
  end
end
