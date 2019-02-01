class AddParentToNote < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :parent, polymorphic: true, index: true
  end
end
