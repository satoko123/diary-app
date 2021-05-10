class Diary < ApplicationRecord
  # バリデーション
  validates :weight, numericality: { allow_nil: true, message: 'は半角数字で入力してください' }
  validates :created_on, uniqueness: true

  
  # アソシエーション
  belongs_to :user
  belongs_to :feed_management
  has_many_attached :images # active_storageのためのアソシエーション
end
