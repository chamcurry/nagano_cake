class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order =Order.new
    @address = Address.all
  end

  def confirm
    @order =Order.new(order_params)
    @order.save
    redirect_to confirm_order_path
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
    params.require(:order).permit(:delivery_adress,:delivery_postal,:delivery_name,:customer_id,:pay_method, :order_id, :address_id)
  end
end
