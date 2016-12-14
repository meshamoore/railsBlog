class CommentsController < ApplicationController

  # GET /comments
  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.user_id = params[:user_id]
    @comment.post_id = params[:post_id]

    if params[:content] == ''
      flash[:alert] = "Please add a comment."
      redirect_to("/comments/new")
    else 
      @comment.save
      flash[:notice] = "Comment successfully created!"
      redirect_to("/posts")
    end
  end

  def new
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = "Comment successfully deleted!"
    redirect_to("/posts")
  end
end