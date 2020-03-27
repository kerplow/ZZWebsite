class CleaningTask < ApplicationRecord
  # after_create  :expand_room_task_scope
  # after_destroy :delete_room_task_scope
  # after_update  :update_room_task_scope

  has_many :room_tasks, dependent: :destroy
  has_many :rooms, through: :room_tasks
  has_many :users, through: :rooms, foreign_key: :user

  scope :active, -> { where(active: true) }
end
