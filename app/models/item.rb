class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  belongs_to :genre
  
  validates :image, presence: true
  
  def add_tax_price
      (self.price * 1.10).round
  end
end