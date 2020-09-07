class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to "/items/#{comment.item.id}"
      flash[:notice] = 'コメントを投稿しました'
    else
      redirect_to "/items/#{comment.item.id}"
      flash[:notice] = 'コメントを入力してください'
    end
  end

  private

  def comment_params
    # params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
    params.require(:comment).permit(:user_id, :item_id, :comment)
  end
end
