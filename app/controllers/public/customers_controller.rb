class Public::CustomersController < ApplicationController
  def show
    @customers = Customers.all
  end

  def edit
    @customers = Customers.all
  end

  def quit
  end
end
