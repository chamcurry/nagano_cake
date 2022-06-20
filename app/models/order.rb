class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details,dependent: :destroy

  enum pay_method: {credit_card: 0,transfer: 1}

  # enum order_status: {"入金確認": 0,"製作中": 1,"制作完了": 3,"発送準備中": 4,"発送済み": 5}

  def order_deliveries
    "〒"+self.delivery_postal + " " + self.delivery_adress + " " + self.delivery_name
  end
end