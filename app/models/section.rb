class Section < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  belongs_to :classroom
  has_and_belongs_to_many :students

  DURATIONS = [50, 80].freeze
  EARLIEST_TIME = '7:30AM'.freeze
  LATEST_TIME = '22:00PM'.freeze
  DEFAULT_DATE = '2000-01-01'.freeze
  TIME_RANGE_ALLOWED = Time.parse("#{DEFAULT_DATE} #{EARLIEST_TIME}")..Time.parse("#{DEFAULT_DATE} #{LATEST_TIME}")

  before_validation :set_end_time

  validates :days_of_week, presence: true
  validates :duration, presence: true, inclusion: { in: DURATIONS }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :validate_time_range

  def days_of_week=(days)
    self[:days_of_week] = days.map { |day| DAYS_OF_WEEK[day.to_sym] }
  end

  def days_of_week
    self[:days_of_week]&.map { |day| DAYS_OF_WEEK.key(day) }
  end

  def set_end_time
    if start_time.present? && duration.present?
      self.end_time = start_time + duration.minutes
    end
  end

  def validate_time_range
    return if start_time.blank? || end_time.blank?

    unless TIME_RANGE_ALLOWED.cover?(start_time) && TIME_RANGE_ALLOWED.cover?(end_time)
      errors.add(:base, 'Time range is outside the allowed range')
    end
  end
end
