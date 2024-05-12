# frozen_string_literal: true

class WorkSchedulesController < ApplicationController
  def index
    @work_schedules = current_user.organization.work_schedules.order('scheduled_date DESC')
  end

  def new
    @work_schedule = WorkSchedule.new
  end

  def edit
    @work_schedule = current_user.organization.work_schedules.find(params[:id])
  end

  def create
    @work_schedule = current_user.organization.work_schedules.new(work_schedule_params)
    if @work_schedule.save
      redirect_to edit_work_schedule_path(@work_schedule)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @work_schedule = current_user.organization.work_schedules.find(params[:id])
    if @work_schedule.update(work_schedule_params)
      redirect_to edit_work_schedule_path(@work_schedule)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def work_schedule_params
    params.require(:work_schedule).permit(:scheduled_date)
  end
end
