require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it '必須情報があれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it '商品画像を1枚つけることが必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が必須' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明が必須' do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Introduction can't be blank"
      end
      it 'カテゴリーの情報が必須' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category is not a number"
      end
      it '商品状態の情報が必須' do
        @item.item_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition is not a number"
      end
      it '配送料の負担についての情報が必須' do
        @item.postage_type_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage type is not a number"
      end
      it '発送元の地域についての情報が必須' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture is not a number"
      end
      it '発送までの日数についての情報が必須' do
        @item.preparation_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Preparation day is not a number"
      end
      it 'カテゴリーの情報が1では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it '商品状態の情報が1では登録できないこと' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition must be other than 1"
      end
      it '配送料の負担についての情報が1では登録できないこと' do
        @item.postage_type_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Postage type must be other than 1"
      end
      it '発送元の地域についての情報が1では登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it '発送までの日数についての情報が1では登録できないこと' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Preparation day must be other than 1"
      end
      it '販売価格は、¥299では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '販売価格は、¥10,000,000では保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it '販売価格は全角文字では登録できない' do
        @item.price = "１１ああ"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '販売価格は半角英数字混合では登録できない' do
        @item.price = "11aa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '販売価格は半角英語だけでは登録できない' do
        @item.price = "aaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end 
end

