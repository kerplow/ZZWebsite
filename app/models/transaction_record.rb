class TransactionRecord < ApplicationRecord
  belongs_to :item
  belongs_to :buyer, class_name: 'User'
  belongs_to :seller, class_name: 'User'

  validates_presence_of :item
  validates_presence_of :buyer
  validates_presence_of :seller
end
