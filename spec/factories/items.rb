FactoryBot.define do
  factory :item do
    item_name                   { Faker::Lorem.word }
    item_info                   { Faker::Lorem.sentence }
    item_category_id            { rand(2..11) }
    item_sales_status_id        { rand(2..7) }
    item_shipping_fee_status_id { rand(2..3) }
    item_prefecture_id          { rand(2..48) }
    item_schedule_delivery_id   { rand(2..4) }
    item_price                  { rand(300..9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
