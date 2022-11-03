class Admin::OdersController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :shopping_cost, :total_payment, :payment_method)
  end
end
