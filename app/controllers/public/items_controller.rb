class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, only: [:show]
  
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end



  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end

end
