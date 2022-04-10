class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :set_item, only: [:edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :items_name, :description,
      :category_id, :condition_id, :shipping_fee_id,
      :prefecture_id, :shipping_date_id, :price
    ).merge(user_id: current_user.id)
  end
end
