class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def unsubscribe
    @customer = current_customer
  end
  
  def update
    current_customer.update(customer_params)
    redirect_to mypage_path
  end
  
  def withdraw
    current_customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email)
  end
end
