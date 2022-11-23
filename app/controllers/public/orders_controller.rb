class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders
  end

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @cart_items = current_customer.cart_items
    @order.payment_method = params[:order][:payment_method]
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
      p @order
    elsif params[:order][:select_address] == "1"
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def thanks
  end


  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      create_order_details(@order)
      CartItem.destroy_all
      redirect_to thanks_orders_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :status,
      :payment_method, :total_payment, :customer_id, :shipping_cost)
  end

  def create_order_details(order)
    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.price
      order_detail.save
    end
  end


end
