class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @item =Item.new
    # @items =Item.all
    @kaminari = Item.all.page(params[:page]).per(6)
  end
  def new
    @item =Item.new
  end
  def create
    @item =Item.new(item_params)
   if @item.save
    redirect_to admin_items_path
   else
    render new_admin_item_path
   end
  end

  def show
    @item =Item.find(params[:id])
  end

  def edit
    @item =Item.find(params[:id])
  end

  def update
     @item =Item.find(params[:id])
     @item.update(item_params)
     redirect_to admin_item_path(@item)
  end
  private
  def item_params
    params.require(:item).permit(:image,:name,:introduction,:price,:is_active,:genre_id)
  end
end