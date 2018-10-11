class Debt < ApplicationRecord
  belongs_to :debtor, foreign_key: 'to_id', class_name: 'User'
  belongs_to :inner, foreign_key: 'from_id', class_name: 'User'

  validates :amount, presence: true, numericality: true

end
