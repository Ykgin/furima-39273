# テーブル設計

## usersテーブル

|Column            |Type  |Options                   |
|------------------|------|--------------------------|
|nickname          |string| null: false              |
|email             |string| null: false, unique: true|
|encrypted_password|string| null: false              |
|last_name         |string| null: false              |
|first_name        |string| null: false              |
|last_name_kana    |string| null: false              |
|first_name_kana   |string| null: false              |
|birthday          |date  | null: false              |

## association
- has_many :items
- has_many :orders

## itemsテーブル

|Column                  |Type      |Options                       |
|------------------------|----------|------------------------------|
|item_name               |string    |null: false                   |
|item_info               |text      |null: false                   |
|item_category           |string    |null: false                   |
|item_sales_status       |string    |null: false                   |
|item_shipping_fee_status|string    |null: false                   |
|item_prefecture         |string    |null: false                   |
|item_schedule_delivery  |string    |null: false                   |
|item_price              |integer   |null: false                   |
|user                    |references|null: false, foreign_key: true|

## association
- belongs_to :user
- has_one :order

## ordersテーブル
|Column|Type      |Options                       |
|------|----------|------------------------------|
|user  |references|null: false, foreign_key: true|
|item  |references|null: false, foreign_key: true|

## association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressesテーブル
|Column      |Type  |Options    |
|------------|------|-----------|
|postal_code |string|null: false|
|prefecture  |string|null:false |
|city        |string|null: false|
|address     |string|null: false|
|building    |string|           |
|phone_number|string|null: false|

## association
- belongs_to :order