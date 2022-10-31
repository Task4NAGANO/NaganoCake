class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to root_path
  end

  def quit
  end


  private

  def customer_params
    params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)
  end

end
