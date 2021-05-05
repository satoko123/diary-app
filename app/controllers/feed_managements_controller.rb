class FeedManagementsController < ApplicationController
  def new
    @feed_management = FeedManagement.new

    if FeedManagement.exists?
      @feed_management_last = FeedManagement.last 
    end
  end

  def create
    @feed_management = FeedManagement.new(feed_management_params)
    if @feed_management.save
      redirect_to root_path, flash: {success: "ご飯記録を保存しました"}
    else
      render :new
    end
  end

  private

  def feed_management_params
    params.require(:feed_management).permit(:yesterday_leftover, :morning_addition, :noon_addition, :evening_addition, :today_leftover,
                                 :amount_eaten, :created_on).merge(user_id: current_user.id)
  end
  
end
