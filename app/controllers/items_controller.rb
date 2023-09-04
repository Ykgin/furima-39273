class ItemsController < ApplicationController
  def index
  
  end

  def new
    @item = Item.new
  end

  def create
    @Item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:items).permit(:item_name, :item_info, :item_category_id, :item_sales_status_id,
                                  :item_shipping_fee_status_id, :item_prefecture_id, :item_schedule_delivery_id, 
                                  :item_price, :image)
  end
end
