class Admin::HomesController < ApplicationController
  def top
    @orders=Order.all.order(created_at: :desc).page(params[:page]).per(7)
    # @kaminari = OrderDetail.all.page(params[:page]).per(7)
  end
end