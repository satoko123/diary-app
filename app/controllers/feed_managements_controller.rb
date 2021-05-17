class FeedManagementsController < ApplicationController
  before_action :set_feed_management, only: [:edit, :update]

  def new
    # 日記作成ページ経由の場合
    if params[:commit]
      @feed_management = FeedManagement.new
      @value_new = params[:commit]
      set_date
      feed_management_yesterday
    # 日記編集ページ経由の場合
    elsif params[:button]
      @feed_management = FeedManagement.new
      @value_new = params[:button]
      set_date
      feed_management_yesterday
    # トップページ経由の場合
    else
      @feed_management = FeedManagement.new
      get_date
      feed_management_yesterday
    end
  end

  def create
    @feed_management = FeedManagement.new(feed_management_params)
    if @feed_management.valid?
      @feed_management.save
      # 日記作成・編集ページ経由の場合
      if params[:commit] == "保存して日記作成ページへ戻る"
        redirect_to edit_diary_path(commit: params[:commit], id: @feed_management.diary.id)
      else
        # トップページ経由の場合
        redirect_to root_path, flash: {success: "ご飯記録を保存しました"}
      end
    else
      get_created_on
      feed_management_yesterday
      render :new
    end
  end

  def edit
    # 日記作成ページ経由の場合
    if params[:commit]
      get_created_on
      @value_new = params[:commit]
      feed_management_yesterday
    # 日記編集ページ経由の場合
    elsif params[:button]
      get_created_on
      @value_edit = params[:button]
      feed_management_yesterday
    else  
      get_created_on
      feed_management_yesterday
    end
  end

  def update
    if @feed_management.update(feed_management_params)
      #日記作成・編集ページ経由の場合
      if params[:commit] == "保存して日記ページへ戻る"
        redirect_to edit_diary_path(commit: params[:commit], id: @feed_management.diary.id)
      else 
        redirect_to root_path, flash: {success: "ご飯記録を更新しました"}
      end
      # トップページ経由の場合
    else 
      get_created_on
      feed_management_yesterday
      render :edit
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
    if FeedManagement.find_by(created_on: @created_on-1, user_id: current_user.id)
      @feed_management_yesterday = FeedManagement.find_by(created_on: @created_on-1, user_id: current_user.id)
    end
  end

  # 今日の日付を取得
  def get_date
    @created_on = Date.today
  end

  # 日記作成ページ経由の場合
  def set_date
    @created_on = params[:created_on].to_date
  end

  # テーブルからデータを取得
  def set_feed_management
    @feed_management = FeedManagement.find(params[:id])
  end

  # 新規作成時の日付を取得
  def get_created_on
    @created_on = @feed_management.created_on
  end
end
