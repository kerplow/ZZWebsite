class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :name
      t.text :contents
      t.boolean :is_public, default: true

      t.timestamps
    end
  end
end
