# frozen_string_literal: true

require 'test_helper'

class WorkSchedulesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:leonardo)
    @work_schedule = work_schedules(:ulbra_today)
  end

  test 'should get index' do
    get work_schedules_url
    assert_response :success
  end

  test 'should get new' do
    get new_work_schedule_url
    assert_response :success
  end

  test 'should create work schedule' do
    assert_difference('WorkSchedule.count') do
      post work_schedules_url, params: {
        work_schedule: {
          scheduled_date: '12/05/2030'
        }
      }
    end

    assert_redirected_to edit_work_schedule_path(WorkSchedule.last)
  end

  test 'should get edit' do
    get edit_work_schedule_url(@work_schedule)
    assert_response :success
  end

  test 'should update work_schedule' do
    patch work_schedule_url(@work_schedule), params: { work_schedule: { scheduled_date: '12/06/2030' } }
    assert_redirected_to edit_work_schedule_path(WorkSchedule.last)
  end
end
