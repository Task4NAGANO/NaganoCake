class Admin::OdersController < ApplicationController

  def show
    byebug
    @order_details = OrderDetail.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address,
      :shopping_cost, :total_payment, :payment_method)
  end
end
