require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_destination = FactoryBot.build(:order_destination, item_id: item.id, user_id: user.id)
    end

    context '入力に問題がない場合' do
      it 'building以外の項目が入力されていれば保存ができる' do
        expect(@order_destination).to be_valid
      end

      it 'post_codeが3桁ハイフン4桁であれば保存ができる' do
        expect(@order_destination).to be_valid
      end

      it 'post_codeとphone_numberが半角数値であれば保存できる' do
        expect(@order_destination).to be_valid
      end
      
      it 'phone_numberが10桁以上11桁以内であれば保存できる' do
        expect(@order_destination).to be_valid
      end

      it 'buildingは空でも保存できる' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end

      it 'itemが紐づいていれば保存できる' do
        expect(@order_destination).to be_valid
      end
    end

    context '入力に問題がある場合' do
      it 'tokenが空では保存できない' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空では保存できない' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形でないと保存できない' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空では保存できない' do
        @order_destination.prefecture_id = 0
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では登録できない' do
        @order_destination.block = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @order_destination.phone_number = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下なら登録できない' do
        @order_destination.phone_number = '123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが12桁以上なら登録できない' do
        @order_destination.phone_number = '123456789012'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'phone_numberは半角数値でなければ登録できない' do
        @order_destination.phone_number = 'あああああああああああ'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid.")
      end

      it 'itemが紐づいていないと保存できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end

      it 'userが紐づいていないと保存できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
