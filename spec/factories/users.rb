FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@test.com" }
    sequence(:name) { |n| "name#{n}" }
    password { "password" }
    password_confirmation { "password" }

    trait :no_name do
      	name {}
    end

    trait :too_long_name do
      	 name { Faker::Lorem.characters(21) }
    end

    trait :too_short_name do
      	 name { Faker::Lorem.characters(1) }
    end

    trait :no_email do
    	email{}
    end
  end
end
