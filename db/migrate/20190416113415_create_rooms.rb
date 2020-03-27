class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.text :description
      t.string :location
      t.string :door
      t.references :owner         , foreign_key: { to_table: :users }, index: true, allow_null: true
      t.references :current_tenant, foreign_key: { to_table: :users }, index: true, allow_null: true
      t.integer :past_tenants, array: true
      t.string :tenant_name

      t.timestamps
    end
  end
end
