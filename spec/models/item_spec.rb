require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it "全ての項目に入力できていれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "images_nameが空では登録できない" do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Images Name can't be blank")
      end
      it "descriptionが空では登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "categoryが空では登録できない" do
        @item.category = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "conditionが空では登録できない" do
        @item.condition = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_feeが空では登録できない" do
        @item.shipping_fee = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it "prefectureが空では登録できない" do
        @item.prefecture = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipping_dateが空では登録できない" do
        @item.shipping_date = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
    end
  end
end
      
