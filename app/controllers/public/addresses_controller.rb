class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_id)
    redirect_to addresses_path
  end
end
