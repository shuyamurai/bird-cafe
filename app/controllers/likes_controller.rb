# class LikesController < ApplicationController
#   before_action :set_item

#   def create
#     @like = Like.create(user_id: current_user.id, item_id: @items.id)
#   end

#   def destroy
#     @like = current_user.likes.find_by(item_id: @items.id)
#     @like.destroy
#   end

#   private
#   def set_item
#     @items = Item.find(params[:items_id])
#   end
# end


class LikesController < ApplicationController
  before_action :set_item

  def create
    @like = Like.create(user_id: current_user.id, item_id: @item.id)
    @likes = Like.where(like_id: @item.id)
  end

  def destroy
    @like = current_user.likes.find_by(item_id: @item.id)
    @like.destroy
    @likes = Like.where(like_id: @item.id)
  end

  private
  def set_item
    @item = Item.find(params[:items_id])
  end
end




