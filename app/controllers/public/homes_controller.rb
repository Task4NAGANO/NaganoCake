class Public::HomesController < ApplicationController
  #before_action :authenticate_customer!, except:[:top]
  def top
    @genres = Genre.all
    @items = Item.all
  end
end
