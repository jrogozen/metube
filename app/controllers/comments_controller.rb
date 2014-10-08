class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    # @comment = Comment.create(comment_params)
    @comment = Comment.create(content: params["content"], user_id: 1, video_id: params["video_id"])

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
    params.require(:comment).permit(:content, :video_id, :user_id)
  end

end
