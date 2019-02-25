class Debt < ApplicationRecord
  belongs_to :to, class_name: 'User'
  belongs_to :from, class_name: 'User'
  belongs_to :cause, polymorphic: true, optional: true

  scope :from_user, ->(user) { where(from: user)}
  scope :to_user, ->(user) { where(to: user)}

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates_presence_of :to
  validates_presence_of :from
end
