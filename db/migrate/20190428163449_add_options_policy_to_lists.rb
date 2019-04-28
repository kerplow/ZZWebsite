class AddOptionsPolicyToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :options_policy, :integer
  end
end
