class CreateLostItems < ActiveRecord::Migration[5.0]
  def change
    create_table :lost_items do |t|
      t.string :name
      t.text :description
      t.references :found_by, foreign_key: {to_table: :users}
      t.references :lost_by, foreign_key: {to_table: :users}
      t.integer :status

      t.timestamps
    end
  end
end
