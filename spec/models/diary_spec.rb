require 'rails_helper'

RSpec.describe Diary, type: :model do
  
  before do
    @diary = FactoryBot.build(:diary)
  end 
  
  describe '日記新規作成記録' do
    context '内容に問題ない場合' do 
      it '全ての値が適切に入力されれば登録できる' do
        expect(@diary).to be_valid
      end

      it 'imagesが空でも登録できる' do
        @diary.images = nil
        expect(@diary).to be_valid
      end

      it 'textが空でも登録できる' do
        @diary.text = nil
        expect(@diary).to be_valid
      end

      it 'weightが空でも登録できる' do
        @diary.weight = nil
        expect(@diary).to be_valid
      end

      it 'feed_management_idが空でも登録できる' do
        @diary.feed_management_id = nil
        expect(@diary).to be_valid
      end

    end

    context '内容に問題がある場合' do 
      it 'weightが全角の場合登録できない' do
        @diary.weight = '１２３'
        @diary.valid?
        expect(@diary.errors.full_messages).to include("体重は半角数字で入力してください")
      end

      it 'ユーザーが紐付いていなければ登録できない' do
        @diary.user = nil
        @diary.valid?
        expect(@diary.errors.full_messages).to include('Userを入力してください')
      end

      it '同一ユーザの中でcreated_onが重複していると登録できない' do
        @diary.save
        another_diary = FactoryBot.build(:diary)
        another_diary.created_on = @diary.created_on
        another_diary.user_id = @diary.user_id
        another_diary.valid?
        expect(another_diary.errors.full_messages).to include("今日の日記は既に作成されております。トップページへ戻って確認してください。")
      end
    end
  end
end
