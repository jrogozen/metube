class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.create(comment_params)
    redirect_to "/videos/#{params[:video_id]}"
  end

  def edit

  end

  def update
  end

  def destroy
    @comment = Comment.find(params["id"])
    @comment.destroy

    redirect_to "/"
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :video_id)
  end

end
