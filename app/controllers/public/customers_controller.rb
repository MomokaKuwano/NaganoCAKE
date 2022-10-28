class Public::CustomersController < ApplicationController
  def show
    @cutomer = Customer.find(params[:id])
  end

  def edit
    
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

end
