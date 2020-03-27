class CreateShoppingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_lists do |t|
      t.string :name
      t.datetime :planned_time
      t.belongs_to :user
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
