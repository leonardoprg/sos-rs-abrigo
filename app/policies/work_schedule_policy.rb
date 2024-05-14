# frozen_string_literal: true

class WorkSchedulePolicy < ApplicationPolicy
  def index?
    admin? || user.permissions.map(&:to_sym).include?(:work_schedules_list)
  end

  def new?
    admin? || user.permissions.map(&:to_sym).include?(:work_schedules_create)
  end

  def edit?
    admin? || user.permissions.map(&:to_sym).include?(:work_schedules_update)
  end

  def update?
    admin? || user.permissions.map(&:to_sym).include?(:work_schedules_update)
  end

  def create?
    admin? || user.permissions.map(&:to_sym).include?(:work_schedules_create)
  end
end
