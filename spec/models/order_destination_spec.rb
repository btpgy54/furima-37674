require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_destination = FactoryBot.build(:order_destination, item_id: item.id, user_id: user.id)
    end

    context '入力に問題がない場合' do
      it '建物名以外の項目が入力されていれば保存ができる' do
        expect(@order_destination).to be_valid
      end

      it '建物名が空でも保存できる' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end

      it '郵便番号が3桁ハイフン4桁であれば保存ができる' do
        expect(@order_destination).to be_valid
      end

      it '郵便番号と電話番号が半角数値であれば保存できる' do
        expect(@order_destination).to be_valid
      end
      
      it '電話番号が10桁以上11桁以内であれば保存できる' do
        expect(@order_destination).to be_valid
      end

      it '商品が紐づいていれば保存できる' do
        expect(@order_destination).to be_valid
      end
    end

    context '入力に問題がある場合' do
      it 'カード情報が空では保存できない' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("カード情報を入力してください")
      end

      it '郵便番号が空では保存できない' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号を入力してください")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形でないと保存できない' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('郵便番号は不正な値です。ハイフンを含めて入力してください')
      end

      it '都道府県が空では保存できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("都道府県を入力してください")
      end

      it '市区町村が空では登録できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地が空では登録できない' do
        @order_destination.block = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号が空では登録できない' do
        @order_destination.phone_number = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号を入力してください")
      end

      it '電話番号が9桁以下なら登録できない' do
        @order_destination.phone_number = '123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が12桁以上なら登録できない' do
        @order_destination.phone_number = '123456789012'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号は不正な値です")
      end

      it '電話番号は半角数値でなければ登録できない' do
        @order_destination.phone_number = 'あああああああああああ'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号は不正な値です")
      end

      it '商品が紐づいていないと保存できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Itemを入力してください")
      end

      it 'ユーザーが紐づいていないと保存できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
