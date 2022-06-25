class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details =@order.order_details
  end

  def update
  end
  # def order_params
  #   params.require(:order).permit(:id)
  # end
end