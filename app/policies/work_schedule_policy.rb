# frozen_string_literal: true

class WorkSchedulePolicy < ApplicationPolicy
  def index?
    access?
  end

  def new?
    access?
  end

  def edit?
    access?
  end

  def update?
    access?
  end

  def create?
    access?
  end

  private

  def access?
    admin? || user.permissions.map(&:to_sym).include?(:work_schedules)
  end
end