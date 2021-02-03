class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:title, :concept, :category_id, :product_condition_id, :shipping_charge_id, :shipping_area_id, :days_to_ship_id, :price, :image).merge(user_id:current_user.id)
  end
end