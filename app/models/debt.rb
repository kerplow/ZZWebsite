class Debt < ApplicationRecord
  belongs_to :debtor, foreign_key: 'to_id', class_name: 'User'
  belongs_to :inner, foreign_key: 'from_id', class_name: 'User'
  belongs_to :cause, polymorphic: true, optional: true

  validates :amount, presence: true, numericality: true

  def propose

  end

  def collect
    if @accepted

    end
  end
end
