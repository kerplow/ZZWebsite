class AddGuestToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :house_status, default: 0
      t.belongs_to :room, index: true
    end
  end
end
