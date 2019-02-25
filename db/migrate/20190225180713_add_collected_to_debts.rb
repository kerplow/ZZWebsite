class AddCollectedToDebts < ActiveRecord::Migration[5.0]
  def change
    add_column :debts, :collected, :boolean
  end
end
