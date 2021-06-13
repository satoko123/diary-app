require 'rails_helper'

RSpec.describe ShoppingList, type: :model do
  before do
    @shopping_list = FactoryBot.build(:shopping_list)
  end

  describe '買い物リスト' do
    context '内容に問題ない場合' do 
      it 'item_nameが入力されれば登録できる' do
        expect(@shopping_list).to be_valid
      end
    end
    context '内容に問題がある場合' do 
      it 'item_nameが空では登録できない' do
        expect(@shopping_list).to be_valid
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @shopping_list.user = nil
        @shopping_list.valid?
        expect(@shopping_list.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
