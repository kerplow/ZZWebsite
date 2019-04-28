class AddActAsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :act_as, :integer, default: :user
  end
end
