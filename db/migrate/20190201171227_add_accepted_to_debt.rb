class AddAcceptedToDebt < ActiveRecord::Migration[5.0]
  def change
    add_column :debts, :accepted, :boolean, default: false
  end
end
