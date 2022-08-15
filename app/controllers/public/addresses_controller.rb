class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      # flash[:notice] = "You have created address successfully."
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end
  
  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path(address)
  end
  
  def destroy
    address = Address.find(params[:id])  
    address.destroy  
    redirect_to addresses_path 
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name,:postal_code,:address)
  end
end
