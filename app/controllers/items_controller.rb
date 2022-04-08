class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @item = Item.new
  end

  def new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_date_id)
  end

end
