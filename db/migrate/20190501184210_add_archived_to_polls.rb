class AddArchivedToPolls < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :archived, :boolean
  end
end
