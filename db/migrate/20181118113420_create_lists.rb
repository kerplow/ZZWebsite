class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.text :description
      t.boolean :is_poll?
      t.boolean :is_public?
      t.boolean :allow_anonymous?

      t.timestamps
    end
  end
end
