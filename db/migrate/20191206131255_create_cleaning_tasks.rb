class CreateCleaningTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :cleaning_tasks do |t|
      t.belongs_to :room, foreign_key: true
      t.integer :task
      t.boolean :done

      t.timestamps
    end
  end
end
