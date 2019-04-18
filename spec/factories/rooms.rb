FactoryBot.define do
  factory :room do
    sequence(:number) { |n| "#{n}" }
    description { "Testing room" }
    location { "Testspace" }
    door { "Painted" }
  end
end
