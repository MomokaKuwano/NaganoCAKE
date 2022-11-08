class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def information
    @cart_items = Item.all
    @order = Order.new(order_params)
    if params[:select_address][:option] == 0
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.first_name + current_customer.last_name
       render 'information'

    elsif params[:select_address][:option] == 1
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
       render 'information'

    else
      params[:select_address][:option] == 2
       render 'information'
    end
  end

  def completed
  end

  def index
  end

  def create
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :billing_amount, :payment_method, :address_id)
  end
end
