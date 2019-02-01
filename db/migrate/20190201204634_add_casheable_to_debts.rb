class AddCasheableToDebts < ActiveRecord::Migration[5.0]
  def change
    add_reference :debts, :casheable, polymorphic: true, index: true
  end
end
