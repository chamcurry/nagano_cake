class Public::HomesController < ApplicationController
  before_action :authenticate_customer!,except: [:top]
  def top
    @items =Item
  end

  def about
  end
end
