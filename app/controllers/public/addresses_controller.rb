class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def edit
    @address = Addresses.find(params[:id])
  end
  
  def create
    @address = Address.new(address_params)
    if @address.save
      flash[:notice] = "You have created genre successfully."
      redirect_to _path(@address.id)
    else
      @address = Address.all
      render :new
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
    redirect_to '/books'  
  end
end
