class SessionsController < ApplicationController

  def create
  	@user = User.where(email: params[:email]).first
  	if @user && @user.password == params[:password]
  		session[:user_id] = @user.id
  		flash[:notice] = "you are logged in!"
  			redirect_to users_path
  	else
  		flash[:notice] = "Bad credentials"
  		redirect_to sessions_new_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to users_path
  end
end
