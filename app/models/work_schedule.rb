# frozen_string_literal: true

class WorkSchedule < ApplicationRecord
  belongs_to :organization

  validates :scheduled_date, presence: true
end
