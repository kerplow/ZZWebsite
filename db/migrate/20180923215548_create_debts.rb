class CreateDebts < ActiveRecord::Migration[5.0]
  def change
    create_table :debts do |t|
      t.float :amount
      t.integer :from_id
      t.integer :to_id

      t.timestamps
    end
    add_foreign_key :debts, :users, column: 'from_id'
    add_foreign_key :debts, :users, column: 'to_id'
  end
end
