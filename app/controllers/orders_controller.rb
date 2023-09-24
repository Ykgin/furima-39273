class OrdersController < ApplicationController
  before_action :authenticate_user!, onry:[:index, :create]
  before_action :set_item, only:[:index, :create]
  before_action :require_permission, only:[:index, :create]
  
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code,:item_prefecture_id,:city,:address,:building,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def require_permission
    unless current_user == @item.user_id && !Order.exists?(item: @item)
      redirect_to root_path
    end
  end
end
