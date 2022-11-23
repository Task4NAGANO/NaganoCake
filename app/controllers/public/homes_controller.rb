class Public::HomesController < ApplicationController
  #before_action :authenticate_customer!, except:[:top]
  def top
    @genres = Genre.all
    @items = Item.page(params[:page]).per(4)
  end

  def about
    @customer = current_customer
  end
end
