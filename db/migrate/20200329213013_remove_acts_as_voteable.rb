class RemoveActsAsVoteable < ActiveRecord::Migration[5.0]
  def change
    remove_column :options, :cached_votes_total
    remove_column :options, :cached_votes_score
    remove_column :options, :cached_votes_up
    remove_column :options, :cached_votes_down
    remove_column :options, :cached_weighted_score
    remove_column :options, :cached_weighted_total
    remove_column :options, :cached_weighted_average

    add_column :options, :down_voters, :string

    drop_table :votes
  end
end
