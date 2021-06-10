require 'rails_helper'
RSpec.describe User, type: :model do
 before do
  @user = FactoryBot.build(:user)
 end

  describe 'ユーザー新規登録' do
    context '新規登録できないとき' do
    it 'nickanameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
     it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
     it 'passwordが5文字以下では登録できない' do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'password_confirmationがpasswordと一致していないと登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '@を含まないemailは登録できない' do
      @user.email = "ab"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    end
     context '新規登録できるとき' do
      it '適切な値を入力すれば登録できる' do
      expect(@user).to be_valid
      end
     end
  end
 end