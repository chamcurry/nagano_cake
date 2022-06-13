class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order =Order.new
    @address = Address.all
  end

  def confirm
    @order =Order.new(order_params)
    @order.customer_id = current_customer.id
    p @order
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
  private
  def order_params
    params.require(:order).permit(:id,:customer_id,:delivery_adress,:delivery_postal,:delivery_name,:pay_method)
  end
end
