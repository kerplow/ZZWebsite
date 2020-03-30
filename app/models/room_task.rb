class RoomTask < ApplicationRecord
  belongs_to :cleaning_task
  belongs_to :room
  belongs_to :week, class_name: 'CleaningWeek', foreign_key: :cleaning_week_id
  has_one :user, through: :room, source: :current_tenant, inverse_of: :room_tasks

  enum cleaning_task: Hash[CleaningTask.active.pluck(:name, :id).map! { |name, id| [name.underscore.gsub(' ','_'), id] }], _suffix: :task

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
    self.room ? self.room.tenant_name : 'not assigned'
  end

  def task
    cleaning_task.name
  end

  def switch_rooms(task)
    raise ArgumentError.new('not a room task') unless RoomTask === task
    query = <<-SQL
    UPDATE room_tasks AS rt SET room_id = CASE
      WHEN id = #{task.id.to_i} THEN #{self.room_id.to_i}
      WHEN id = #{self.id.to_i} THEN #{task.room_id.to_i}
    END
    WHERE id IN (#{task.id.to_i}, #{self.id.to_i})
    SQL
    ActiveRecord::Base.connection.execute(query)
    RoomTask.where(id: [self.id, task.id])
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
