class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order =Order.new
    @address = Address.all
  end

  def confirm
    @cart_item = current_customer.cart_items.all
    @order =Order.new(order_params)
    @order.customer_id = current_customer.id
    p@order
    if params[:address_option] == "0"
    elsif params[:address_option] == "1"
      @order.postal_code = Address.find(params[:id]).postal_code
      @order.address = Address.find(params[:id]).address
      @order.name = Address.find(params[:id]).name
    elsif params[:address_option] == "2"
    end
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
    params.require(:order).permit(:id,:customer_id,:delivery_adress,:delivery_postal,:delivery_name,:pay_method,:pay_amount)
  end
end
