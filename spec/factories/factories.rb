FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    contact_email { Faker::Internet.email }
    bio { Faker::Lorem.paragraph }
    mentoring_needs { Faker::Lorem.words }
  end

  factory :plan do
    trait :mentor do
      name "mentor"
    end
    trait :mentee do
      name "mentee"
    end
  end

  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    comments { Faker::Lorem.paragraph }
  end
end