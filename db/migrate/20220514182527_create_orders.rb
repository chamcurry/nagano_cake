class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :pay_amount
      t.integer :pay_method
      t.integer :shipping_fee
      t.integer :order_status
      t.string :delivery_postal
      t.string :delivery_adress
      t.string :delivery_name
      t.timestamps
    end
  end
end