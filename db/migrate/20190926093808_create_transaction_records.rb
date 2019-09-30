class CreateTransactionRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :transaction_records do |t|
      t.integer :sale_type
      t.string :bidding_history
      t.decimal :trading_price, precision: 5, scale: 2
      t.belongs_to :item, polymorphic: true
      t.belongs_to :buyer
      t.belongs_to :seller

      t.timestamps
    end

    add_foreign_key :transaction_records, :users, column: :buyer_id, primary_key: :id
    add_foreign_key :transaction_records, :users, column: :seller_id, primary_key: :id
  end
end
