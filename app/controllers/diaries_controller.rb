class DiariesController < ApplicationController
  before_action :get_last_data, only: [:index, :new]
  before_action :get_date, only: [:index, :new]
  def index

  end

  def new
    @diary = Diary.new
  end

  private

  # 今日の日付を取得
  def get_date
    @created_on = Date.today
  end

  # 最後のご飯記録レコードを取得
  def get_last_data
    @last_data = FeedManagement.last if FeedManagement.exists?
  end

end
