FactoryBot.define do
  factory :planner_event do
    sequence(:name) { |n| "Event #{n}" }
    description { "test event" }

    start_time { rand(10).days.ago }
    end_time { start_time+(5.hours) }

    trait :private do
      is_public { false }
    end
  end
end
