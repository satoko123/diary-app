FactoryBot.define do
  factory :feed_management do
    yesterday_leftover       {100}
    morning_addition         {100}
    noon_addition            {100}
    evening_addition         {100}
    today_leftover           {100}
    created_on               {Faker::Date.between(from: '2014-09-23', to: '2021-04-1')}
    association :user 
  end
end
