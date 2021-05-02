require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do 
      it 'email、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれない場合登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが全角英数混合では登録できない' do
        @user.password = 'ｕｓｅｒ１２'
        @user.password_confirmation = 'ｕｓｅｒ１２'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'use12'
        @user.password_confirmation = 'use12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordに英数字以外が含まれている場合登録できない' do
        @user.password = 'use12あ'
        @user.password_confirmation = 'use12あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordに数字が含まれていない場合登録できない' do
        @user.password = 'useuse'
        @user.password_confirmation = 'useuse'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordに英字が含まれていない場合登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが入力されてもpassword_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'user12'
        @user.password_confirmation = 'user21'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
