class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  
  def order_params
    params.require(:order_address).permit(:postal_code,:item_prefecture_id,:city,:address,:building,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
