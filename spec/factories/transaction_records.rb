FactoryBot.define do
  factory :transaction_record do
    sale_type { 1 }
    bidding_history { "MyString" }
    trading_price { "9.99" }
    item { nil }
    buyer { nil }
    seller { nil }
  end
end
