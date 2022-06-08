class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order =Order.new
  end
  
  def confirm
    @order =Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
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
    params.permit(:delivery_adress,:delivery_postal,:delivery_name)
  end
end
