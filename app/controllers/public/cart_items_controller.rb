class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_item = current_customer.cart_items.all
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item = current_customer.cart_items.all
    @cart_item.destroy_all
    redirect_to cart_items_path
  end

  def create
    # unless cart_item.item_id == current_customer.cart_items.all
    @cart_item =CartItem.new(cart_item_params)
    @cart_item.customer_id= current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  # else

  end
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
