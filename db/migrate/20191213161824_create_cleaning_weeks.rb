class CreateCleaningWeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :cleaning_weeks do |t|
      t.integer :week_number, index: true
      t.daterange :week_dates, index: true
    end

    remove_column :room_tasks, :week, :daterange
    add_column :room_tasks, :cleaning_week_id, :integer
    add_index :room_tasks, :cleaning_week_id
    add_foreign_key :room_tasks, :cleaning_weeks
  end
end
