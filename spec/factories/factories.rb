FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    contact_email { Faker::Internet.email }
    coding_languages { Faker::Lorem.sentence }
    bio { Faker::Lorem.paragraph }
    mentoring_needs { Faker::Lorem.sentence }

    association :user

    trait :mentor do
      after(:build) do |instance|
        instance.plan_types << 'mentor'
      end
    end

    trait :mentee do
      after(:build) do |instance|
        instance.plan_types << 'mentee'
      end
    end
  end

  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    comments { Faker::Lorem.paragraph }
  end
end