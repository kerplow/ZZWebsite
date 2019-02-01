class AddVoterToOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :options, :voters, :string
  end
end
