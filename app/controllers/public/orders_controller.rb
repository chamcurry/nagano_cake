class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order =Order.new
    @address = Address.all
  end

  def confirm
    @order =Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_item = current_customer.cart_items.all
    if params[:order][:address_option] == "0"
    elsif params[:order][:address_option] == "1"
      @order.delivery_postal = Address.find(params[:order][:registered]).postal_code
      @order.delivery_adress = Address.find(params[:order][:registered]).address
      @order.delivery_name = Address.find(params[:order][:registered]).name
    elsif params[:address_option] == "2"
    end
    p@order
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
