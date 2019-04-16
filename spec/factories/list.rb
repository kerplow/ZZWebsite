FactoryBot.define do
  factory :list do
    sequence :title do |n|
      "list-#{n}"
    end
    description { "test list" }

    trait :by_user do
      user
    end

    factory :list_with_options do
      transient do
        option_count { 5 }
      end

      after(:create) do |list, evaluator|
        create_list(:option, evaluator.option_count, list: list)
      end
    end
  end
end
