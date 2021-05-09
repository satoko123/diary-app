class FeedManagementsController < ApplicationController
  before_action :set_feed_management, only: [:edit, :update]

  def new
    # 日記作成ページ経由の場合
    if params[:commit] == "ご飯記録を作成する"
      @feed_management = FeedManagement.new
      @value = params[:commit]
      set_date
      feed_management_yesterday
    else
    # 日記作成ページ経由でない場合
      @feed_management = FeedManagement.new
      get_date
    end
  end

  def create
    if params[:commit] == "保存して日記作成ページへ戻る"
      @feed_management = FeedManagement.new(feed_management_params)
      if @feed_management.valid?
        @feed_management.save
        redirect_to new_diary_path(commit: params[:commit])
      else
        get_created_on
        feed_management_yesterday
        render :new
      end
    else
      @feed_management = FeedManagement.new(feed_management_params)
      if @feed_management.valid?
        @feed_management.save
        redirect_to root_path, flash: {success: "ご飯記録を保存しました"}
      else
        get_created_on
        feed_management_yesterday
        render :new
      end
    end
  end

  def edit
    set_feed_management
    if params[:commit] == "ご飯記録を更新する"
      get_created_on
      @value = params[:commit]
      feed_management_yesterday
    else  
      get_created_on
      feed_management_yesterday
    end
  end

  def update
    set_feed_management
    if params[:commit] == "保存して日記作成ページへ戻る"
      if @feed_management.update(feed_management_params)
        redirect_to new_diary_path(commit: params[:commit])
      else
        get_created_on
        feed_management_yesterday
        render :edit
      end
    else 
      if @feed_management.update(feed_management_params)
        redirect_to root_path, flash: {success: "ご飯記録を更新しました"}
      else
        get_created_on
        feed_management_yesterday
        render :edit
      end
    end
  end

  private

  # ストロングパラメータ
  def feed_management_params 
    params.require(:feed_management).permit(:yesterday_leftover, :morning_addition, :noon_addition, :evening_addition, :today_leftover,
                                            :created_on).merge(user_id: current_user.id) # ログインユーザを追加
  end
  
  # 昨日のデータがある場合以下を実行
  def feed_management_yesterday
    if FeedManagement.where(created_on: @created_on-1).exists?
      @feed_management_yesterday = FeedManagement.find_by(created_on: @created_on-1)
    end
  end

  # 今日の日付を取得
  def get_date
    @created_on = Date.today
  end

  # 日記作成ページの場合
  def set_date
    @created_on = params[:created_on].to_date
  end

  # テーブルからデータを取得
  def set_feed_management
    @feed_management = FeedManagement.find(params[:id])
  end

  # 送られてきた日付を取得
  def params_created_on
    @created_on = feed_management_params[:created_on] 
  end

  # 新規作成時の日付を取得
  def get_created_on
    @created_on = @feed_management.created_on
  end
end
