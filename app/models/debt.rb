class Debt < ApplicationRecord
  belongs_to :to, class_name: 'User'
  belongs_to :from, class_name: 'User'
  belongs_to :cause, polymorphic: true, optional: true

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates_presence_of :to
  validates_presence_of :from
end
