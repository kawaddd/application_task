class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def completed
  end
  
  def confirm
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:order][:select_address]=="0"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address]=="1"
      @address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = @address.postal_code
      @order.shipping_address = @address.address
      @order.shipping_name = @address.name
    else
      @order.shipping_postal_code = params[:order][:shipping_postal_code]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:shipping_name]
    end
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    if @order.save
      @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.unit_price = cart_item.item.price * 1.1
        @order_detail.amount = cart_item.amount
        @order_detail.save
      end
      # flash[:notice] = "You have created address successfully."
      current_customer.cart_items.destroy_all
      redirect_to orders_completed_path
    else
       @order = Order.new
       render :new
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :shipping_postal_code, :shipping_address, :shipping_name, :billing_amount)
  end
end
