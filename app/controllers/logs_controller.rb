class LogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index, only: [:index]


  def index
    @log_shipping = LogShipping.new
  end

  def create
    @log_shipping = LogShipping.new(log_params)
    if @log_shipping.valid?
      pay_item
      @log_shipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def log_params
    params.require(:log_shipping).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: log_params[:token], 
        currency: 'jpy' 
      )
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.log != nil
      redirect_to root_path and return
    end
  end

end
