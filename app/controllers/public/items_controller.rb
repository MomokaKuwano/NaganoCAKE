class Public::ItemsController < ApplicationController
  def index
      @items = Item.where(is_active: true).page(params[:page]).per(8)
      @items_count = Item.where(is_active: true).count
  end

  def show
    @item = Item.find(params[:id])
  end

end
