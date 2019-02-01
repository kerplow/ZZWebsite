class AddPrivateToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :private, :boolean, default: false
    add_column :lists, :allowed_voters, :string
  end
end
