class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @orders = Order.all
  end

  def index
  end

  def show
  end

  def completed
  end
  
  def confirm
  end
end
