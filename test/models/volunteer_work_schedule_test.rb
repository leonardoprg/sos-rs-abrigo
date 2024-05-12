# frozen_string_literal: true

require 'test_helper'

class VolunteerWorkScheduleTest < ActiveSupport::TestCase
  test 'validates work_shift presence' do
    volunteer_work_schedule = VolunteerWorkSchedule.new
    assert_not volunteer_work_schedule.valid?

    assert_equal ['não pode ficar em branco'], volunteer_work_schedule.errors.messages[:work_shift]
  end

  test 'validates work_shift uniqueness' do
    volunteer_work_schedule = VolunteerWorkSchedule.new(
      user: users(:leonardo),
      work_schedule: work_schedules(:ulbra_today),
      role: roles(:admin),
      work_shift: 'night'
    )
    assert_not volunteer_work_schedule.valid?

    assert_equal ['já está em uso'], volunteer_work_schedule.errors.messages[:user_id]
  end
end
