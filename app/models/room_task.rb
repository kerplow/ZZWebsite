class RoomTask < ApplicationRecord
  belongs_to :cleaning_task
  belongs_to :room
  belongs_to :week, class_name: 'CleaningWeek', foreign_key: :cleaning_week_id
  has_one :user, through: :room, source: :current_tenant

  enum cleaning_task: Hash[CleaningTask.active.pluck(:name, :id)], _suffix: :task

  validates_uniqueness_of :week, scope: :cleaning_task
  validate :active_task

  scope :this_week, -> { week.full_week }

  def bitch
    RoomTask.joins(:week).find_by(cleaning_weeks: { week_number: ((week.week_number+1)-1)%52+1 }) # (i-1)%j+1 to keep numbering from 1
  end

  def bitch_for
    RoomTask.joins(:week).find_by(cleaning_weeks: { week_number: ((week.week_number-1)-1)%52+1 }) # (i-1)%j+1 to keep numbering from 1
  end

  def who
    byebug
    user.name
  end

  def self.generate_week(date)
    week = date.beginning_of_week..date.end_of_week
    CleaningTask.active.pluck(:id).map do |task_id|
      RoomTask.find_or_create_by
    end
  end

  def self.week_roster_for(date)
    CleaningTask.includes(:room_tasks).where("?::date <@ room_tasks.week::daterange", date).references(:room_tasks).where(active: true)
  end

  def self.by_week
    RoomTask.joins(:cleaning_task).where(cleaning_tasks: { active: true }).group('week').pluck(:week, 'ARRAY_AGG(room_tasks.id)')
    # RoomTask.group(:id).group('daterange(room_tasks.week)')
  end

  private

  def active_task
    errors.add(:cleaning_task, 'is not active') unless cleaning_task.active?
  end
end
