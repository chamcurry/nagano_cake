class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index,:show]
  def index
    @item =Item.new
    @items =Item.all
    @kaminari = Item.all.page(params[:page]).per(8)
  end
  def show
  end
end