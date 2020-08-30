class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]



  def index
    @items = Item.all.order('created_at DESC')
    @all_ranks = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    redirect_to root_path unless user_signed_in? && current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "編集しました"
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      flash[:notice] = "削除しました"
      redirect_to root_path
    else
      render :show
    end
  end


 


  private
  def item_params
    params.require(:item).permit(:name, :url, :code, :description).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end




end
