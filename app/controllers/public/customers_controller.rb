class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer.id
  end

  def edit
    @customer = current_customer.id
  end

  def update
    customer = current_customer.id
    customer.update(customer_params)
    redirect_to mypage_path(customer.id)
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

   private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end
