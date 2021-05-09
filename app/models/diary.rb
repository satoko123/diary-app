class Diary < ApplicationRecord
  # バリデーション
  validates :created_on, uniqueness: true

  # アソシエーション
  belongs_to :user
  belongs_to :feed_management
  has_one_attached :images # active_storageのためのアソシエーション
end
