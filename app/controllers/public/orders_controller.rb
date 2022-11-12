class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def information
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
    @order.postage = 800
    @order.billing_amount = @order.postage+@total
    if params[:order][:select_address] == "0"
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name
       render 'information'
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
       render 'information'
    else
       params[:order][:select_address] == "2"
       render 'information'
    end
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      order_details = @order.order_details.new
      order_details.item_id = cart_item.item.id
      order_details.purchase_price = cart_item.item.add_tax_price
      order_details.amount = cart_item.amount
      order_details.save
    current_customer.cart_items.destroy_all
    redirect_to orders_completed_path
    end
  end

  def completed
  end

  def index
    @orders = Order.all
  end

  def show
  end

  private

    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :billing_amount, :payment_method )
    end
 end
