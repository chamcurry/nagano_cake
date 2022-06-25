class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def item_price
     price * amount
  end
end