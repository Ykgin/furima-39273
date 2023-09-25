FactoryBot.define do
  factory :order_address do
      postal_code { '123-4567' }
      item_prefecture_id { 6 }
      city { '秋田市中通'}
      address { '1-1' }
      building { 'ハイツ101' }
      phone_number { '09012345678'}
      token {Faker::Internet.password(min_length: 10, max_length: 20)}
  end
end
