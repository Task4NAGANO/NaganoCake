class Admin::OdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    #@total = @order_details.inject(0) { |sum, item| sum + item.subtotal }
    @order.shipping_cost = 800
    #@subtotal = order_detail.amount * order_detail.item.with_tax_price
    #@total = 0
  end

  def update
    order = Order.find(params[:id])
    order.update!
    redirect_to  admin_path
    order_detai = OrderDetail.find(params[:id])
    order_detai.update
    redirect_to admin_path
  end

  private


  def order_params
    params.require(:order).permit(:name, :address, :postal_code,
      :payment_method, :total_payment, :customer_id, :shipping_cost,
      :order_status)
  end

  def order_detai_params
    params.require(:order_detai).permit(:order_id, :item_id, :amount,
      :price, :making_status)
  end

end
