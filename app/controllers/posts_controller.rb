class PostsController < ApplicationController

  # GET /posts
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)

    # NOTE: Hardcoding user ID for post create
    #       until we have implemented auth
    @post.user_id = User.first.id

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
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Post successfully updated!"
      redirect_to(post_path(@post.id))
    else
      render("edit")
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "Post successfully deleted!"
    redirect_to("/posts")
  end

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end