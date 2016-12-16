class CommentsController < ApplicationController

  # GET /comments
  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "Comment successfully created!"
      redirect_to :back
    else
      # render('posts/show')
    end
  end

  def new
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = "Comment successfully deleted!"
    redirect_to("/posts")
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
