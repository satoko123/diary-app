class Diary < ApplicationRecord

  # バリデーション
  validates :weight, numericality: { allow_nil: true, message: 'は半角数字で入力してください' }
  validates :created_on, presence: true, uniqueness: { scope: :user, message: 'は既に作成されております。トップページへ戻って確認してください。' }

  # アソシエーション
  belongs_to :user
  belongs_to :feed_management, optional: true
  has_many_attached :images # active_storageのためのアソシエーション
end
