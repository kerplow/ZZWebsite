FactoryBot.define do
  factory :user do
    first_name { "John" }
    sequence(:last_name) { |n| "Doe#{n}" }
    sequence(:email) { |n| "user#{n}@email.com" }
    phone_number { Faker::PhoneNumber.phone_number }
    password { "password" }
    admin { false }

    trait :guest do
      house_status { :guest }
    end

    trait :housemate do
      house_status { :housemate }
    end

    trait :with_room do
      room
    end

    factory :admin_user do
      first_name { "Ad" }
      sequence(:last_name) { |n| "Min#{n}" }
      sequence(:email) { |n| "admin#{n}@email.com" }
      admin { true }
    end
  end
end
