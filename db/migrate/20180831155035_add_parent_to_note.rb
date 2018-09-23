class AddParentToNote < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :parent, index: true
    add_foreign_key :notes, :parent, column: :parent_id
  end
end
