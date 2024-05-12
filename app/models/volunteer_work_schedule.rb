# frozen_string_literal: true

class VolunteerWorkSchedule < ApplicationRecord
  belongs_to :user
  belongs_to :work_schedule
  belongs_to :role

  validates :work_shift, presence: true
  validates :user_id, uniqueness: { scope: %i[work_schedule_id role_id work_shift] }
end
