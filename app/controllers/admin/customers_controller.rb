class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    # @customers = Customer.all
    @kaminari = Customer.all.page(params[:page]).per(5)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customers_params)
    redirect_to admin_customer_path(@customer)
  end
  private
  def customers_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end
end
