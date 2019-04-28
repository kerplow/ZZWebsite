class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.string :name
      t.text :description
      t.references :list

      t.timestamps
    end

    create_table :voteables do |t|
      t.references :poll, foreign_key: true
      t.references :choice, polymorphic: true, foreign_key: true
    end
  end
end
