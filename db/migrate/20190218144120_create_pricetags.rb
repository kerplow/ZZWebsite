class CreatePricetags < ActiveRecord::Migration[5.0]
  def change
    create_table :pricetags do |t|
      t.float :price
      t.references :user, foreign_key: true, index: true
      t.integer :operation
      t.integer :state, default: 0
      t.integer :transaction_type, default: 0
      t.references :listing, index: true, polymorphic: true
      t.text :description

      t.timestamps
    end
  end
end
