class ShoppingList < ApplicationRecord
  has_many :shopping_items, dependent: :destroy
  has_many :users, through: :shopping_items

  belongs_to :user

  enum status: {open: 0, locked: 1, finished: 2}, _suffix: :status
  serialize :user_totals, Hash

  def total_cost
    self.shopping_items.map(&:price).sum
  end

  def total_cost_for(user)
    self.shopping_items.where(user: user).map(&:price).sum
  end

  def users_names
    self.users.map(&:name).join(', ')
  end
end
