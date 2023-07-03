# frozen_string_literal: true

class Student < ApplicationRecord
  has_and_belongs_to_many :sections

  validate :no_time_conflicts

  def no_time_conflicts
    return if sections.empty?

    sections.each do |section|
      conflicting_sections = sections.where.not(id: section.id)
                                     .where('days_of_week @> ARRAY[?]::varchar[]', section.days_of_week)
                                     .where('start_time < ? AND end_time > ?', section.end_time, section.start_time)
      if conflicting_sections.exists?
        errors.add(:base, 'Selected sections have time conflicts.')
        break
      end
    end
  end
end
