class CommentsController < ApplicationController

  def create
    "asdf"
    comment = Comment.create(comment_params)
    redirect_to "#"
  end

  private
  def comment_params
    # params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
    params.require(:comment).permit(:user_id , :item_id)
  end

end
