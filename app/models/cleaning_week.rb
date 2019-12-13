class CleaningWeek < ApplicationRecord
  has_many :room_tasks, inverse_of: :week
  has_many :cleaning_tasks, through: :room_tasks

  validates_uniqueness_of :week_dates
  validate :correct_week

  def self.for_date(date)
    if record = self.find_by('?::date <@ week_dates::daterange', date)
      return record
    end
    self.create(week_dates: date.beginning_of_week..date.end_of_week, week_number: date.strftime('%W'))
  end

  def self.for_week(number)
    byebug
    if record = self.find_by(week_number: number)
      return record
    else
      wkBegin = Date.commercial(Date.today.year, number+1, 3)
      self.for_date(wkBegin)
    end
  end

  def missing_tasks
    CleaningTask.all - self.cleaning_tasks
  end

  def full_schedule?
    CleaningWeek.cleaning_tasks.pluck(:id) == CleaningTask.active.pluck(:id)
  end

  def next_week
    self.class.for_date(week_dates.max + 1.days)
  end

  def previous_week
    self.class.for_date(week_dates.min - 1.days)
  end

  private

  def correct_week
    errors.add(:week_dates, 'not a mon-sunday week, use for_date(date) to generate a correct week') unless week_dates.min.monday? and week_dates.min.end_of_week == week_dates.max
    errors.add(:week_number, "doesn't match the dates, #{week_dates.min.strftime('%d %m %y')}-#{week_dates.max.strftime('%d %m %y')} is week number #{week_dates.min.strftime('%W')}") unless week_dates.min.strftime('%W').to_i == week_number
  end
end
