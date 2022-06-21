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
    @address = Address.find(params[:order][:registered])
    if params[:order][:address_option] == "0"
      @order.delivery_postal = current_customer.postal_code
      @order.delivery_adress = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option] == "1"
      @order.delivery_postal = @address.postal_code
      @order.delivery_adress = @address.address
      @order.delivery_name = @address.name
    elsif params[:address_option] == "2"
    end
    p@order
  end

  def complete
  end
  
  def create
    @order =Order.new(order_params)
    if @order.save
       current_customer.cart_items.destroy_all
     redirect_to orders_complete_path
    end
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
  end
  private
  def order_params
    params.require(:order).permit(:customer_id,:delivery_adress,:delivery_postal,:delivery_name,:pay_method,:pay_amount,:shipping_fee,:order_status)
  end
end
