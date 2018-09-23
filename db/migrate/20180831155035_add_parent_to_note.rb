class AddParentToNote < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :parent_id, foreign_key: true
  end
end
