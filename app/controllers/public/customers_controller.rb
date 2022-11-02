class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(current_customer)
    redirect_to customer_path(current_customer)
  end

  def quit
  end

end
