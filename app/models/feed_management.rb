class FeedManagement < ApplicationRecord
  before_save do
    self.amount_eaten = yesterday_leftover + morning_addition + noon_addition + evening_addition - today_leftover
  end
  belongs_to :user
end
