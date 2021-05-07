require 'rails_helper'

RSpec.describe FeedManagement, type: :model do
  before do
    @feed_management = FactoryBot.build(:feed_management)
  end

  describe 'ご飯記録' do
    context '内容に問題ない場合' do 
      it '全ての値が適切に入力されれば登録できる' do
        expect(@feed_management).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'yesterday_leftoverが空では登録できない' do
        @feed_management.yesterday_leftover = ''
        @feed_management.valid?
        expect(@feed_management.errors.full_messages).to include("昨日の残りを入力してください")
      end

      it 'yesterday_leftoverが全角数字では登録できない' do
        @feed_management.yesterday_leftover = '１２３'
        @feed_management.valid?
        expect(@feed_management.errors.full_messages).to include("昨日の残りは半角数字で入力してください")
      end

      it 'morning_additionが空では登録できない' do
        @feed_management.morning_addition = ''
        @feed_management.valid?
        expect(@feed_management.errors.full_messages).to include("朝の追加分を入力してください")
      end

      it 'morning_additionが全角数字では登録できない' do
        @feed_management.morning_addition = '１２３'
        @feed_management.valid?
        expect(@feed_management.errors.full_messages).to include("朝の追加分は半角数字で入力してください")
      end

      it 'noon_additionが空では登録できない' do
        @feed_management.noon_addition = ''
        @feed_management.valid?
        expect(@feed_management.errors.full_messages).to include("昼の追加分を入力してください")
      end

      it 'noon_additionが全角数字では登録できない' do
        @feed_management.noon_addition = '１２３'
        @feed_management.valid?
        expect(@feed_management.errors.full_messages).to include("昼の追加分は半角数字で入力してください")
      end

      it 'evening_additionが空では登録できない' do
        @feed_management.evening_addition = ''
        @feed_management.valid?
        expect(@feed_management.errors.full_messages).to include("夜の追加分を入力してください")
      end

      it 'evening_additionが全角数字では登録できない' do
        @feed_management.evening_addition = '１２３'
        @feed_management.valid?
        expect(@feed_management.errors.full_messages).to include("夜の追加分は半角数字で入力してください")
      end

      it 'today_leftoverが空では登録できない' do
        @feed_management.today_leftover = ''
        @feed_management.valid?
        expect(@feed_management.errors.full_messages).to include("今日の残りを入力してください")
      end

      it 'today_leftoverが全角数字では登録できない' do
        @feed_management.today_leftover = '１２３'
        @feed_management.valid?
        expect(@feed_management.errors.full_messages).to include("今日の残りは半角数字で入力してください")
      end

      it 'created_onが重複していると登録できない' do
        @feed_management.save
        another_feed_management = FactoryBot.build(:feed_management)
        another_feed_management.created_on = @feed_management.created_on
        another_feed_management.valid?
        expect(another_feed_management.errors.full_messages).to include("Created onはすでに存在します")
      end

    end
  end
end
