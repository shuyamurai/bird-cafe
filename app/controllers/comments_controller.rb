class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to "/"
    else
      asdf
    end
  end

  private
  def comment_params
    # params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
    params.require(:comment).permit(:user_id, :item_id, :comment)
  end

end
