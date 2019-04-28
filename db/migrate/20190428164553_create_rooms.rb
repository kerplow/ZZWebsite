class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.text :description
      t.string :location
      t.string :door
      t.references :owner, foreign_key: { to_table: :users }, index: true
      t.references :subrenter, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
