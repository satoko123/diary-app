class FeedManagementsController < ApplicationController
  def new
    @feed_management = FeedManagement.new
    @created_on = Date.today
    feed_management_yesterday
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
end
