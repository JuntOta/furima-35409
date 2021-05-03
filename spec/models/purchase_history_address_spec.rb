require 'rails_helper'

RSpec.describe PurchaseHistoryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_history_address = FactoryBot.build(:purchase_history_address, user_id: user.id, item_id: item.id)
    sleep (1)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it '必須情報があれば購入できる' do
        expect(@purchase_history_address).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと' do
        @purchase_history_address.token = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include "Token can't be blank"
      end
      it '配送先の情報として、郵便番号が必須であること' do
        @purchase_history_address.post_code = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include "Post code can't be blank"
      end
      it '配送先の情報として、都道府県が必須であること' do
        @purchase_history_address.prefecture_id = 1
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it '配送先の情報として、市区町村が必須であること' do
        @purchase_history_address.city = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include "City can't be blank"
      end
      it '配送先の情報として、番地が必須であること' do
        @purchase_history_address.house_number = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include "House number can't be blank"
      end
      it '配送先の情報として、電話番号が必須であること' do
        @purchase_history_address.phone_number = ""
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it '郵便番号の保存にはハイフンが必要であること（123-4567となる）' do
        @purchase_history_address.post_code = "1234567"
        @purchase_history_address.valid?
        expect(@purchase_history_address.errors.full_messages).to include "Post code is invalid"
      end
    end
  end
end
