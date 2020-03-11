FactoryBot.define do
  factory :cleaning_task do
    room { nil }
    task { 1 }
    done { false }
  end
end
