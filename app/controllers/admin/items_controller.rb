class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new  
  end

  def index
  end

  def show
  end

  def edit
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "You have created genre successfully."
      redirect_to admin_item_path(@item.id)
    else
      @item = Item.all
      render :new
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:image,:genre_id,:name,:introduction,:price,:is_active)
  end
end
