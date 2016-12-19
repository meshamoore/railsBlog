class UsersController < ApplicationController
# GET /users
  def index
    @users = User.all
  end

  def create
  	@user = User.new(user_params)

    if @user.save
      flash[:notice] = "User successfully created!"
      redirect_to(new_post_path)
    else
      render("new")
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "User successfully updated!"
      redirect_to("/users")
    else
      render("edit")
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User successfully deleted!"
    redirect_to("/users")
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :avatar)
    end
end