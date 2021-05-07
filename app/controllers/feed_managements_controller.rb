class FeedManagementsController < ApplicationController
  before_action :get_date, only: [:new, :edit]
  before_action :feed_management_yesterday, only: [:new, :edit]

  def new
    @feed_management = FeedManagement.new
  end

  def create
    @feed_management = FeedManagement.new(feed_management_params)
    if @feed_management.valid?
       @feed_management.save
      redirect_to root_path, flash: {success: "ご飯記録を保存しました"}
    else
      feed_management_yesterday
      render :new
    end
  end

  def edit
    @feed_management = FeedManagement.find(params[:id])
  end

  def update
    feed_management = FeedManagement.find(params[:id])
    if feed_management.valid?
      feed_management.update(feed_management_params)
      redirect_to root_path, flash: {success: "ご飯記録を更新しました"}
    else
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
    if FeedManagement.where(created_on: Date.today-1).exists?
      @feed_management_yesterday = FeedManagement.find_by(created_on: Date.today-1)
    end
  end

  # 今日の日付を取得
  def get_date
    @created_on = Date.today
  end

end
