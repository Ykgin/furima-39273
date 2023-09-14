class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :require_permission, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :item_name, 
      :item_info, 
      :item_category_id, 
      :item_sales_status_id,
      :item_shipping_fee_status_id, 
      :item_prefecture_id, 
      :item_schedule_delivery_id, 
      :item_price, 
    ).merge(user_id: current_user.id) 
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def require_permission
    unless current_user == @item.user
      redirect_to root_path
    end
  end
end
