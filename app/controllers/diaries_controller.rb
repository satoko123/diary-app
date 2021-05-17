class DiariesController < ApplicationController
  before_action :get_date, only: [:index, :new]
  before_action :get_feed_management, only: [:new]
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  
  def index
    if user_signed_in? 
      get_feed_management
      get_diary
    end
  end

  def new 
    @diary = Diary.new
  end

  def create
    @today_feed_management = FeedManagement.find_by(created_on: params[:diary][:created_on], user_id: current_user.id)
    @diary = Diary.new(diary_params)
      if @diary.valid?
        @diary.save
        case params[:commit] 
        when "ご飯記録を更新する" # ご飯記録更新ページへ
          redirect_to edit_feed_management_path(commit: params[:commit],id: @today_feed_management[:id]) # ご飯記録編集ページへ
        when "ご飯記録を作成する" # ご飯記録作成ページへ
          redirect_to new_feed_management_path(commit: params[:commit], created_on: params[:diary][:created_on], user_id: current_user.id) # ご飯記録作成ページへ
        else
          redirect_to diaries_path, flash: {success: "日記を保存しました"}
        end
      else
        @created_on = @diary.created_on
        render :new
      end
  end

  def list
    @diaries = Diary.where(user_id: current_user.id).order('created_on DESC')
  end
  
  def show
    @today_feed_management = FeedManagement.find_by(created_on: @diary.created_on, user_id: current_user.id) 
  end

  def edit
    # ご飯記録ページから戻ってきた場合
    if params[:commit] == "保存して日記ページへ戻る"
      created_on = @diary.created_on
      @today_feed_management = FeedManagement.find_by(created_on: created_on, user_id: current_user.id ) 
    else
      @today_feed_management = FeedManagement.find_by(created_on: @diary.created_on,  user_id: current_user.id) 
    end  
  end

  def update
    @today_feed_management = FeedManagement.find_by(created_on: @diary.created_on, user_id: current_user.id)
    if @diary.update(diary_params)
      case params[:button]
      when "ご飯記録を更新する" # ご飯記録更新ページへ 
        redirect_to edit_feed_management_path(button: params[:button], id: @diary.feed_management.id)
      when "ご飯記録を作成する" # ご飯記録作成ページへ
        redirect_to new_feed_management_path(button: params[:button], created_on: params[:diary][:created_on], user_id: current_user.id) 
      else 
        redirect_to diary_path(@diary.id), flash: {success: "日記を編集しました"}
      end
    else 
      render :edit
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
    @today_feed_management = FeedManagement.find_by(created_on: @created_on, user_id: current_user.id) 
  end

  # 今日の日記データを取得
  def get_diary
    @today_diary = Diary.find_by(created_on: @created_on, user_id: current_user.id) 
  end

  #idから該当日記データを取得
  def set_diary
    @diary = Diary.find(params[:id])
  end
end
