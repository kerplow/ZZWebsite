class AddSubjectToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :subject, :string, index: true
  end
end
