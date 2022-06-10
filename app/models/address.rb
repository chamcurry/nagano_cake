class Address < ApplicationRecord
  belongs_to :customer,optional: true
  # optional:true=外部キーがnillでもデータを保存できる
  def full_deliveries
    "〒"+self.postal_code + " " + self.address + " " + self.name
  end
end