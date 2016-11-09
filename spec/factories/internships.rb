FactoryGirl.define do
  factory :internship do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    application_link { Faker::Internet.url }
    deadline { Faker::Date.between(Date.today, 2.months.from_now) }
    user
  end
end
