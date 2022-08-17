class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def completed
  end
  
  def confirm
  end
  
  private
  
  def orders_params
    params.require(:order).permit(:customer_id,:shipping_postal_code,:shipping_address,:shipping_name,:postage,:billing_amount,:payment_method,:status)
  end
end
