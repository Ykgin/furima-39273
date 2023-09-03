class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_schedule_delivery
  
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_category_id, numericality: { other_than: 1 }
  validates :item_sales_status_id, numericality: { other_than: 1 }
  validates :item_shipping_fee_status_id, numericality: { other_than: 1 }
  validates :item_prefecture_id, numericality: { other_than: 1 }
  validates :item_schedule_delivery_id, numericality: { other_than: 1 }
  
  with_options presence: true, format: {with: /\A[0-9]+\z/, message: 'は半角で入力してください' } do
    validates :item_price
  end
  

end
