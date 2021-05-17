class ShoppingList < ApplicationRecord
  # バリデーション
  validates :item_name, presence: true

  # アソシエーション
  belongs_to :user
end
