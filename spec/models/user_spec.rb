require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できないとき' do
     it "ニックネームが必須であること" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "メールアドレスが必須であること" do
        @user.email = ''
        @user.valid?
       expect(@user.errors.full_messages).to include "Email can't be blank"
      end

     it "メールアドレスは、@を含む必要があること" do
        @user.email = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
     end

     it "重複したメールアドレスは登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
     end
    
      it "パスワードが必須であること" do
        @user.password = ''
        @user.valid?
       expect(@user.errors.full_messages).to include "Password can't be blank"
     end

      it "パスワードは、6文字以上での入力が必須であること" do
        @user.password = 'aa11'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end

      it "パスワードは、英語のみでは登録できないこと" do
       @user.password = 'aaaaaa'
        @user.valid?
       expect(@user.errors.full_messages).to include "Password is invalid"
     end

     it "パスワードは、数字のみでは登録できないこと" do
      @user.password = '111111'
       @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

    it "パスワードは、全角では登録できないこと" do
      @user.password = 'あああ１１１'
       @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end

     it "パスワードは、確認用を含めて2回入力すること" do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end

     it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
       @user.password_confirmation = 'aa11'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end

     it "ユーザー本名は、名字が必須であること" do
       @user.family_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Family name can't be blank"
     end

     it "ユーザー本名は、名前が必須であること" do
       @user.first_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "First name can't be blank"
     end

     it "ユーザー苗字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
       @user.family_name = 'a'
       @user.valid?
       expect(@user.errors.full_messages).to include "Family name is invalid"
     end

     it "ユーザー名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end

     it "ユーザー本名のフリガナは、名字が必須であること" do
       @user.family_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Family name kana can't be blank"
     end

     it "ユーザー本名のフリガナは、名前が必須であること" do
       @user.first_name_kana = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "First name kana can't be blank"
     end

     it "ユーザー苗字のフリガナは、全角（カタカナ）での入力が必須であること" do
       @user.family_name_kana = 'あ'
       @user.valid?
       expect(@user.errors.full_messages).to include "Family name kana is invalid"
     end

     it "ユーザー名前のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end

     it "生年月日が必須であること" do
       @user.birthday = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Birthday can't be blank"
     end
   end
   context '新規登録できるとき' do
      it "全てが揃っている場合は登録できること" do
        expect(@user).to be_valid
      end

      it "パスワードは、6文字が入力されていれば、登録が可能なこと" do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end

      it "パスワードは、半角英数字が混合されていれば、登録が可能なこと" do
       @user.password = 'aaa111'
       @user.password_confirmation = 'aaa111'
       expect(@user).to be_valid
      end
   end
  end
end