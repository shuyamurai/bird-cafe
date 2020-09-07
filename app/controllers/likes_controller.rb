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
  # 受け取ったパラメータのitem_idから商品インスタンスを作成(全てのアクションの前に実行)
  before_action :set_item
  # ログインしているかどうかを確認(全てのアクションの前に実行)
  before_action :authenticate_user!

  def create
    # ユーザーに紐づけられたLikeを作成しDBに保存
    @like = Like.create(user_id: current_user.id, item_id: @item.id)
  end

  def destroy
    # ユーザーに紐づけられたLikeを取得
    @like = current_user.likes.find_by(item_id: @item.id)
    # 取得したLikeを削除
    @like.destroy if @like.present?
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
