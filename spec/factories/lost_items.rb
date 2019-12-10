FactoryBot.define do
  factory :lost_item do
    name { "MyString" }
    description { "MyText" }
    found_by { nil }
    lost_by { nil }
    status { 1 }
  end
end
