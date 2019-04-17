class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.text :description
      t.string :location
      t.string :door

      t.timestamps
    end
  end
end
