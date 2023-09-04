class ItemShippingFeeStatus < ActiveHash::Base
  
  include ActiveHash::Associations
  has_many :items
end