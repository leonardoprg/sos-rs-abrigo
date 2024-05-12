# frozen_string_literal: true

require 'test_helper'

class WorkScheduleTest < ActiveSupport::TestCase
  test 'validates scheduled_date' do
    work_schedule = WorkSchedule.new
    assert_not work_schedule.valid?

    assert_equal work_schedule.errors[:scheduled_date], ['não pode ficar em branco']
  end
end
