class AddGuestToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.boolean :guest, default: true
      t.belongs_to :room, index: true
    end
  end
end
