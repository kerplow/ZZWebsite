class AddDefaultsToRoomTask < ActiveRecord::Migration[5.0]
  def change
    change_column :room_tasks, :done, :boolean, default: false
  end
end
