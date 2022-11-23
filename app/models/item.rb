class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre, optional: true

  has_many :cart_items
  has_many :order_details

   validates :image, presence: true
   validates :name, presence: true
   validates :introduction, presence: true
   validates :price, presence: true
   #validates :is_active, presence: true
   validates :genre_id, presence: true

  def with_tax_price
    (price * 1.1).floor
  end


  #:price.to_s(:delimited, delimiter: ',')
end
