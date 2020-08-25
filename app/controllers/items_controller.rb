class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "投稿しました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :url, :code, :description).merge(user_id: current_user.id)
  end

end
