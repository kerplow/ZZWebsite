class CreateCleaningTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :cleaning_tasks do |t|
      t.string :name
      t.text :description
      t.boolean :active, allow_nil: false, default: :false

      t.timestamps
    end

    create_table :room_tasks do |t|
      t.belongs_to :room, foreign_key: true, index: true
      t.daterange :week, index: true
      t.boolean :done, allow_nil: true
      t.belongs_to :cleaning_task, foreign_key: true, index: true

      t.timestamps
    end
  end
end
