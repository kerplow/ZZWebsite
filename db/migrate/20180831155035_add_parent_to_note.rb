class AddParentToNote < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :parent, foreign_key: true, index:false
  end
end
