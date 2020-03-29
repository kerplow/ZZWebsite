class CreateShoppingItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_items do |t|
      t.string :item
      t.float :price, precision: 2
      t.belongs_to :user         , foreign_key: true, index: true
      t.belongs_to :shopping_list, foreign_key: true, index: true

      t.timestamps
    end
  end
end
