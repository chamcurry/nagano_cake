class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  belongs_to :genre

  validates :image, presence: true

  # def add_tax_price
  #     (self.price * 1.10).round
  # end
  def with_tax_price
      (price * 1.1).floor
  end

  # def subtotal
  #   cart_items.amount*with_tax_price
  # end
end