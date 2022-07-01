class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  belongs_to :genre

  validates :image, presence: true

  enum is_active: {on_sale: true, stop_selling: false }

  def with_tax_price
      (price * 1.1).floor
  end

end