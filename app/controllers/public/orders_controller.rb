class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method]
    @total = 0
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
    redirect_to confirm_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method)
  end


end
