class FeedManagement < ApplicationRecord
  before_save do
    self.amount_eaten = yesterday_leftover + morning_addition + noon_addition + evening_addition - today_leftover
  end

  #バリデーション
  with_options presence: true do
    validates :yesterday_leftover
    validates :morning_addition
    validates :noon_addition
    validates :evening_addition
    validates :today_leftover
  end

  with_options numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください'} do 
    validates :yesterday_leftover
    validates :morning_addition
    validates :noon_addition
    validates :evening_addition
    validates :today_leftover
  end

  validates :created_on, presence: true, uniqueness: { scope: :user, message: 'はすでに作成されています。トップページに戻って確認してください' }

  # アソシエーション
  belongs_to :user
  has_one :diary
end
