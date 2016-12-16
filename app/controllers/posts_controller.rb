class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in
  before_action :confirm_post_owner, except: [:new, :index]

  def index
    @posts = current_user.posts
  end

  def create
    @post = Post.new(post_params)

    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = "Post successfully created!"
      redirect_to(post_path(@post.id))
    else
      render('new')
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated!"
      redirect_to(post_path(@post.id))
    else
      render("edit")
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post successfully deleted!"
    redirect_to("/posts")
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def confirm_post_owner
      unless current_user.id == @post.user.id
        not_found
      end
    end
end