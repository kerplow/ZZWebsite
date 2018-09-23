class CreatePlannerEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :planner_events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.text :description

      t.timestamps
    end
  end
end
