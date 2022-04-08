require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
      it 'items_nameが40文字以下であれば登録できる' do
        expect(@item).to be_valid
      end
      it 'descriptionが1000文字以下であれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが300円以上9,999,999円以内だと登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数値であれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'images_nameが空では登録できない' do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Images Name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_date_idが空では登録できない' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'items_nameが41文字以上なら登録できない' do
        @item.items_name = Faker::Name.items_name(max_length: 40)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item Name is too long (maximum is 40 characters)')
      end
      it 'descriptionが1000文字以上なら登録できない' do
        @item.description = Faker::Lorem.description(max_length: 1000)
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end
      it 'priceが299円以下なら登録できない' do
        @item.price = Faker::Commerce.price(min_length: 300)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが9999999円以上なら登録できない' do
        @item.price = Faker::Commerce.price(max_length: 9_999_999)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが全角数値なら登録できない' do
        @item.price = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Input half-width characters')
      end
    end
  end
end
