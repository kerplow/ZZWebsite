class CleaningTask < ApplicationRecord
  belongs_to :room
  has_one :user, through: :room, association_name: :current_tenant

  validate :full_week

  scope :bitch, -> {
    where(task: task).where("week -|– ?::daterange AND week > ?::daterange", week, week).current_tenant
  }

  TASKS = { 'Trash upstairs': 0,'Trash downstairs': 1,'Kitchen': 2,'Take out recycling': 3,'Clearing hallways': 4 }

  enum task: TASK

  def full_week

  end
end
