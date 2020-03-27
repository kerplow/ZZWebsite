FactoryBot.define do
  factory :shopping_item do
    item { "MyString" }
    price { 1 }
    user { nil }
    shopping_list { nil }
  end
end
