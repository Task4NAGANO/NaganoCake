class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def log
    @order = Oder.find(params[:id])
  end

  def thanks
  end

  def index
  end

  def show
  end

  def create
    order = Order.new
    order.save
    redirect_to "root_path"
  end

  private
  def order_params
    params.require(:order).permit(:name, :address, :postal_code)
  end

end
