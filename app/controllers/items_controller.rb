class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @item = Item.new
  end

  def new
  end

  def create
    Item.create(content: params[:content])
  end

  private
end
