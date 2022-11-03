class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_to addresses_path
  end

  def update
    address = Address.find(params[:id])
    address.update(address_id)
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
