class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  
  validates :image, presence: true
  
  def add_tax_price
      (self.price * 1.10).round
  end
end