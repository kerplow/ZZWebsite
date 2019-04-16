class AddGuestToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :guest, :boolean, default: true
  end
end
