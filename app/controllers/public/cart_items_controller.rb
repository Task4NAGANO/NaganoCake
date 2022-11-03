class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end


  def create
    @cart_item = Cart_items.find(params[:id])
    @cart_item.save
    redirect_to root_path #とりあえずホーム画面に遷移している
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to root_path #とりあえずホーム画面に遷移している
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
