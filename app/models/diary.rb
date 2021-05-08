class Diary < ApplicationRecord

  # アソシエーション
  belongs_to :user
  belongs_to :feed_management
end
