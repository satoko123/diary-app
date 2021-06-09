FactoryBot.define do
  factory :shopping_list do
    item_name       {"キャットフード"}
    association :user 
  end
end
