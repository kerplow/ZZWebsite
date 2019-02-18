class Pricetag < ApplicationRecord
  belongs_to :user
  belongs_to :listing, polymorphic: true

  enum operation: { buy: 0, sell: 1 }
  enum state: { listed: 0, completed: 1, cancelled: 2 }
  enum transaction_type: { direct_sale: 0, auction: 1 }

  validates :user, presence: true
  validates :listing, presence: true
  validates :operation, presence: true
end
