class CleaningWeek < ApplicationRecord
  has_many :room_tasks, inverse_of: :week
  has_many :cleaning_tasks, through: :room_tasks
  has_many :rooms, through: :room_tasks

  validates_uniqueness_of :week_dates
  validate :correct_week

  after_initialize :check_if_full_week

  def self.full
    self.includes(:cleaning_tasks, room_tasks: :rooms)
  end

  def self.for_date(date)
    if record = self.find_by('?::date <@ week_dates::daterange', date)
      return record
    else
      CleaningWeek.create(week_dates: date.beginning_of_week..date.end_of_week, week_number: date.strftime('%W'))
      self.find_by('?::date <@ week_dates::daterange', date)
    end
  end

  def self.for_week(number)
    if record = self.find_by(week_number: number)
      return record
    else
      wkBegin = Date.commercial(Date.today.year, number+1, 3)
      self.for_date(wkBegin)
    end
  end

  def full
    @full = true
    self
  end

  def missing_tasks
    CleaningTask.active.where.not(id: self.cleaning_tasks.pluck(:id))
  end

  def missing_task_ids
    CleaningTask.active.pluck(:id) - self.cleaning_tasks.pluck(:id)
  end

  def full_schedule?
     CleaningTask.active.pluck(:id) == self.cleaning_tasks.pluck(:id)
  end

  def next_week
    @full ?  self.class.full.for_date(week_dates.max + 1.days) : self.class.for_date(week_dates.max + 1.days)
  end

  def previous_week
    @full ?  self.class.full.for_date(week_dates.min - 1.days) : self.class.for_date(week_dates.min - 1.days)
  end

  def date_string
    "#{week_dates.min.strftime('%d/%m')}-#{week_dates.max.strftime('%d/%m')}"
  end


  private

  def check_if_full_week
    generate_tasks unless full_schedule?
  end

  def generate_tasks
    missing_tasks.each { |task| self.room_tasks << RoomTask.new(cleaning_task: task) }
  end

  def correct_week
    errors.add(:week_dates, 'not a mon-sunday week, use for_date(date) to generate a correct week') unless week_dates.min.monday? and week_dates.min.end_of_week == week_dates.max
    errors.add(:week_number, "doesn't match the dates, #{week_dates.min.strftime('%d %m %y')}-#{week_dates.max.strftime('%d %m %y')} is week number #{week_dates.min.strftime('%W')}") unless week_dates.min.strftime('%W').to_i == week_number
  end
end
