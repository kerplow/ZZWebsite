class ShoppingItem < ApplicationRecord
  belongs_to :user
  belongs_to :shopping_list

  validates :item, presence: true
end
