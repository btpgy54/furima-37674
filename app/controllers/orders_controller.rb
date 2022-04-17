class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :move_to_index, only: [:index, :show]

  def index
    @item = Item.find(params[:item_id])
    @order = OrderDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderDestination.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination
    ).permit(
     :post_code, :prefecture_id,
     :city, :block, :building, :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id != @item.user_id && @item.order != nil || current_user.id == @item.user_id && @item.order ==nil
      redirect_to root_path
    else 
      redirect_to new_user_session_path unless user_signed_in?
    end
  end
end