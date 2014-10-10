class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.create(comment_params)
    avatar = current_user.avatar_url(:thumb)
    
    @something = @comment.as_json
    @something["avatar_url"] = avatar
    @something["username"] = current_user.username

    render json: @something
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
