class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :positive_votes
      t.string :negative_votes
      t.references :voteable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
