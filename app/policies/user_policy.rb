# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    admin? || user.permissions.map(&:to_sym).include?(:volunteers_list)
  end

  def new?
    admin? || user.permissions.map(&:to_sym).include?(:volunteers_create)
  end

  def edit?
    admin? || user.permissions.map(&:to_sym).include?(:volunteers_update)
  end

  def update?
    admin? || user.permissions.map(&:to_sym).include?(:volunteers_update)
  end

  def create?
    admin? || user.permissions.map(&:to_sym).include?(:volunteers_create)
  end
end
