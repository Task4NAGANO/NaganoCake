class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]

  def index
    @items = Item.page(params[:page]).per(8)
    @item_all = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end



  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price,
      :is_actice, :genre_id)
  end

end
