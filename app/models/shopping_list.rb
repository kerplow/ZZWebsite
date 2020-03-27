class ShoppingList < ApplicationRecord
  has_many :shopping_items
  belongs_to :user
  has_many :users, through: :shopping_items

  enum status: {open: 0, locked: 1, finished: 2}

  def total_cost
    self.shopping_items.map(&:price).sum
  end

  def total_cost_for(user)
    self.shopping_items.where(user: user).map(&:price).sum
  end
end
