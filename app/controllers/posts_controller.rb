class PostsController < ApplicationController

  # GET /posts
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    @post.user_id = params[:user_id]

    if params[:title] || params[:content] == ''
      flash[:alert] = "All fields are required!"
      redirect_to("/posts/new")
    else 
      @post.save
      flash[:notice] = "Post successfully created!"
      redirect_to("/posts")
    end
  end

  def new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]

    if params[:title].empty? || false == @post.save
      flash[:alert] = "Failed to update title!"
      redirect_to("/posts/" + @post.id.to_s + "/edit")
    else 
      flash[:notice] = "Title successfully updated!"
      redirect_to("/posts")
    end
  
    if params[:content].empty? || false == @post.save
        flash[:alert] = "Failed to update post!"
        redirect_to("/posts/" + @post.id.to_s + "/edit")
    else 
        flash[:notice] = "Post successfully updated!"
        redirect_to("/posts")
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "Post successfully deleted!"
    redirect_to("/posts")
  end
end