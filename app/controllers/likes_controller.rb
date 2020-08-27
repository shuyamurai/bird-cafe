class LikesController < ApplicationController
  before_action :set_item

  def create
    @like = Like.create(user_id: current_user.id, item_id: @item.id)
  end

  def destroy
    @like = current_user.likes.find_by(item_id: @item.id)
    @like.destroy
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end


