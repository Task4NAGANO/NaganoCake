class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
  end

    private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code,
      :payment_method, :total_payment, :customer_id, :shipping_cost)
  end

end
