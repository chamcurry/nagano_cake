class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customers_params)
    redirect_to customers_my_page_path(@customer)
  end

  # def unsubscribe
  # end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: true)
    reset_session
    redirect_to root_path
  end
  private
  def customers_params
   params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email,)
  end
end