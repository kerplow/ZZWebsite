class AddUserToPlannerEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :planner_events, :user, foreign_key: true, optional: true
  end
end
