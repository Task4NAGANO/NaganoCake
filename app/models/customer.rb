class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def active_for_authentication?
    super && (is_deleted == false)
  end

  has_many :cart_items
  has_many :addresses
  has_many :orders

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :postal_code, presence: true
  #validates :addresses, presence: true
  validates :telephone_number, presence: true


end
