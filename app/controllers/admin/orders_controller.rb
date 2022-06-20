class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.new(order_params)
  end

  def update
  end
  def order_params
    params.require(:order).permit(:item_id,:order_id,:price,:amount)
  end
end