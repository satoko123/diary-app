class DiariesController < ApplicationController
  before_action :get_last_data, only: [:index, :new]
  before_action :get_date, only: [:index]
  def index

  end

  def new 
   if params[:commit] == "保存して日記作成ページへ戻る"
    @created_on = session[:created_on].to_date
    @diary = Diary.new(text: session[:text],weight: session[:weight],created_on: @created_on)
   else
    @diary = Diary.new
    get_date
   end
  end

  def create
    case params[:commit] 
    when "ご飯記録を更新する" # ご飯記録更新ページへ
      save_session
      @feed_management = FeedManagement.find_by(created_on: params[:diary][:created_on])
      redirect_to edit_feed_management_path(commit: params[:commit], created_on: params[:diary][:created_on],id: @feed_management[:id]) # ご飯記録編集ページへ
    when "ご飯記録を作成する" # ご飯記録作成ページへ
      save_session
      redirect_to new_feed_management_path(commit: params[:commit], created_on: params[:diary][:created_on]) # ご飯記録作成ページへ
    else
      
    end
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

  # 日記の入力データを一時保存
  def save_session
    session[:text] = params[:diary][:text]
    session[:weight] = params[:diary][:weight]
    session[:created_on] = params[:diary][:created_on]
  end

end
