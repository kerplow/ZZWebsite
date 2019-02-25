class CreatePlannerEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :planner_events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.boolean :is_public, default: true

      t.timestamps
    end
  end
end
