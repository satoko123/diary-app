FactoryBot.define do
  factory :diary do
      text       {"メモ"}
      weight     {2.5}
      created_on {Faker::Date.between(from: '2014-09-23', to: '2021-04-1')}
      association :user 
      association :feed_management

      after(:build) do |diary|
        diary.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end
