class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true
      t.integer :votes

      t.timestamps
    end
  end
end
