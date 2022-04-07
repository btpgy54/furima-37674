class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all
  end

  def new
  end

  def create
    Item.create(content: params[:content])
  end
end
