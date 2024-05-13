# frozen_string_literal: true

class WorkSchedule < ApplicationRecord
  belongs_to :organization

  validates :scheduled_date, presence: true, uniqueness: { scope: :organization_id }

  has_many :volunteer_work_schedules, dependent: :destroy
end
