class AddParentToNote < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :parent_id, foreign_key: true
  end
end
