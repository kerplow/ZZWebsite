FactoryBot.define do
  factory :option do
    list
    sequence(:name) { |n| "option#{n}" }

    factory :option_from_user do
      user
    end
  end
end
