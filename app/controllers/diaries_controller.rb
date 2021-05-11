class DiariesController < ApplicationController
  before_action :get_date, only: [:index]
  before_action :get_feed_management, only: [:index, :new]
  before_action :get_diary, only: [:index]
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  
  def index

  end

  def new 
   # 日記作成ページ経由の場合
   if params[:commit] == "保存して日記作成ページへ戻る"
    @created_on = session[:created_on].to_date
    @diary = Diary.new(text: session[:text], weight: session[:weight], created_on: @created_on)
   else
    @diary = Diary.new
    get_date
    get_feed_management
   end
  end

  def create
    binding.pry
    case params[:commit] 
    when "ご飯記録を更新する" # ご飯記録更新ページへ
      @feed_management = FeedManagement.find_by(created_on: params[:diary][:created_on])
      save_session
      redirect_to edit_feed_management_path(commit: params[:commit],id: @feed_management[:id]) # ご飯記録編集ページへ
    when "ご飯記録を作成する" # ご飯記録作成ページへ
      save_session
      redirect_to new_feed_management_path(commit: params[:commit], created_on: params[:diary][:created_on]) # ご飯記録作成ページへ
    else
      @feed_management = FeedManagement.find_by(created_on: params[:diary][:created_on])
      @diary = Diary.new(diary_params)
      if @diary.valid?
        @diary.save
        redirect_to diaries_path, flash: {success: "日記を保存しました"}
      else
        @created_on = @diary.created_on
        render :new
      end
    end
  end

  def list
    @diaries = Diary.order('created_on DESC')
  end
  
  def show
    @today_feed_management = FeedManagement.find_by(created_on: @diary.created_on) 
  end

  def edit
    # ご飯記録更新ページから戻ってきた場合
    if params[:commit] == "保存して日記編集ページへ戻る"
      created_on = session[:created_on].to_date
      @today_feed_management = FeedManagement.find_by(created_on: created_on ) 
      @diary.text = session[:text]
      @diary.weight = session[:weight]
    else
      @today_feed_management = FeedManagement.find_by(created_on: @diary.created_on) 
    end  
  end

  def update
    case params[:button]
    when "ご飯記録を更新する" # ご飯記録更新ページへ 
      save_session
      redirect_to edit_feed_management_path(button: params[:button], id: @diary.feed_management.id)
    when "ご飯記録を作成する" # ご飯記録作成ページへ
      save_session
      redirect_to new_feed_management_path(button: params[:button], created_on: params[:diary][:created_on]) 
    else
      @today_feed_management = FeedManagement.find_by(created_on: @diary.created_on)
      if @diary.update(diary_params)
        redirect_to diary_path(@diary.id), flash: {success: "日記を編集しました"}
      else 
        render :edit
      end
    end
  end

  def destroy
    @diary.destroy
    redirect_to action: :list
  end



  private

  # ストロングパラメータ
  def diary_params
    # ご飯記録がある場合
    if @today_feed_management != nil
      params.require(:diary).permit(:text, :weight, :created_on, images: []).merge(user_id: current_user.id, feed_management_id: @today_feed_management.id )
    # ご飯記録がない場合
    else
      params.require(:diary).permit(:text, :weight, :created_on, images: []).merge(user_id: current_user.id )
    end
  end

  # 今日の日付を取得
  def get_date
    @created_on = Date.today
  end

  # 今日のご飯記録レコードを取得
  def get_feed_management
    @today_feed_management = FeedManagement.find_by(created_on: @created_on) 
  end

  # 今日の日記データを取得
  def get_diary
    @today_diary = Diary.find_by(created_on: @created_on) 
  end

  # 日記の入力データを一時保存
  def save_session
    session[:text] = params[:diary][:text]
    session[:weight] = params[:diary][:weight]
    session[:created_on] = params[:diary][:created_on]
  end

  #idから該当日記データを取得
  def set_diary
    @diary = Diary.find(params[:id])
  end

end
