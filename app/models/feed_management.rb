class FeedManagement < ApplicationRecord
  before_save do
    self.amount_eaten = yesterday_leftover + morning_addition + noon_addition + evening_addition - today_leftover
  end

  #バリデーション
  with_options presence: true, numericality: { with: /\A[0-9]+\z/}  do
    validates :yesterday_leftover
    validates :morning_addition
    validates :noon_addition
    validates :evening_addition
    validates :today_leftover
  end
  validates :created_on, presence: true, uniqueness: true

  # アソシエーション
  belongs_to :user
end
