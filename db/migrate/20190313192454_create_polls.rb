class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.string :name
      t.text :description
      t.references :list

      t.timestamps
    end

    create_table :voteables do |t|
      t.references :poll
      t.references :choice, polymorphic: true
    end
  end
end
