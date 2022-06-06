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
     @cart_item =CartItem.new(cart_item_params)
     @cart_item.customer_id= current_customer.id
     @update_item = CartItem.find_by(item_id: @cart_item.item_id)
     if @update_item.present? && @cart_item.valid?
       @cart_item.amount += @update_item.amount
       @update_item.destroy
     end
     
     if @cart_item.save
      redirect_to cart_items_path
     else
       @item =Item.find(params[:cart_item][:item_id])
       @cart_item =CartItem.new
       render ("public/items/show")
     end
  end
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
