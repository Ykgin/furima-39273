require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能'
    context '商品登録ができる場合' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない場合' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'カテゴリーのが未選択では登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it '商品の状態が未選択では登録できない' do
        @item.item_sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it '配送料の負担の情報が未選択では登録できない' do
        @item.item_shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it '発送元のが未選択では登録できない' do
        @item.item_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it '発送日数が未選択では登録できない' do
        @item.item_schedule_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item schedule delivery can't be blank")
      end
      it '価格が空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it '価格が300未満だと登録できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
      it '価格が10,000,000以上だと登録できない' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
      it '価格が全角だと登録できない' do
        @item.item_price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price は半角で入力してください")
      end
      it '価格が半角数字以外が含まれていると登録できない' do
        @item.item_price = "aaああ"
        @item.valid?
        expect(@item.errors.full_messages).to include( "Item price is not a number")
      end
    end
end
