# frozen_string_literal: true

class VolunteerWorkSchedulesController < ApplicationController
  before_action :load_work_schedule, :load_volunteers

  def new
    @volunteer_work_schedule = @work_schedule.volunteer_work_schedules.build
  end

  def create
    @volunteer_work_schedule = @work_schedule.volunteer_work_schedules.build(volunteer_work_schedule_params)
    if @volunteer_work_schedule.save
      redirect_to edit_work_schedule_path(@work_schedule, @volunteer_work_schedule)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    volunteer_work_schedule = @work_schedule.volunteer_work_schedules.find(params[:id])
    volunteer_work_schedule.destroy!
    redirect_to edit_work_schedule_path(@work_schedule)
  end

  private

  def load_work_schedule
    @work_schedule = current_user.organization.work_schedules.find(params[:work_schedule_id])
  end

  def volunteer_work_schedule_params
    params.require(:volunteer_work_schedule).permit(:user_id, :work_shift, :role_id)
  end

  def load_volunteers
    @volunteers = current_user.organization.users.joins(:roles).order('users.name ASC').distinct('users.id')
  end
end
