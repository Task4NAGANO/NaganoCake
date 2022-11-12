class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method]
    @total = 0
    @select_address = params[:order][:select_address]
    if @select_address == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif @select_address == "1"
      
    end
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
